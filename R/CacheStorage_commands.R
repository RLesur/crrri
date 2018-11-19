# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command CacheStorage.deleteCache
#'  
#' Deletes a cache.
#'  
#' @param promise An aynchronous result object.
#' @param cacheId A CacheId. 
#'        Id of cache for deletion. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
CacheStorage.deleteCache <- function(promise, cacheId) {
  method <- 'CacheStorage.deleteCache'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CacheStorage.deleteEntry
#'  
#' Deletes a cache entry.
#'  
#' @param promise An aynchronous result object.
#' @param cacheId A CacheId. 
#'        Id of cache where the entry will be deleted. 
#' @param request A character string. 
#'        URL spec of the request. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
CacheStorage.deleteEntry <- function(promise, cacheId, request) {
  method <- 'CacheStorage.deleteEntry'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CacheStorage.requestCacheNames
#'  
#' Requests cache names.
#'  
#' @param promise An aynchronous result object.
#' @param securityOrigin A character string. 
#'        Security origin. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CacheStorage.requestCacheNames <- function(promise, securityOrigin) {
  method <- 'CacheStorage.requestCacheNames'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CacheStorage.requestCachedResponse
#'  
#' Fetches cache entry.
#'  
#' @param promise An aynchronous result object.
#' @param cacheId A CacheId. 
#'        Id of cache that contains the enty. 
#' @param requestURL A character string. 
#'        URL spec of the request. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CacheStorage.requestCachedResponse <- function(promise, cacheId, requestURL) {
  method <- 'CacheStorage.requestCachedResponse'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CacheStorage.requestEntries
#'  
#' Requests data from cache.
#'  
#' @param promise An aynchronous result object.
#' @param cacheId A CacheId. 
#'        ID of cache to get entries from. 
#' @param skipCount An integer. 
#'        Number of records to skip. 
#' @param pageSize An integer. 
#'        Number of records to fetch. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
CacheStorage.requestEntries <- function(promise, cacheId, skipCount, pageSize) {
  method <- 'CacheStorage.requestEntries'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
