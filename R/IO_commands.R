#' DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command IO.close
#'  
#' Close the stream, discard any temporary backing storage.
#'  
#' @param promise An aynchronous result object.
#' @param handle A StreamHandle. 
#'        Handle of the stream to close. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
IO.close <- function(promise, handle) {
  method <- 'IO.close'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command IO.read
#'  
#' Read a chunk of the stream
#'  
#' @param promise An aynchronous result object.
#' @param handle A StreamHandle. 
#'        Handle of the stream to read. 
#' @param offset Optional. An integer. 
#'        Seek to the specified offset before reading (if not specificed, proceed with offset
#'        following the last read). Some types of streams may only support sequential reads. 
#' @param size Optional. An integer. 
#'        Maximum number of bytes to read (left upon the agent discretion if not specified). 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 3.
#' @export
IO.read <- function(promise, handle, offset = NULL, size = NULL) {
  method <- 'IO.read'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command IO.resolveBlob
#'  
#' Return UUID of Blob object specified by a remote object id.
#'  
#' @param promise An aynchronous result object.
#' @param objectId A Runtime.RemoteObjectId. 
#'        Object id of a Blob object wrapper. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
IO.resolveBlob <- function(promise, objectId) {
  method <- 'IO.resolveBlob'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
