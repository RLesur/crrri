#' Create a websocket connexion using the Chrome DevTools Protocol
#'
#' @name DevToolsConnexion
NULL

#' @export
DevToolsConnexion <- R6::R6Class("DevToolsConnexion",
  inherit = websocket::WebSocket,
# Public ------------------------------------------------------------------
  public = list(
    sendCommand = function(method, params = NULL, callback = NULL) {
      id <- private$getNewId()
      msg <- private$buildMessage(id, method, params)

      if (!is.null(callback)) {
        callback <- rlang::as_function(callback)
        private$checkCallback(callback)
      }

      newCallback <- function(value) {
        cat(sprintf("A response to the command #%i-%s was received.\n", id, method))
        if (!is.null(callback)) {
          cat("Executing the callback function...\n")
          callback(value)
        }
      }
      self$onEvent(method, params, newCallback, id)
      super$send(msg)
      cat(sprintf("Command #%i-%s sent.\n", id, method))
    },
    onEvent = function(method = NULL, params = NULL, callback = NULL, .id = NULL) {
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
          stop(paste0("Error - (code ", message$error$code, ") ", message$error$message))
        }
        caught <- private$listPartialMatch(target, message)
        if (!caught) return()
        on.exit({
          rmOnMsgCallback()
          rmOnDiscCallback()
          rmOnErrCallback()
        }, add = TRUE, after = FALSE)
        if (!is.null(callback)) {
          callback <- rlang::as_function(callback)
          callback(message)
        }
      })
      rmOnDiscCallback <- super$onClose(function(event) {
        on.exit({
          rmOnMsgCallback()
          rmOnDiscCallback()
          rmOnErrCallback()
        }, add = TRUE, after = FALSE)
        stop(paste("Client disconnected with code", event$code, "and reason", event$reason, "."))
      })
      rmOnErrCallback <- ws$onError(function(event) {
        on.exit({
          rmOnMsgCallback()
          rmOnDiscCallback()
          rmOnErrCallback()
        }, add = TRUE, after = FALSE)
        stop(paste("WebSocket connexion error:", event$message))
      })
    }
  ),

# Private -----------------------------------------------------------------
  private = list(
    getNewId = function() {
      sample(1:99999, 1)
    },
    buildMessage = function(id, method, params) {
      data <- list(id = id, method = method)
      if(!is.null(params))
        data <- c(data, list(params = params))
      jsonlite::toJSON(data, auto_unbox = TRUE)
    },
    checkCallback = function(callback) {
      if (!is.function(callback)) stop("The callback argument must be a function.")
      if (length(formals(callback)) != 1) stop("The callback function must have one argument and only one.")
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
    }
  )
)
