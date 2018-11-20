send <- (function() {
  id <- 0

  function(promise, method, params = NULL) {
    id <<- id + 1

    promises::then( # send is a wrapper of then
      promise,
      onFulfilled = function(value) {
        ws <- value$ws
        # the returned object:
        promises::promise(function(resolve, reject) {
          rm_onMsg <- NULL
          rm_onError <- NULL
          rm_onClose <- NULL
          rm_onMsg <- ws$onMessage(function(event) {
            data <- jsonlite::fromJSON(event$data)
            if(!is.null(data$error)) {
              reject(paste0("Error (code: ", data$error$code, ") - ", data$error$message))
              rm_onMsg()
              rm_onError()
              rm_onClose()
              return()
            }
            if (!is.null(data$id)) {
              if (data$id == id) {
                cat(sprintf("A response to the command #%i-%s was received.\n", id, method))
                resolve(list(cnx = value$cnx, result = data$result))
                rm_onMsg()
                rm_onError()
                rm_onClose()
              }
            }
          })
          rm_onError <- ws$onError(function(event) {
            reject(paste("WebSocket connexion error:", event$message))
            rm_onMsg()
            rm_onError()
            rm_onClose()
          })
          rm_onClose <- ws$onClose(function(event) {
            reject(paste("Client disconnected with code", event$code, "and reason", event$reason, "."))
            rm_onMsg()
            rm_onError()
            rm_onClose()
          })
          ws$send(msg(id, method, params))
          cat(sprintf("Command #%i-%s sent.\n", id, method))
        })
      },
      onRejected = function(error) stop(error)
    )
  }
})()

msg <- function(id, method, params = NULL) {
  data <- list(id = id, method = method)
  if(!is.null(params))
    data <- c(data, list(params = params))
  jsonlite::toJSON(data, auto_unbox = TRUE)
}
