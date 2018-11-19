# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Security.disable
#' 
#' Disables tracking security state changes.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Security.disable <- function(promise) {
  method <- 'Security.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Security.enable
#' 
#' Enables tracking security state changes.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Security.enable <- function(promise) {
  method <- 'Security.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Security.setIgnoreCertificateErrors
#' 
#' Enable/disable whether all certificate errors should be ignored.
#' 
#' @param promise An aynchronous result object.
#' @param ignore A logical. 
#'        If true, all certificate errors will be ignored. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Security.setIgnoreCertificateErrors <- function(promise, ignore) {
  method <- 'Security.setIgnoreCertificateErrors'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
