# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event Emulation.virtualTimeAdvanced or create a callback
#' 
#' **Event description**:  
#' Notification sent after the virtual time has advanced.
#' 
#' @param promise An asynchronous result object.
#' @param virtualTimeElapsed A numeric. 
#'        The amount of virtual time that has elapsed in milliseconds since virtual time was first
#'        enabled. Accepted values: `~ .res$virtualTimeElapsed` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"virtualTimeAdvanced"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `virtualTimeElapsed`.
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
Emulation.virtualTimeAdvanced <- function(promise, virtualTimeElapsed = NULL, .callback = NULL) {
  method <- 'Emulation.virtualTimeAdvanced'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Emulation.virtualTimeBudgetExpired or create a callback
#' 
#' **Event description**:  
#' Notification sent after the virtual time budget for the current VirtualTimePolicy has run out.
#' 
#' @param promise An asynchronous result object.
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"virtualTimeBudgetExpired"`)
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
Emulation.virtualTimeBudgetExpired <- function(promise, .callback = NULL) {
  method <- 'Emulation.virtualTimeBudgetExpired'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Emulation.virtualTimePaused or create a callback
#' 
#' **Event description**:  
#' Notification sent after the virtual time has paused.
#' 
#' @param promise An asynchronous result object.
#' @param virtualTimeElapsed A numeric. 
#'        The amount of virtual time that has elapsed in milliseconds since virtual time was first
#'        enabled. Accepted values: `~ .res$virtualTimeElapsed` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"virtualTimePaused"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `virtualTimeElapsed`.
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
Emulation.virtualTimePaused <- function(promise, virtualTimeElapsed = NULL, .callback = NULL) {
  method <- 'Emulation.virtualTimePaused'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
