#' Await a promise is resolved
#'
#' The `await` function is a helper to transform an asynchronous value to a
#' synchronous one. The R session returns once a \code{\link[promises]{promise}}
#' object is resolved or rejected. If the the promise is rejected an error is
#' thrown.
#'
#' The `await` function cannot be used with Shiny.
#'
#' @param x A \code{\link[promises]{promise}} object.
#'
#' @return The value of the promise once resolved.
#' @export
#'
#' @examples
#' \dontrun{
#'
#' library(promises)
#' library(crrri)
#' library(later)
#'
#' pr <- promise(~ later(~ resolve("result of the async task"), 1))
#' value <- await(pr)
#' cat(value, "\n")
#' }
await <- function(x) {
  promise <- promises::as.promise(x)
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
