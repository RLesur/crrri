# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command IO.close
#' 
#' Close the stream, discard any temporary backing storage.
#' 
#' @param promise An asynchronous result.
#' @param handle A StreamHandle. 
#'        Handle of the stream to close. 
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
IO.close <- function(promise, handle, awaitResult = TRUE) {
  method <- 'IO.close'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command IO.read
#' 
#' Read a chunk of the stream
#' 
#' @param promise An asynchronous result.
#' @param handle A StreamHandle. 
#'        Handle of the stream to read. 
#' @param offset Optional. An integer. 
#'        Seek to the specified offset before reading (if not specificed, proceed with offset
#'        following the last read). Some types of streams may only support sequential reads. 
#' @param size Optional. An integer. 
#'        Maximum number of bytes to read (left upon the agent discretion if not specified). 
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
IO.read <- function(promise, handle, offset = NULL, size = NULL, awaitResult = TRUE) {
  method <- 'IO.read'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command IO.resolveBlob
#' 
#' Return UUID of Blob object specified by a remote object id.
#' 
#' @param promise An asynchronous result.
#' @param objectId A Runtime.RemoteObjectId. 
#'        Object id of a Blob object wrapper. 
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
IO.resolveBlob <- function(promise, objectId, awaitResult = TRUE) {
  method <- 'IO.resolveBlob'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}
