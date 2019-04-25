#' @importFrom assertthat assert_that is.number
#' @include wait.R
NULL

#' Hold while an asynchronous task runs
#'
#' The `hold()` function is a helper to turn a [promises::promise()] in a
#' synchronous value: the R session awaits the fulfillment of the promise
#' and returns the value of the fulfilled promise. An error is thrown if the
#' promise is rejected or a timeout expires. This is a wrapper around
#' [later::run_now()].
#'
#' This function must not be used inside a function that returns a promise.
#' Otherwise, this will lead to an infinite loop.
#'
#' @param x A [promises::promise()] object.
#' @param timeout Number scalar, timeout in seconds. An error is thrown if the
#'   promise is still pending when the delay expires.
#' @param msg Error message when the timeout expires.
#'
#' @return The value of the promise once resolved.
#' @export
#'
#' @examples
#' \dontrun{
#'
#' library(promises)
#' library(later)
#'
#' pr <- promise(~ later(~ resolve("result of the async task"), 1))
#' value <- hold(pr)
#' cat(value, "\n")
#' }
hold <- function(x, timeout = 30, msg = paste("The asynchronous job has not finished in the delay of", timeout, "seconds.")) {
  x <- promises::as.promise(x)
  assert_that(is.number(timeout))
  promise <- promises::promise_race(
    x,
    timeout(delay = timeout, msg = msg)
  )

  state <- new.env()
  state$pending <- TRUE

  promises::then(
    promise,
    onFulfilled = function(value) {
      state$pending <- FALSE
      state$fulfilled <- TRUE
      state$value <- value
    },
    onRejected = function(error) {
      state$pending <- FALSE
      state$fulfilled <- FALSE
      state$reason <- error
    }
  )

  while(state$pending) {
    later::run_now(all=FALSE)
  }

  if (state$fulfilled) {
    return(state$value)
  } else {
    stop(state$reason)
  }
}
