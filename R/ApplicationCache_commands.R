# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command ApplicationCache.enable
#'  
#' Enables application cache domain notifications.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
ApplicationCache.enable <- function(promise) {
  method <- 'ApplicationCache.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command ApplicationCache.getApplicationCacheForFrame
#'  
#' Returns relevant application cache data for the document in given frame.
#'  
#' @param promise An aynchronous result object.
#' @param frameId A Page.FrameId. 
#'        Identifier of the frame containing document whose application cache is retrieved. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
ApplicationCache.getApplicationCacheForFrame <- function(promise, frameId) {
  method <- 'ApplicationCache.getApplicationCacheForFrame'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command ApplicationCache.getFramesWithManifests
#'  
#' Returns array of frame identifiers with manifest urls for each frame containing a document
#'        associated with some application cache.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
ApplicationCache.getFramesWithManifests <- function(promise) {
  method <- 'ApplicationCache.getFramesWithManifests'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command ApplicationCache.getManifestForFrame
#'  
#' Returns manifest URL for document in the given frame.
#'  
#' @param promise An aynchronous result object.
#' @param frameId A Page.FrameId. 
#'        Identifier of the frame containing document whose manifest is retrieved. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
ApplicationCache.getManifestForFrame <- function(promise, frameId) {
  method <- 'ApplicationCache.getManifestForFrame'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
