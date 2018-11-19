# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command ServiceWorker.deliverPushMessage
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param origin A character string. 
#' @param registrationId A character string. 
#' @param data A character string. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
ServiceWorker.deliverPushMessage <- function(promise, origin, registrationId, data) {
  method <- 'ServiceWorker.deliverPushMessage'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command ServiceWorker.disable
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
ServiceWorker.disable <- function(promise) {
  method <- 'ServiceWorker.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command ServiceWorker.dispatchSyncEvent
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param origin A character string. 
#' @param registrationId A character string. 
#' @param tag A character string. 
#' @param lastChance A logical. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
ServiceWorker.dispatchSyncEvent <- function(promise, origin, registrationId, tag, lastChance) {
  method <- 'ServiceWorker.dispatchSyncEvent'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command ServiceWorker.enable
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
ServiceWorker.enable <- function(promise) {
  method <- 'ServiceWorker.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command ServiceWorker.inspectWorker
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param versionId A character string. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
ServiceWorker.inspectWorker <- function(promise, versionId) {
  method <- 'ServiceWorker.inspectWorker'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command ServiceWorker.setForceUpdateOnPageLoad
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param forceUpdateOnPageLoad A logical. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
ServiceWorker.setForceUpdateOnPageLoad <- function(promise, forceUpdateOnPageLoad) {
  method <- 'ServiceWorker.setForceUpdateOnPageLoad'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command ServiceWorker.skipWaiting
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param scopeURL A character string. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
ServiceWorker.skipWaiting <- function(promise, scopeURL) {
  method <- 'ServiceWorker.skipWaiting'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command ServiceWorker.startWorker
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param scopeURL A character string. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
ServiceWorker.startWorker <- function(promise, scopeURL) {
  method <- 'ServiceWorker.startWorker'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command ServiceWorker.stopAllWorkers
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
ServiceWorker.stopAllWorkers <- function(promise) {
  method <- 'ServiceWorker.stopAllWorkers'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command ServiceWorker.stopWorker
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param versionId A character string. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
ServiceWorker.stopWorker <- function(promise, versionId) {
  method <- 'ServiceWorker.stopWorker'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command ServiceWorker.unregister
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param scopeURL A character string. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
ServiceWorker.unregister <- function(promise, scopeURL) {
  method <- 'ServiceWorker.unregister'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command ServiceWorker.updateRegistration
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param scopeURL A character string. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
ServiceWorker.updateRegistration <- function(promise, scopeURL) {
  method <- 'ServiceWorker.updateRegistration'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
