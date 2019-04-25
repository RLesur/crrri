#' Return a promise after a delay
#'
#' This is a helper function that returns a [promise][promises::promise] after
#' a delay. It can be used with any pipe and any object (see examples).
#'
#' The value of the returned promise depends on the class of `x`. If `x` can
#' be coerced to a [promise][promises::promise] (using [promises::as.promise()]),
#' the value of the returned promise is identical to the value of
#' `promises::as.promise(x)` once fulfilled; otherwise the value of the
#' returned promise is `x` after the delay.
#'
#' @param x An object.
#' @param delay Number of seconds before resolving the promise.
#'
#' @return A [promise][promises::promise]. See details for the value of the
#'   fulfilled promise.
#' @export
#'
#' @examples
#' \donttest{
#' library(promises)
#'
#' value <- runif(1)
#' pr <- promise_resolve(value)
#'
#' # works with `magrittr` pipe
#' pr %>%
#'   wait(1) %>%
#'   then(~ cat(., "\n"))
#'
#' # works with `promises` pipe
#' pr %...>%
#'   wait(1) %...>%
#' { cat(., "\n") }
#'
#' # also works with any object
#' value %>%
#'   wait(1) %>%
#'   then(~cat(., "\n"))
#' }
wait <- function(x, delay = 0) {
  # if x is not a promise or cannot be coerced to a promise,
  # consider that it is the value of a resolved promise:
  if(!promises::is.promising(x)) {
    x <- promises::promise_resolve(x)
  }

  promises::then(
    x,
    onFulfilled = function(value) {
      promises::promise(function(resolve, reject) {
        later::later(~ resolve(value), delay)
      })
    }
  )
}

#' Set a timeout
#'
#' This is a helper function to set a timeout on a promise. It is designed to
#' be used with the `magrittr` pipe `%>%`.
#'
#' @param x An object.
#' @param delay Number of seconds before rejecting the promise.
#' @param msg Message if the timeout expires.
#'
#' @return A promise which fulfills when `x` fulfills before the delay expires:
#'   in this case, the value of the returned promise is the value of `x`. If
#'   `x` is not a fulfilled promise when the delay expires, the returned promise
#'   is rejected.
#' @export
#' @examples
#' \donttest{
#' library(promises)
#'
#' value <- runif(1)
#' pr <- promise(function(resolve, reject) ~ later::later(~ resolve(value), 0.1))
#'
#' pr %>%
#'   timeout(10) %...>%
#' { cat("value: ", ., "\n") } %...!%
#' { cat("error:", .$message, "\n") }
#' }
timeout <- function(x = NULL, delay = 0, msg = paste("The delay of", delay, "seconds expired.\n")) {
  reject_after_delay <- promises::promise(function(resolve, reject) {
    later::later(~ reject(simpleError(msg)), delay)
  })

  if(!promises::is.promising(x)) {
    x <- reject_after_delay
  }

  promises::promise_race(x, reject_after_delay)
}
