# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Performance.disable
#' 
#' Disable collecting and reporting metrics.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Performance.disable <- function(promise) {
  method <- 'Performance.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Performance.enable
#' 
#' Enable collecting and reporting metrics.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Performance.enable <- function(promise) {
  method <- 'Performance.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Performance.setTimeDomain
#' 
#' Sets time domain to use for collecting and reporting duration metrics.
#'        Note that this must be called before enabling metrics collection. Calling
#'        this method while metrics collection is enabled returns an error.
#' 
#' @param promise An aynchronous result object.
#' @param timeDomain A character string. 
#'        Time domain Accepted values: timeTicks, threadTicks.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Performance.setTimeDomain <- function(promise, timeDomain) {
  method <- 'Performance.setTimeDomain'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Performance.getMetrics
#' 
#' Retrieve current values of run-time metrics.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Performance.getMetrics <- function(promise) {
  method <- 'Performance.getMetrics'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
