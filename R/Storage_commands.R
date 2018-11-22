# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Storage.clearDataForOrigin
#' 
#' Clears storage for origin.
#' 
#' @param promise An asynchronous result.
#' @param origin A character string. 
#'        Security origin. 
#' @param storageTypes A character string. 
#'        Comma separated origin names. 
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
Storage.clearDataForOrigin <- function(promise, origin, storageTypes, awaitResult = TRUE) {
  method <- 'Storage.clearDataForOrigin'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Storage.getUsageAndQuota
#' 
#' Returns usage and quota in bytes.
#' 
#' @param promise An asynchronous result.
#' @param origin A character string. 
#'        Security origin. 
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a named list of length 3.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
Storage.getUsageAndQuota <- function(promise, origin, awaitResult = TRUE) {
  method <- 'Storage.getUsageAndQuota'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Storage.trackCacheStorageForOrigin
#' 
#' Registers origin to be notified when an update occurs to its cache storage list.
#' 
#' @param promise An asynchronous result.
#' @param origin A character string. 
#'        Security origin. 
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
Storage.trackCacheStorageForOrigin <- function(promise, origin, awaitResult = TRUE) {
  method <- 'Storage.trackCacheStorageForOrigin'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Storage.trackIndexedDBForOrigin
#' 
#' Registers origin to be notified when an update occurs to its IndexedDB.
#' 
#' @param promise An asynchronous result.
#' @param origin A character string. 
#'        Security origin. 
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
Storage.trackIndexedDBForOrigin <- function(promise, origin, awaitResult = TRUE) {
  method <- 'Storage.trackIndexedDBForOrigin'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Storage.untrackCacheStorageForOrigin
#' 
#' Unregisters origin from receiving notifications for cache storage.
#' 
#' @param promise An asynchronous result.
#' @param origin A character string. 
#'        Security origin. 
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
Storage.untrackCacheStorageForOrigin <- function(promise, origin, awaitResult = TRUE) {
  method <- 'Storage.untrackCacheStorageForOrigin'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Storage.untrackIndexedDBForOrigin
#' 
#' Unregisters origin from receiving notifications for IndexedDB.
#' 
#' @param promise An asynchronous result.
#' @param origin A character string. 
#'        Security origin. 
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
Storage.untrackIndexedDBForOrigin <- function(promise, origin, awaitResult = TRUE) {
  method <- 'Storage.untrackIndexedDBForOrigin'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}
