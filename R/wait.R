#' Wait to resolve a promise
#'
#' This is a helper function to add a waiting time after a promise resolution.
#' It is built on top of the `promises::then()` function. So, it can be used with
#' the `magrittr` pipe operators. The value of the resolved promise is the value
#' of the lhs: it can be used with `%>%` or `%T>%` with the same result.
#'
#' @param promise A promise.
#' @param delay Number of seconds before resolving the promise.
#'
#' @return A promise. The value of the promise is the same of the lhs promise.
#' @export
#'
#' @examples
#' library(promises)
#'
#' pr <- promise_resolve(runif(1))
#'
#' pr %>%
#'   wait(2) %>%
#'   then(~cat(., "\n"))
wait <- function(promise, delay = 0) {promises::then(
    promise,
    onFulfilled = function(value) {
      promises::promise(function(resolve, reject) {
        later::later(~ resolve(value), delay)
      })
    }
  )
}


#' Set a timeout
#'
#' @param delay Number of seconds before rejecting the promise.
#'
#' @return A promise that if rejected after a delay of `delay` seconds.
#' @export
timeout <- function(delay = 0) {
  promises::promise(function(resolve, reject) {
    later::later(~ reject(paste("The delay of", delay, "seconds expired.\n")), delay)
  })
}
