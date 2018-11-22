# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Accessibility.disable
#' 
#' Disables the accessibility domain.
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
Accessibility.disable <- function(promise, awaitResult = TRUE) {
  method <- 'Accessibility.disable'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Accessibility.enable
#' 
#' Enables the accessibility domain which causes `AXNodeId`s to remain consistent between method calls.
#'        This turns on accessibility for the page, which can impact performance until accessibility is disabled.
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
Accessibility.enable <- function(promise, awaitResult = TRUE) {
  method <- 'Accessibility.enable'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Accessibility.getPartialAXTree
#' 
#' Fetches the accessibility node and partial accessibility tree for this DOM node, if it exists.
#' 
#' @param promise An asynchronous result.
#' @param nodeId Optional. A DOM.NodeId. 
#'        Identifier of the node to get the partial accessibility tree for. 
#' @param backendNodeId Optional. A DOM.BackendNodeId. 
#'        Identifier of the backend node to get the partial accessibility tree for. 
#' @param objectId Optional. A Runtime.RemoteObjectId. 
#'        JavaScript object id of the node wrapper to get the partial accessibility tree for. 
#' @param fetchRelatives Optional. A logical. 
#'        Whether to fetch this nodes ancestors, siblings and children. Defaults to true. 
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a named list of length 1.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
Accessibility.getPartialAXTree <- function(promise, nodeId = NULL, backendNodeId = NULL, objectId = NULL, fetchRelatives = NULL, awaitResult = TRUE) {
  method <- 'Accessibility.getPartialAXTree'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Accessibility.getFullAXTree
#' 
#' Fetches the entire accessibility tree
#' 
#' @param promise An asynchronous result.
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a named list of length 1.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
Accessibility.getFullAXTree <- function(promise, awaitResult = TRUE) {
  method <- 'Accessibility.getFullAXTree'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}
