# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event CSS.fontsUpdated or create a callback
#' 
#' **Event description**:  
#' Fires whenever a web font is updated.  A non-empty font parameter indicates a successfully loaded
#'        web font
#' 
#' @param promise An asynchronous result object.
#' @param font A FontFace. 
#'        The web font that has loaded. Accepted values: `~ .res$font` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"fontsUpdated"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `font` (optional) .
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
CSS.fontsUpdated <- function(promise, font = NULL, .callback = NULL) {
  method <- 'CSS.fontsUpdated'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event CSS.mediaQueryResultChanged or create a callback
#' 
#' **Event description**:  
#' Fires whenever a MediaQuery result changes (for example, after a browser window has been
#'        resized.) The current implementation considers only viewport-dependent media features.
#' 
#' @param promise An asynchronous result object.
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"mediaQueryResultChanged"`)
#'        and an element `params` which is a named list.
#'        For this event, `params` is void.
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
CSS.mediaQueryResultChanged <- function(promise, .callback = NULL) {
  method <- 'CSS.mediaQueryResultChanged'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event CSS.styleSheetAdded or create a callback
#' 
#' **Event description**:  
#' Fired whenever an active document stylesheet is added.
#' 
#' @param promise An asynchronous result object.
#' @param header A CSSStyleSheetHeader. 
#'        Added stylesheet metainfo. Accepted values: `~ .res$header` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"styleSheetAdded"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `header`.
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
CSS.styleSheetAdded <- function(promise, header = NULL, .callback = NULL) {
  method <- 'CSS.styleSheetAdded'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event CSS.styleSheetChanged or create a callback
#' 
#' **Event description**:  
#' Fired whenever a stylesheet is changed as a result of the client operation.
#' 
#' @param promise An asynchronous result object.
#' @param styleSheetId A StyleSheetId. 
#'         Accepted values: `~ .res$styleSheetId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"styleSheetChanged"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `styleSheetId`.
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
CSS.styleSheetChanged <- function(promise, styleSheetId = NULL, .callback = NULL) {
  method <- 'CSS.styleSheetChanged'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event CSS.styleSheetRemoved or create a callback
#' 
#' **Event description**:  
#' Fired whenever an active document stylesheet is removed.
#' 
#' @param promise An asynchronous result object.
#' @param styleSheetId A StyleSheetId. 
#'        Identifier of the removed stylesheet. Accepted values: `~ .res$styleSheetId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"styleSheetRemoved"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `styleSheetId`.
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
CSS.styleSheetRemoved <- function(promise, styleSheetId = NULL, .callback = NULL) {
  method <- 'CSS.styleSheetRemoved'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
