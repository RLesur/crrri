# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command DOMDebugger.getEventListeners
#' 
#' Returns event listeners of the given object.
#' 
#' @param promise An asynchronous result.
#' @param objectId A Runtime.RemoteObjectId. 
#'        Identifier of the object to return listeners for. 
#' @param depth Optional. An integer. 
#'        The maximum depth at which Node children should be retrieved, defaults to 1. Use -1 for the
#'        entire subtree or provide an integer larger than 0. 
#' @param pierce Optional. A logical. 
#'        Whether or not iframes and shadow roots should be traversed when returning the subtree
#'        (default is false). Reports listeners for all contexts if pierce is enabled. 
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
DOMDebugger.getEventListeners <- function(promise, objectId, depth = NULL, pierce = NULL, awaitResult = TRUE) {
  method <- 'DOMDebugger.getEventListeners'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOMDebugger.removeDOMBreakpoint
#' 
#' Removes DOM breakpoint that was set using `setDOMBreakpoint`.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A DOM.NodeId. 
#'        Identifier of the node to remove breakpoint from. 
#' @param type A DOMBreakpointType. 
#'        Type of the breakpoint to remove. 
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
DOMDebugger.removeDOMBreakpoint <- function(promise, nodeId, type, awaitResult = TRUE) {
  method <- 'DOMDebugger.removeDOMBreakpoint'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOMDebugger.removeEventListenerBreakpoint
#' 
#' Removes breakpoint on particular DOM event.
#' 
#' @param promise An asynchronous result.
#' @param eventName A character string. 
#'        Event name. 
#' @param targetName Experimental. Optional. A character string. 
#'        EventTarget interface name. 
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
DOMDebugger.removeEventListenerBreakpoint <- function(promise, eventName, targetName = NULL, awaitResult = TRUE) {
  method <- 'DOMDebugger.removeEventListenerBreakpoint'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOMDebugger.removeInstrumentationBreakpoint
#' 
#' Removes breakpoint on particular native event.
#' 
#' @param promise An asynchronous result.
#' @param eventName A character string. 
#'        Instrumentation name to stop on. 
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
DOMDebugger.removeInstrumentationBreakpoint <- function(promise, eventName, awaitResult = TRUE) {
  method <- 'DOMDebugger.removeInstrumentationBreakpoint'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOMDebugger.removeXHRBreakpoint
#' 
#' Removes breakpoint from XMLHttpRequest.
#' 
#' @param promise An asynchronous result.
#' @param url A character string. 
#'        Resource URL substring. 
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
DOMDebugger.removeXHRBreakpoint <- function(promise, url, awaitResult = TRUE) {
  method <- 'DOMDebugger.removeXHRBreakpoint'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOMDebugger.setDOMBreakpoint
#' 
#' Sets breakpoint on particular operation with DOM.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A DOM.NodeId. 
#'        Identifier of the node to set breakpoint on. 
#' @param type A DOMBreakpointType. 
#'        Type of the operation to stop upon. 
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
DOMDebugger.setDOMBreakpoint <- function(promise, nodeId, type, awaitResult = TRUE) {
  method <- 'DOMDebugger.setDOMBreakpoint'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOMDebugger.setEventListenerBreakpoint
#' 
#' Sets breakpoint on particular DOM event.
#' 
#' @param promise An asynchronous result.
#' @param eventName A character string. 
#'        DOM Event name to stop on (any DOM event will do). 
#' @param targetName Experimental. Optional. A character string. 
#'        EventTarget interface name to stop on. If equal to `"*"` or not provided, will stop on any
#'        EventTarget. 
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
DOMDebugger.setEventListenerBreakpoint <- function(promise, eventName, targetName = NULL, awaitResult = TRUE) {
  method <- 'DOMDebugger.setEventListenerBreakpoint'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOMDebugger.setInstrumentationBreakpoint
#' 
#' Sets breakpoint on particular native event.
#' 
#' @param promise An asynchronous result.
#' @param eventName A character string. 
#'        Instrumentation name to stop on. 
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
DOMDebugger.setInstrumentationBreakpoint <- function(promise, eventName, awaitResult = TRUE) {
  method <- 'DOMDebugger.setInstrumentationBreakpoint'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOMDebugger.setXHRBreakpoint
#' 
#' Sets breakpoint on XMLHttpRequest.
#' 
#' @param promise An asynchronous result.
#' @param url A character string. 
#'        Resource URL substring. All XHRs having this substring in the URL will get stopped upon. 
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
DOMDebugger.setXHRBreakpoint <- function(promise, url, awaitResult = TRUE) {
  method <- 'DOMDebugger.setXHRBreakpoint'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}
