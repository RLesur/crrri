send <- function(promise, method, params = NULL, awaitResult = TRUE) {
  promises::then( # send is a wrapper of then
    promise,
    onFulfilled = function(value) {
      ws <- value$ws
      params <- sapply(simplify = FALSE, USE.NAMES = TRUE,
        params, function(x) {
          if ("formula" %in% class(x)) {
            f <- rlang::as_function(x)
            rlang::fn_fmls(f) <- c(rlang::fn_fmls(f), list(.res = quote(..1)))
            f(value$result)
          }
          else
            x
        }
      )

      previous_result <- value$result

      if(isTRUE(awaitResult)) {
        return(promises::promise(function(resolve, reject) {
          callback <- function(message) {
            resolve(list(ws = ws, result = message$result))
          }
          ws$sendCommand(method, params, callback, reject)
        }))
      } else {
        ws$sendCommand(method, params, callback = NULL, onerror = stop)
        return(list(ws = ws, result = previous_result))
      }
    }
  )
}

# each param could be of the form ~ .res$param or ~ .$param or ~ .x$param (all work)
listen <- function(promise, method, params = NULL, callback = NULL) {
  once <- is.null(callback)
  promises::then(
    promise,
    onFulfilled = function(value) {
      ws <- value$ws
      params <- sapply(simplify = FALSE, USE.NAMES = TRUE,
        params, function(x) {
          if ("formula" %in% class(x)) {
            f <- rlang::as_function(x)
            rlang::fn_fmls(f) <- c(rlang::fn_fmls(f), list(.res = quote(..1)))
            f(value$result)
          }
          else
            x
        }
      )

      if (isTRUE(once)) return(
        promises::promise(function(resolve, reject) {
          resolver <- function(message) {
            resolve(list(ws = ws, result = message$params))
          }
          ws$onEvent(method, params, resolver, reject)
        })
      )
      ws$onEvent(method, params, callback, stop, once)
    }
  )
}
