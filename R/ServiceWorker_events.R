# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event ServiceWorker.workerErrorReported or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param errorMessage A ServiceWorkerErrorMessage. 
#'         Accepted values: `~ .res$errorMessage` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"workerErrorReported"`)
#'        and an element `params` which is a named list. The `params` list is composed of
#'        the following element(s): `errorMessage`.
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
ServiceWorker.workerErrorReported <- function(promise, errorMessage = NULL, .callback = NULL) {
  method <- 'ServiceWorker.workerErrorReported'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event ServiceWorker.workerRegistrationUpdated or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param registrations A list of ServiceWorkerRegistration. 
#'         Accepted values: `~ .res$registrations` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"workerRegistrationUpdated"`)
#'        and an element `params` which is a named list. The `params` list is composed of
#'        the following element(s): `registrations`.
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
ServiceWorker.workerRegistrationUpdated <- function(promise, registrations = NULL, .callback = NULL) {
  method <- 'ServiceWorker.workerRegistrationUpdated'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event ServiceWorker.workerVersionUpdated or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param versions A list of ServiceWorkerVersion. 
#'         Accepted values: `~ .res$versions` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"workerVersionUpdated"`)
#'        and an element `params` which is a named list. The `params` list is composed of
#'        the following element(s): `versions`.
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
ServiceWorker.workerVersionUpdated <- function(promise, versions = NULL, .callback = NULL) {
  method <- 'ServiceWorker.workerVersionUpdated'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
