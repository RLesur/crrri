#' @include EventEmitter.R
#' @include domain.R
#' @include CDProtocol.R
#' @include utils.R
NULL

#' @export
CDPSession <- function(
  host = "localhost", port = 9222, secure = FALSE, ws_url = NULL,
  autoConnect = FALSE, local = FALSE
) {
  url <- build_url(host, port, secure)
  protocol <- CDProtocol$new(url = url, local = local)
  if(is.null(ws_url)) {
    ws_url <- chr_get_ws_addr(port = port)
  }
  CDPSession <- R6::R6Class(
    "CDPSession",
    inherit = CDPConnexion,
    public = list(
      initialize = function(ws_url, protocol, autoConnect) {
        super$initialize(ws_url = ws_url, autoConnect = FALSE)
        self$.__protocol__ <- protocol
        lapply(protocol$domains, function(name) self[[name]] <- domain(self, name))
        self$.__protocol__ <- protocol
        if(isTRUE(autoConnect)) {
          self$connect()
        }
      },
      .__protocol__ = NULL
    )
  )
  lapply(protocol$domains, function(domain) CDPSession$set("public", domain, NULL))
  client <- CDPSession$new(ws_url = ws_url, protocol = protocol, autoConnect = autoConnect)
  if(isTRUE(autoConnect)) {
    while(client$readyState() == 0L) {
      later::run_now()
    }
  }
  return(client)
}

CDPConnexion <- R6::R6Class(
  "CDPConnexion",
  inherit = EventEmitter,
  public = list(
    initialize = function(ws_url, autoConnect = FALSE) {
      "!DEBUG Configuring the websocket connexion..."
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
          self$emit("error", simpleError(paste0(data$error$message, ". code: ", data$error$code)))
        }
        # if a reponse to a command, emit a response event
        if (!is.null(id)) {
          self$emit("response", id = data$id, result = data$result)
        }
        # if an event is fired, emit the corresponding listeners
        if (!is.null(method)) {
          self$emit(method, data$params)
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
        # TODO use simpleError(event$message)
        self$emit("error", simpleError(event$message))
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
    disconnect = function() {
      if(self$readyState() < 2L) private$.CDPSession_con$close()
      while(self$readyState() < 3L) {
        later::run_now()
      }
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
    finalize = function() {
      self$disconnect()
    }
  )
)

chr_get_ws_addr <- function(host = "localhost", port = 9222, secure = FALSE) {
  url <- build_url(host, port, secure)
  "!DEBUG Retrieving Chrome websocket entrypoint at http://localhost:`port`/json ..."
  open_debuggers <- tryCatch(
    jsonlite::read_json(paste0(url, "/json"), simplifyVector = TRUE),
    error = function(e) list()
  )

  address <- open_debuggers$webSocketDebuggerUrl[open_debuggers$type == "page"]
  if (is.null(address))
    "!DEBUG ...websocket entrypoint unavailable."
  else
    "!DEBUG ...found websocket entrypoint `address`"

  address # NULL when fails
}

