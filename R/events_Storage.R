# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event Storage.cacheStorageContentUpdated or create a callback
#' 
#' **Event description**:  
#' A cache's contents have been modified.
#' 
#' @param promise An asynchronous result object.
#' @param origin A character string. 
#'        Origin to update. Accepted values: `~ .res$origin` (to refer to the previous result).
#' @param cacheName A character string. 
#'        Name of cache in origin. Accepted values: `~ .res$cacheName` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"cacheStorageContentUpdated"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `origin`, `cacheName`.
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
Storage.cacheStorageContentUpdated <- function(promise, origin = NULL, cacheName = NULL, .callback = NULL) {
  method <- 'Storage.cacheStorageContentUpdated'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Storage.cacheStorageListUpdated or create a callback
#' 
#' **Event description**:  
#' A cache has been added/deleted.
#' 
#' @param promise An asynchronous result object.
#' @param origin A character string. 
#'        Origin to update. Accepted values: `~ .res$origin` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"cacheStorageListUpdated"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `origin`.
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
Storage.cacheStorageListUpdated <- function(promise, origin = NULL, .callback = NULL) {
  method <- 'Storage.cacheStorageListUpdated'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Storage.indexedDBContentUpdated or create a callback
#' 
#' **Event description**:  
#' The origin's IndexedDB object store has been modified.
#' 
#' @param promise An asynchronous result object.
#' @param origin A character string. 
#'        Origin to update. Accepted values: `~ .res$origin` (to refer to the previous result).
#' @param databaseName A character string. 
#'        Database to update. Accepted values: `~ .res$databaseName` (to refer to the previous result).
#' @param objectStoreName A character string. 
#'        ObjectStore to update. Accepted values: `~ .res$objectStoreName` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"indexedDBContentUpdated"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `origin`, `databaseName`, `objectStoreName`.
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
Storage.indexedDBContentUpdated <- function(promise, origin = NULL, databaseName = NULL, objectStoreName = NULL, .callback = NULL) {
  method <- 'Storage.indexedDBContentUpdated'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Storage.indexedDBListUpdated or create a callback
#' 
#' **Event description**:  
#' The origin's IndexedDB database list has been modified.
#' 
#' @param promise An asynchronous result object.
#' @param origin A character string. 
#'        Origin to update. Accepted values: `~ .res$origin` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"indexedDBListUpdated"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `origin`.
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
Storage.indexedDBListUpdated <- function(promise, origin = NULL, .callback = NULL) {
  method <- 'Storage.indexedDBListUpdated'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
