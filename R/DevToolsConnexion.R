#' Create a websocket connexion using the Chrome DevTools Protocol
#'
#' @name CDPSession
NULL

#' @export
CDPSession <- R6::R6Class(
  "CDPSession",
  inherit = EventEmitter,
  public = list(
    initialize = function(ws_url) {
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
          self$emit("error", paste0("Error: '", data$error$message, "'(code ", data$error$code, ")."))
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
      self$on("ready", function() {
        private$.ready <- TRUE
      })
      self$on("command_will_be_sent", function(msg) {
        private$.ready <- FALSE
      })
      self$once("connect", function(obj) {
        self$emit("ready")
      })
      # when the command event is emitted, send a command to Chrome
      self$on("command", function(id = 1L, method, params = NULL, onresponse = NULL, onerror = NULL) {
        if(missing(id)) {
          # increment id
          self$id <- 1L
          id <- self$id
        }
        msg <- private$.buildMessage(id = id, method = method, params = params)
        id_sent <- id
        rm_onresponse <- NULL
        rm_onerror <- NULL
        if(!is.null(onresponse)) {
          onresponse <- rlang::as_function(onresponse)
          rm_onresponse <- self$on("response", function(id, result) {
            if(id == id_sent) {
              rm_onresponse()
              if(!is.null(rm_onerror)) rm_onerror()
              onresponse(result)
            }
          })
        }
        if(!is.null(onerror)) {
          onerror <- rlang::as_function(onerror)
          rm_onerror <- self$once("error", function(reason) {
            if(!is.null(rm_onresponse)) rm_onresponse()
            rm_onerror()
            onerror(reason)
          })
        }
        self$emit("command_will_be_sent", msg)
        private$.commandList[[id]] <- list(method = method, params = params)
        private$.CDPSession_con$send(msg)
        "!DEBUG Command #`id`-`method` sent."
        invisible(self)
      })
      # when a response event is fired, emit an event corresponding to the sent command
      self$on("response", function(id, result) {
        method_sent <- private$.commandList[[id]]$method
        private$.commandList[[id]] <- NULL
        self$emit(method_sent, result)
        if(length(private$.commandList) == 0) {
          self$emit("ready")
        }
      })
      reg.finalizer(ws, function(ws) { ws$close() })
      "!DEBUG ...websocket connexion configured."
      ws$connect()
      private$.CDPSession_con <- ws
    },
    sendCommand = function(method, params = NULL, onresponse = NULL, onerror = NULL, ...) {
      if(!is.null(onresponse)) {
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
      invisible(self)
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
    .ready = FALSE
  )
)


#' @export
DevToolsConnexion <- R6::R6Class("DevToolsConnexion",
  inherit = websocket::WebSocket,
# Public ------------------------------------------------------------------
  public = list(
    sendCommand = function(method, params = NULL, callback = NULL, onerror = cat) {
      id <- private$getNewId()
      msg <- private$buildMessage(id, method, params)

      if (!is.null(callback)) {
        callback <- tryCatch(
          rlang::as_function(callback),
          error = function(e) {
            onerror(as.character(e))
            NULL
          }
        )
        newCallback <- function(value) {
          "!DEBUG A response to the command #`id`-`method` was received."
          private$response <- value$result
          return(callback(value))
        }
        self$onEvent(method, params, newCallback, onerror, once = TRUE, .id = id)
      }

      super$send(msg)
      "!DEBUG Command #`id`-`method` sent."
      invisible(self)
    },

    onEvent = function(method = NULL, params = NULL, callback = NULL, onerror = cat, once = TRUE, .id = NULL) {
      target <- list()
      if (is.null(.id)) {
        target$method <- method
        target$params <- params
      } else {
        target$id <- .id
      }
      rmOnMsgCallback <- NULL
      rmOnDiscCallback <- NULL
      rmOnErrCallback <- NULL
      rmOnErrCallback <- super$onError(function(event) {
        on.exit({
          rmOnMsgCallback()
          rmOnDiscCallback()
          rmOnErrCallback()
        }, add = TRUE, after = FALSE)
        onerror(paste0("WebSocket connexion error: ", event$message, "\n"))
      })
      rmOnDiscCallback <- super$onClose(function(event) {
        on.exit({
          rmOnMsgCallback()
          rmOnDiscCallback()
          rmOnErrCallback()
        }, add = TRUE, after = FALSE)
        onerror(paste("Client disconnected with code", event$code, "and reason", event$reason, ".\n"))
      })
      rmOnMsgCallback <- super$onMessage(function(event) {
        message <- jsonlite::fromJSON(event$data)
        if (!is.null(message$error)) {
          on.exit({
            rmOnMsgCallback()
            rmOnDiscCallback()
            rmOnErrCallback()
          }, add = TRUE, after = FALSE)
          onerror(paste0("Error: ", message$error$message, "(code ", message$error$code, ").\n"))
          return()
        }
        caught <- private$listPartialMatch(target, message)
        if (!caught) return()

        if (is.null(.id)) {
          private$response <- message$params
          '!DEBUG Event "`method`" received.'
        }

        if (isTRUE(once))
          on.exit({
            rmOnMsgCallback()
            rmOnDiscCallback()
            rmOnErrCallback()
          }, add = FALSE, after = FALSE)

        if (!is.null(callback)) {
          callback <- tryCatch(
            rlang::as_function(callback),
            error = function(e) {
              onerror(as.character(e))
              NULL
            }
          )
        }
        if (!is.null(callback)) {
          private$callbackResult <-
            tryCatch(callback(message),
                     error = function(e) {
                       onerror(as.character(e))
                     }
            )
        }
      })

      if (is.null(.id)) {
        with_params <- ""
        if (!is.null(params)) {
          with_params <- sprintf(" with parameters %s = \"%s\"", names(params), params)
        }
        '!DEBUG Now listening for the event "`method`" `with_params`'
      }
      if (isTRUE(once)) {
        return(invisible(self))
      } else {
        return(
          invisible(function() {
            rmOnMsgCallback()
            rmOnDiscCallback()
            rmOnErrCallback()
          })
        )
      }
    }
  ),
# Active bindings ---------------------------------------------------------
  active = list(
    lastCallbackResult = function() private$callbackResult,
    lastCaughtResponse = function() private$response
  ),
# Private -----------------------------------------------------------------
  private = list(
    buildMessage = function(id, method, params) {
      data <- list(id = id, method = method)
      if(!is.null(params))
        data <- c(data, list(params = params))
      jsonlite::toJSON(data, auto_unbox = TRUE)
    },
    callbackResult = NULL,
    getNewId = function() {
      sample(1:99999, 1)
    },
    listPartialMatch = function(x, table) {
      # check names
      xnames <- names(x)
      if (!all(xnames %in% names(table)))
        return(FALSE)

      found <- mapply(function(elx, elt) {
        if (is.list(elx) & is.list(elt))
          return(private$listPartialMatch(elx, elt))
        else identical(elx, elt)
      },
      x, table[xnames]
      )

      all(found)
    },
    response = NULL
  )
)

#' Coerce to a promise
#'
#' See \code{promises::\link[promises]{is.promise}} for details.
#'
#' @name as.promise
#' @keywords internal
#' @importFrom promises as.promise
#' @export
NULL

#' @export
#' @rdname as.promise
as.promise.DevToolsConnexion <- function(x) {
  promises::promise(function(resolve, reject) {
    if (x$readyState() <= 0) {
      x$onOpen(function(event) {
        resolve(list(ws = x, result = x$lastCaughtResponse))
      })
    }
    if (x$readyState() == 2 | x$readyState() == 3) {
      reject("Closed connexion.")
    }
    if (x$readyState() == 1) {
      resolve(list(ws = x, result = x$lastCaughtResponse))
    }
  })
}

