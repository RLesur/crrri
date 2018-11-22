# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event Animation.animationCanceled or create a callback
#' 
#' **Event description**:  
#' Event for when an animation has been cancelled.
#' 
#' @param promise An asynchronous result object.
#' @param id A character string. 
#'        Id of the animation that was cancelled. Accepted values: `~ .res$id` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"animationCanceled"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `id`.
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
Animation.animationCanceled <- function(promise, id = NULL, .callback = NULL) {
  method <- 'Animation.animationCanceled'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Animation.animationCreated or create a callback
#' 
#' **Event description**:  
#' Event for each animation that has been created.
#' 
#' @param promise An asynchronous result object.
#' @param id A character string. 
#'        Id of the animation that was created. Accepted values: `~ .res$id` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"animationCreated"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `id`.
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
Animation.animationCreated <- function(promise, id = NULL, .callback = NULL) {
  method <- 'Animation.animationCreated'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Animation.animationStarted or create a callback
#' 
#' **Event description**:  
#' Event for animation that has been started.
#' 
#' @param promise An asynchronous result object.
#' @param animation A Animation. 
#'        Animation that was started. Accepted values: `~ .res$animation` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"animationStarted"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `animation`.
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
Animation.animationStarted <- function(promise, animation = NULL, .callback = NULL) {
  method <- 'Animation.animationStarted'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
