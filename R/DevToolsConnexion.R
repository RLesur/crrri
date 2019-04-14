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
          self$emit('error', data$error)
        }
        # if a reponse to a command, emit the callback corresponding to the id
        if (!is.null(id)) {
          method_sent <- private$.commandList[[self$id]]$method
          private$.commandList[[self$id]] <- NULL
          self$emit(method_sent, data)
        }
        # if an event is fired, emit the corresponding listeners
        if (!is.null(method)) {
          self$emit(method, data)
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
      })
      reg.finalizer(ws, function(ws) { ws$close() })
      "!DEBUG ...websocket connexion configured."
      ws$connect()
      private$.CDPSession_con <- ws
    },
    sendCommand = function(method, params = NULL) {
      # increment id
      self$id <- 1
      msg <- private$.buildMessage(self$id, method, params)
      private$.CDPSession_con$send(msg)
      "!DEBUG Command #`self$id`-`method` sent."
      private$.commandList[[self$id]] <- list(method = method, params = params)
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
    .commandList = list()
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

