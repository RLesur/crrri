#' Create a websocket connexion using the Chrome DevTools Protocol
#'
#' @name DevToolsConnexion
NULL

#' @export
DevToolsConnexion <- R6::R6Class("DevToolsConnexion",
  inherit = websocket::WebSocket,
# Public ------------------------------------------------------------------
  public = list(
    sendCommand = function(method, params = NULL, callback = NULL, onerror = rlang::as_function(~ cat(., "\n", sep = ""))) {
      id <- private$getNewId()
      msg <- private$buildMessage(id, method, params)

      if (!is.null(callback)) {
        callback <- rlang::as_function(callback)
      }

      newCallback <- function(value) {
        cat(sprintf("A response to the command #%i-%s was received.\n", id, method))
        if (!is.null(callback)) {
          cat("Executing the callback function...\n")
          return(callback(value))
        }
      }
      self$onEvent(method, params, newCallback, onerror, id)
      super$send(msg)
      cat(sprintf("Command #%i-%s sent.\n", id, method))
      invisible(self)
    },
    onEvent = function(method = NULL, params = NULL, callback = NULL, onerror = rlang::as_function(~ cat(., "\n", sep = "")), .id = NULL) {
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
      rmOnMsgCallback <- super$onMessage(function(event) {
        message <- jsonlite::fromJSON(event$data)
        if (!is.null(message$error)) {
          on.exit({
            rmOnMsgCallback()
            rmOnDiscCallback()
            rmOnErrCallback()
          }, add = TRUE, after = FALSE)
          onerror(paste0("Error: ", message$error$message, "(code ", message$error$code, ")."))
        }
        caught <- private$listPartialMatch(target, message)
        if (!caught) return()
        on.exit({
          rmOnMsgCallback()
          rmOnDiscCallback()
          rmOnErrCallback()
        }, add = FALSE, after = FALSE)
        if (!is.null(callback)) {
          callback <- rlang::as_function(callback)
          private$callbackResult <-
            tryCatch(callback(message),
                     error = function(e) {
                       onerror(as.character(e))
                     }
            )
        }
      })
      rmOnDiscCallback <- super$onClose(function(event) {
        on.exit({
          rmOnMsgCallback()
          rmOnDiscCallback()
          rmOnErrCallback()
        }, add = TRUE, after = FALSE)
        onerror(paste("Client disconnected with code", event$code, "and reason", event$reason, "."))
      })
      rmOnErrCallback <- ws$onError(function(event) {
        on.exit({
          rmOnMsgCallback()
          rmOnDiscCallback()
          rmOnErrCallback()
        }, add = TRUE, after = FALSE)
        onerror(paste("WebSocket connexion error:", event$message))
      })
      invisible(self)
    }
  ),
# Active bindings ---------------------------------------------------------
  active = list(
    result = function() private$callbackResult
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
          return(plmatch(elx, elt))
        else identical(elx, elt)
      },
      x, table[xnames]
      )

      all(found)
    },
    remoteProtocol = NULL
  )
)
