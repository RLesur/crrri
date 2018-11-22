# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command DOMSnapshot.disable
#' 
#' Disables DOM snapshot agent for the given page.
#' 
#' @param promise An asynchronous result.
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
DOMSnapshot.disable <- function(promise, awaitResult = TRUE) {
  method <- 'DOMSnapshot.disable'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOMSnapshot.enable
#' 
#' Enables DOM snapshot agent for the given page.
#' 
#' @param promise An asynchronous result.
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
DOMSnapshot.enable <- function(promise, awaitResult = TRUE) {
  method <- 'DOMSnapshot.enable'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOMSnapshot.captureSnapshot
#' 
#' Returns a document snapshot, including the full DOM tree of the root node (including iframes,
#'        template contents, and imported documents) in a flattened array, as well as layout and
#'        white-listed computed style information for the nodes. Shadow DOM in the returned DOM tree is
#'        flattened.
#' 
#' @param promise An asynchronous result.
#' @param computedStyles A list of string. 
#'        Whitelist of computed styles to return. 
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a named list of length 2.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
DOMSnapshot.captureSnapshot <- function(promise, computedStyles, awaitResult = TRUE) {
  method <- 'DOMSnapshot.captureSnapshot'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}
