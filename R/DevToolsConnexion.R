#' Create a websocket connexion using the Chrome DevTools Protocol
#'
#' @name DevToolsConnexion
NULL

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
          cat(sprintf("A response to the command #%i-%s was received.\n", id, method))
          private$response <- value$result
          return(callback(value))
        }
        self$onEvent(method, params, newCallback, onerror, once = TRUE, .id = id)
      }

      super$send(msg)
      cat(sprintf("Command #%i-%s sent.\n", id, method))
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
          cat('Event"', method, '" received.\n')
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

      if (is.null(.id))
        cat('Now listening for the event "', method, '"',
            if (!is.null(params)) paste0(" with parameters ",
                                         paste(names(params), '="', params, '"', sep = '', collapse = ", ")),
            ".\n", sep = ""
        )

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
#' @param obj A DevTools connexion.
#'
#' @return A promise.
#' @export
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
