# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Log.clear
#' 
#' Clears the log.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Log.clear <- function(promise) {
  method <- 'Log.clear'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Log.disable
#' 
#' Disables log domain, prevents further log entries from being reported to the client.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Log.disable <- function(promise) {
  method <- 'Log.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Log.enable
#' 
#' Enables log domain, sends the entries collected so far to the client by means of the
#'        `entryAdded` notification.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Log.enable <- function(promise) {
  method <- 'Log.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Log.startViolationsReport
#' 
#' start violation reporting.
#' 
#' @param promise An aynchronous result object.
#' @param config A list of ViolationSetting. 
#'        Configuration for violations. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Log.startViolationsReport <- function(promise, config) {
  method <- 'Log.startViolationsReport'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Log.stopViolationsReport
#' 
#' Stop violation reporting.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Log.stopViolationsReport <- function(promise) {
  method <- 'Log.stopViolationsReport'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
