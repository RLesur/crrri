# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command DOMStorage.clear
#' 
#' 
#' 
#' @param promise An aynchronous result object.
#' @param storageId A StorageId. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DOMStorage.clear <- function(promise, storageId) {
  method <- 'DOMStorage.clear'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DOMStorage.disable
#' 
#' Disables storage tracking, prevents storage events from being sent to the client.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DOMStorage.disable <- function(promise) {
  method <- 'DOMStorage.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DOMStorage.enable
#' 
#' Enables storage tracking, storage events will now be delivered to the client.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DOMStorage.enable <- function(promise) {
  method <- 'DOMStorage.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DOMStorage.getDOMStorageItems
#' 
#' 
#' 
#' @param promise An aynchronous result object.
#' @param storageId A StorageId. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
DOMStorage.getDOMStorageItems <- function(promise, storageId) {
  method <- 'DOMStorage.getDOMStorageItems'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DOMStorage.removeDOMStorageItem
#' 
#' 
#' 
#' @param promise An aynchronous result object.
#' @param storageId A StorageId. 
#' @param key A character string. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DOMStorage.removeDOMStorageItem <- function(promise, storageId, key) {
  method <- 'DOMStorage.removeDOMStorageItem'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DOMStorage.setDOMStorageItem
#' 
#' 
#' 
#' @param promise An aynchronous result object.
#' @param storageId A StorageId. 
#' @param key A character string. 
#' @param value A character string. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DOMStorage.setDOMStorageItem <- function(promise, storageId, key, value) {
  method <- 'DOMStorage.setDOMStorageItem'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
