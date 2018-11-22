# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event LayerTree.layerPainted or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param layerId A LayerId. 
#'        The id of the painted layer. Accepted values: `~ .res$layerId` (to refer to the previous result).
#' @param clip A DOM.Rect. 
#'        Clip rectangle. Accepted values: `~ .res$clip` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"layerPainted"`)
#'        and an element `params` which is a named list. The `params` list is composed of
#'        the following element(s): `layerId`, `clip`.
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
LayerTree.layerPainted <- function(promise, layerId = NULL, clip = NULL, .callback = NULL) {
  method <- 'LayerTree.layerPainted'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event LayerTree.layerTreeDidChange or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param layers A list of Layer. 
#'        Layer tree, absent if not in the comspositing mode. Accepted values: `~ .res$layers` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"layerTreeDidChange"`)
#'        and an element `params` which is a named list. The `params` list is composed of
#'        the following element(s): `layers` (optional) .
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
LayerTree.layerTreeDidChange <- function(promise, layers = NULL, .callback = NULL) {
  method <- 'LayerTree.layerTreeDidChange'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
