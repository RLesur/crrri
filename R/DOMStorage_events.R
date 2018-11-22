# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event DOMStorage.domStorageItemAdded or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param storageId A StorageId. 
#'         Accepted values: `~ .res$storageId` (to refer to the previous result).
#' @param key A character string. 
#'         Accepted values: `~ .res$key` (to refer to the previous result).
#' @param newValue A character string. 
#'         Accepted values: `~ .res$newValue` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"domStorageItemAdded"`)
#'        and an element `params` which is a named list. The `params` list is composed of
#'        the following element(s): `storageId`, `key`, `newValue`.
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
DOMStorage.domStorageItemAdded <- function(promise, storageId = NULL, key = NULL, newValue = NULL, .callback = NULL) {
  method <- 'DOMStorage.domStorageItemAdded'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOMStorage.domStorageItemRemoved or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param storageId A StorageId. 
#'         Accepted values: `~ .res$storageId` (to refer to the previous result).
#' @param key A character string. 
#'         Accepted values: `~ .res$key` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"domStorageItemRemoved"`)
#'        and an element `params` which is a named list. The `params` list is composed of
#'        the following element(s): `storageId`, `key`.
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
DOMStorage.domStorageItemRemoved <- function(promise, storageId = NULL, key = NULL, .callback = NULL) {
  method <- 'DOMStorage.domStorageItemRemoved'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOMStorage.domStorageItemUpdated or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param storageId A StorageId. 
#'         Accepted values: `~ .res$storageId` (to refer to the previous result).
#' @param key A character string. 
#'         Accepted values: `~ .res$key` (to refer to the previous result).
#' @param oldValue A character string. 
#'         Accepted values: `~ .res$oldValue` (to refer to the previous result).
#' @param newValue A character string. 
#'         Accepted values: `~ .res$newValue` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"domStorageItemUpdated"`)
#'        and an element `params` which is a named list. The `params` list is composed of
#'        the following element(s): `storageId`, `key`, `oldValue`, `newValue`.
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
DOMStorage.domStorageItemUpdated <- function(promise, storageId = NULL, key = NULL, oldValue = NULL, newValue = NULL, .callback = NULL) {
  method <- 'DOMStorage.domStorageItemUpdated'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOMStorage.domStorageItemsCleared or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param storageId A StorageId. 
#'         Accepted values: `~ .res$storageId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"domStorageItemsCleared"`)
#'        and an element `params` which is a named list. The `params` list is composed of
#'        the following element(s): `storageId`.
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
DOMStorage.domStorageItemsCleared <- function(promise, storageId = NULL, .callback = NULL) {
  method <- 'DOMStorage.domStorageItemsCleared'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
