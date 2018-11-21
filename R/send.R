send <- function(promise, method, params = NULL) {
  promises::then( # send is a wrapper of then
    promise,
    onFulfilled = function(value) {
      ws <- value$ws
      # the returned object:
      promises::promise(function(resolve, reject) {
        callback <- function(message) {
          resolve(list(ws = ws, result = message$result))
        }
        ws$sendCommand(method, params, callback, reject)
      })
    }
  )
}

