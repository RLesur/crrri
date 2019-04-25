#' @include EventEmitter.R
#' @include domain.R
#' @include CDProtocol.R
#' @include utils.R
#' @include hold.R
NULL

# Workaround an R CMD check false positive
# See https://github.com/STAT545-UBC/Discussion/issues/451#issuecomment-264598618
if(getRversion() >= "2.15.1")  utils::globalVariables(c("private", "super"))

#' Connect to a remote instance implementing the Chrome Debugging Protocol
#'
#' This function creates a websocket connection to a remote instance using
#' the Chrome Debugging Protocol.
#'
#' @param host Character scalar, the host name of the application.
#' @param port Numeric scalar, the remote debugging port.
#' @param secure Logical scalar, indicating whether the https/wss protocols
#'     shall be used for connecting to the remote application.
#' @param ws_url Character scalar, the websocket URL. If provided, `host` and
#'     `port` and `secure` arguments are ignored.
#' @param local Logical scalar, indicating whether the local version of the
#'     protocol (embedded in `crrri`) must be used or the protocol must be
#'     fetched _remotely_.
#' @param callback Function with one argument, executed when the R session is
#'     connected to Chrome. The connection object is passed to this function.
#'
#' @return The returned value depends on the value of the `callback` argument.
#'     When `callback` is a function, the returned value is a connection object
#'     of class `CDPSession`. When `callback` is `NULL` the returned value is
#'     a promise which becomes fulfilled once R is connected to the remote
#'     instance. Once fulfilled, the value of this promise is the connection
#'     object of class `CDPSession`.
#'
#' @export
CDPSession <- function(
  host = "localhost", port = 9222, secure = FALSE, ws_url = NULL,
  local = FALSE, callback = NULL
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
      initialize = function(ws_url, protocol, autoConnect, onconnect, onerror) {
        super$initialize(
          ws_url = ws_url,
          autoConnect = FALSE,
          onconnect = onconnect,
          onerror = onerror
        )
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

  if(!is.null(callback)) {
    onconnect <- rlang::as_function(callback)
    onerror <- stop
  } else {
    onconnect <- NULL
    onerror <- NULL
    pr <- promises::promise(function(resolve, reject) {
      onconnect <<- resolve
      onerror <<- reject
    })
  }
  client <- CDPSession$new(
    ws_url = ws_url,
    protocol = protocol,
    autoConnect = TRUE,
    onconnect = onconnect,
    onerror = onerror
  )
  if(is.null(callback)) return(pr)
  client
}

CDPConnexion <- R6::R6Class(
  "CDPConnexion",
  inherit = EventEmitter,
  public = list(
    initialize = function(ws_url, autoConnect = FALSE, onconnect = NULL, onerror = NULL) {
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
        self$emit("disconnect", self)
      })
      ws$onError(function(event) {
        "!DEBUG Client failed to connect: `event$message`."
        # TODO use simpleError(event$message)
        self$emit("error", simpleError(event$message))
      })
      super$on("ready", function() {
        private$.ready <- TRUE
      })
      super$on("command_will_be_sent", function(msg) {
        private$.ready <- FALSE
      })
      super$once("connect", function(client) {
        self$emit("ready")
      })
      rm_onerror <- NULL
      rm_onconnect <- NULL
      if(!is.null(onconnect)) {
        rm_onconnect <- super$once("connect", function(client) {
          if(!is.null(rm_onerror)) rm_onerror()
          onconnect(client)
        })
      }
      if(!is.null(onerror)) {
        rm_onerror <- super$once("error", function(err) {
          if(!is.null(rm_onconnect)) rm_onconnect()
          onerror(err)
        })
      }
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
          rm_onerror <- super$once("error", function(err) {
            rm_onresponse()
            rm_onerror()
            onerror(err)
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
        rm_onerror <- super$once("error", function(err) {
          rm_onsuccess()
          onerror(err)
        })
        return(pr)
      }
      super$once(eventName, callback)
      invisible(self)
    },
    readyState = function() {
      private$.CDPSession_con$readyState()
    },
    disconnect = function(callback = NULL) {
      if(!is.null(callback)) {
        callback <- rlang::as_function(callback)
      }
      # if the connection is already closed, return early
      if(self$readyState() == 3L) {
        if(!is.null(callback)) {
          on.exit(do.call(callback, list(self)), add = TRUE)
          return(self)
        } else {
          return(promises::promise_resolve(self))
        }
      }
      # here, we know that the connection is not closed
      # the `disconnect` event will fire.
      # If the connection is not closing, send the close command:
      if(self$readyState() < 2L) {
        on.exit(private$.CDPSession_con$close(), add = TRUE)
      }
      self$once("disconnect", callback = callback)
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
      if (self$readyState() < 2L) {
        hold(self$disconnect())
        message("WebSocket connection closed.")
      }
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
