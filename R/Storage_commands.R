# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Storage.clearDataForOrigin
#'  
#' Clears storage for origin.
#'  
#' @param promise An aynchronous result object.
#' @param origin A character string. 
#'        Security origin. 
#' @param storageTypes A character string. 
#'        Comma separated origin names. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Storage.clearDataForOrigin <- function(promise, origin, storageTypes) {
  method <- 'Storage.clearDataForOrigin'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Storage.getUsageAndQuota
#'  
#' Returns usage and quota in bytes.
#'  
#' @param promise An aynchronous result object.
#' @param origin A character string. 
#'        Security origin. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 3.
#' @export
Storage.getUsageAndQuota <- function(promise, origin) {
  method <- 'Storage.getUsageAndQuota'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Storage.trackCacheStorageForOrigin
#'  
#' Registers origin to be notified when an update occurs to its cache storage list.
#'  
#' @param promise An aynchronous result object.
#' @param origin A character string. 
#'        Security origin. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Storage.trackCacheStorageForOrigin <- function(promise, origin) {
  method <- 'Storage.trackCacheStorageForOrigin'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Storage.trackIndexedDBForOrigin
#'  
#' Registers origin to be notified when an update occurs to its IndexedDB.
#'  
#' @param promise An aynchronous result object.
#' @param origin A character string. 
#'        Security origin. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Storage.trackIndexedDBForOrigin <- function(promise, origin) {
  method <- 'Storage.trackIndexedDBForOrigin'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Storage.untrackCacheStorageForOrigin
#'  
#' Unregisters origin from receiving notifications for cache storage.
#'  
#' @param promise An aynchronous result object.
#' @param origin A character string. 
#'        Security origin. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Storage.untrackCacheStorageForOrigin <- function(promise, origin) {
  method <- 'Storage.untrackCacheStorageForOrigin'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Storage.untrackIndexedDBForOrigin
#'  
#' Unregisters origin from receiving notifications for IndexedDB.
#'  
#' @param promise An aynchronous result object.
#' @param origin A character string. 
#'        Security origin. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Storage.untrackIndexedDBForOrigin <- function(promise, origin) {
  method <- 'Storage.untrackIndexedDBForOrigin'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
