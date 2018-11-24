# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Testing.generateTestReport
#' 
#' Generates a report for testing.
#' 
#' @param promise An asynchronous result.
#' @param message A character string. 
#'        Message to be displayed in the report. 
#' @param group Optional. A character string. 
#'        Specifies the endpoint group to deliver the report to. 
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a void named list.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
Testing.generateTestReport <- function(promise, message, group = NULL, awaitResult = TRUE) {
  method <- 'Testing.generateTestReport'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}
