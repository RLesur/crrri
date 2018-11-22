# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event Overlay.inspectNodeRequested or create a callback
#' 
#' **Event description**:  
#' Fired when the node should be inspected. This happens after call to `setInspectMode` or when
#'        user manually inspects an element.
#' 
#' @param promise An asynchronous result object.
#' @param backendNodeId A DOM.BackendNodeId. 
#'        Id of the node to inspect. Accepted values: `~ .res$backendNodeId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"inspectNodeRequested"`)
#'        and an element `params` which is a named list. The `params` list is composed of
#'        the following element(s): `backendNodeId`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
Overlay.inspectNodeRequested <- function(promise, backendNodeId = NULL, .callback = NULL) {
  method <- 'Overlay.inspectNodeRequested'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Overlay.nodeHighlightRequested or create a callback
#' 
#' **Event description**:  
#' Fired when the node should be highlighted. This happens after call to `setInspectMode`.
#' 
#' @param promise An asynchronous result object.
#' @param nodeId A DOM.NodeId. 
#'         Accepted values: `~ .res$nodeId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"nodeHighlightRequested"`)
#'        and an element `params` which is a named list. The `params` list is composed of
#'        the following element(s): `nodeId`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
Overlay.nodeHighlightRequested <- function(promise, nodeId = NULL, .callback = NULL) {
  method <- 'Overlay.nodeHighlightRequested'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Overlay.screenshotRequested or create a callback
#' 
#' **Event description**:  
#' Fired when user asks to capture screenshot of some area on the page.
#' 
#' @param promise An asynchronous result object.
#' @param viewport A Page.Viewport. 
#'        Viewport to capture, in CSS. Accepted values: `~ .res$viewport` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"screenshotRequested"`)
#'        and an element `params` which is a named list. The `params` list is composed of
#'        the following element(s): `viewport`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
Overlay.screenshotRequested <- function(promise, viewport = NULL, .callback = NULL) {
  method <- 'Overlay.screenshotRequested'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
