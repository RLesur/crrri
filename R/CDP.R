#' @include EventEmitter.R
#' @include CDProtocol.R
NULL

CDP <- function(ws_url, autoConnect = FALSE, url = "http://127.0.0.1:9222", local = TRUE) {
  protocol <- CDProtocol$new(url = url, local = local)
  CDPSession <- CDPSessionGenerator()
  client <- CDPSession$new(ws_url = ws_url, protocol = protocol, autoConnect = autoConnect)
  return(client)
}

CDPSessionGenerator <- function() {R6::R6Class(
  "CDPSession",
  inherit = EventEmitter,
  public = list(
    initialize = function(ws_url, protocol, autoConnect = FALSE) {
      "!DEBUG Configuring the websocket connexion..."
      private$.protocol <- protocol
      ws <- websocket::WebSocket$new(ws_url, autoConnect = FALSE)
      ws$onOpen(function(event) {
        self$emit("connect", self)
        "!DEBUG ...R succesfully connected to headless Chrome through DevTools Protocol."
      })
      ws$onMessage(function(event) {
        "!DEBUG Got message from Chrome: `event$data`"
        data <- jsonlite::fromJSON(event$data)
        id <- data$id
        method <- data$method
        # if error, emit an error
        if (!is.null(data$error)) {
          "!DEBUG error: `event$data`"
          self$emit("error", paste0(data$error$message, ". code: ", data$error$code))
        }
        # if a reponse to a command, emit a response event
        if (!is.null(id)) {
          self$emit("response", id = data$id, result = data$result)
        }
        # if an event is fired, emit the corresponding listeners
        if (!is.null(method)) {
          self$emit(method, params = data$params)
        }
      })
      ws$onClose(function(event) {
        "!DEBUG R disconnected from headless Chrome with code `event$code`"
        "!DEBUG and reason `event$reason`."
        # later::later(~ chr_close(chr_process, work_dir), delay = 0.2)
        self$emit("disconnect")
      })
      ws$onError(function(event) {
        "!DEBUG Client failed to connect: `event$message`."
        # later::later(~ chr_close(chr_process, work_dir), delay = 0.2)
        self$emit("error", event$message)
      })
      super$on("ready", function() {
        private$.ready <- TRUE
      })
      super$on("command_will_be_sent", function(msg) {
        private$.ready <- FALSE
      })
      super$once("connect", function(obj) {
        self$emit("ready")
      })
      # when the command event is emitted, send a command to Chrome
      super$on("command", function(id = 1L, method, params = NULL, onresponse, onerror = NULL) {
        if(missing(id)) {
          # increment id
          self$id <- 1L
          id <- self$id
        }
        msg <- private$.buildMessage(id = id, method = method, params = params)
        id_sent <- id

        rm_onresponse <- NULL
        rm_onerror <- NULL
        onresponse <- rlang::as_function(onresponse)
        rm_onresponse <- super$on("response", function(id, result) {
          if(id == id_sent) {
            rm_onresponse()
            if(!is.null(rm_onerror)) rm_onerror()
            onresponse(result)
          }
        })

        if(!is.null(onerror)) {
          onerror <- rlang::as_function(onerror)
          rm_onerror <- super$once("error", function(reason) {
            rm_onresponse()
            rm_onerror()
            onerror(reason)
          })
        }
        self$emit("command_will_be_sent", msg)
        private$.commandList[[as.character(id)]] <- list(method = method, params = params)
        private$.CDPSession_con$send(msg)
        "!DEBUG Command #`id`-`method` sent."
      })
      # when a response event is fired, emit an event corresponding to the sent command
      super$on("response", function(id, result) {
        method_sent <- private$.commandList[[as.character(id)]]$method
        private$.commandList[[as.character(id)]] <- NULL
        self$emit(method_sent, result)
        if(length(private$.commandList) == 0) {
          self$emit("ready")
        }
      })
      reg.finalizer(ws, function(ws) { ws$close() })
      "!DEBUG ...websocket connexion configured."
      private$.CDPSession_con <- ws
      if(isTRUE(autoConnect)) {
        ws$connect()
      }
    },
    connect = function() {
      private$.CDPSession_con$connect()
    },
    send = function(method, params = NULL, onresponse = NULL, onerror = NULL, ...) {
      if(async <- is.null(onresponse)) {
        pr <- promises::promise(function(resolve, reject) {
          onresponse <<- resolve
          onerror <<- reject
        })
      } else {
        onresponse <- rlang::as_function(onresponse)
      }
      if(!is.null(onerror)) {
        onerror <- rlang::as_function(onerror)
      }
      id <- list(...)$id
      if(is.null(id)) {
        self$emit("command", method = method, params = params, onresponse = onresponse, onerror = onerror)
      } else {
        self$emit("command", id = id, method = method, params = params, onresponse = onresponse, onerror = onerror)
      }
      if(async) return(pr)
      invisible(self)
    },
    on = function(eventName, callback = NULL) {
      if(is.null(callback)) {
        return(self$once(eventName))
      }
      super$on(eventName, callback)
      invisible(self)
    },
    once = function(eventName, callback = NULL) {
      if(is.null(callback)) {
        onerror <- NULL
        rm_onerror <- NULL
        rm_onsuccess <- NULL
        pr <- promises::promise(function(resolve, reject) {
          onerror <<- reject
          callback <<- function(...) {
            rm_onerror()
            result <- list(...)
            resolve(result)
          }
        })
        rm_onsuccess <- super$once(eventName, callback)
        rm_onerror <- super$once("error", function(reason) {
          rm_onsuccess()
          onerror(reason)
        })
        return(pr)
      }
      super$once(eventName, callback)
      invisible(self)
    },
    readyState = function() {
      private$.CDPSession_con$readyState()
    },
    close = function() {
      private$.CDPSession_con$close()
    }
  ),
  active = list(
    # Value assigned increment id
    id = function(value) {
      if (missing(value)) return(private$.lastID)
      if (is.null(value)) {
        private$.lastID <- 1L
      } else {
        private$.lastID <- private$.lastID + value
      }
      private$.lastID
    }
  ),
  private = list(
    .CDPSession_con = list(),
    .lastID = 0L,
    .buildMessage = function(id, method, params = NULL) {
      data <- list(id = id, method = method)
      if(!is.null(params))
        data <- c(data, list(params = params))
      jsonlite::toJSON(data, auto_unbox = TRUE)
    },
    .commandList = list(),
    .ready = FALSE,
    .protocol = NULL
  )
)}


