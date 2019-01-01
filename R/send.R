send <- function(promise, method, params = NULL, awaitResult = TRUE) {
  promises::then( # send is a wrapper of then
    promise,
    onFulfilled = function(value) {
      ws <- value$ws
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

sendToSession <- function(session, method, params = NULL, callback = NULL, listener = NULL) {
  stopifnot(!missing(method))
  CDPSession <- session$CDPSession
  next_listener <- session$next_listener
  if (is.null(next_listener) && is.null(listener)) {
    stop("You must provide a listener at the beginning of the pipe")
  }
  if (is.null(callback)) {
    callback <- ~ CDPSession$sendCommand(method, params)
  }
  if (is.null(listener)) listener <- next_listener
  CDPSession$once(listener, callback)
  invisible(list(CDPSession = CDPSession, next_listener = method))
}

listenTo <- function(session, listener, callback = NULL, params = NULL) {
  CDPSession <- session$CDPSession
  event_name <- sprintf("%s_%i", listener, sample(1:99999,1))
  CDPSession$once(listener, ~ CDPSession$emit(event_name, params))
  invisible(list(CDPSession = CDPSession, next_listener = event_name))
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
