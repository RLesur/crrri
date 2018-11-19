# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Profiler.disable
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Profiler.disable <- function(promise) {
  method <- 'Profiler.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Profiler.enable
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Profiler.enable <- function(promise) {
  method <- 'Profiler.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Profiler.getBestEffortCoverage
#'  
#' Collect coverage data for the current isolate. The coverage data may be incomplete due to
#'        garbage collection.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Profiler.getBestEffortCoverage <- function(promise) {
  method <- 'Profiler.getBestEffortCoverage'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Profiler.setSamplingInterval
#'  
#' Changes CPU profiler sampling interval. Must be called before CPU profiles recording started.
#'  
#' @param promise An aynchronous result object.
#' @param interval An integer. 
#'        New sampling interval in microseconds. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Profiler.setSamplingInterval <- function(promise, interval) {
  method <- 'Profiler.setSamplingInterval'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Profiler.start
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Profiler.start <- function(promise) {
  method <- 'Profiler.start'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Profiler.startPreciseCoverage
#'  
#' Enable precise code coverage. Coverage data for JavaScript executed before enabling precise code
#'        coverage may be incomplete. Enabling prevents running optimized code and resets execution
#'        counters.
#'  
#' @param promise An aynchronous result object.
#' @param callCount Optional. A logical. 
#'        Collect accurate call counts beyond simple 'covered' or 'not covered'. 
#' @param detailed Optional. A logical. 
#'        Collect block-based coverage. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Profiler.startPreciseCoverage <- function(promise, callCount = NULL, detailed = NULL) {
  method <- 'Profiler.startPreciseCoverage'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Profiler.startTypeProfile
#'  
#' Enable type profile.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Profiler.startTypeProfile <- function(promise) {
  method <- 'Profiler.startTypeProfile'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Profiler.stop
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Profiler.stop <- function(promise) {
  method <- 'Profiler.stop'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Profiler.stopPreciseCoverage
#'  
#' Disable precise code coverage. Disabling releases unnecessary execution count records and allows
#'        executing optimized code.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Profiler.stopPreciseCoverage <- function(promise) {
  method <- 'Profiler.stopPreciseCoverage'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Profiler.stopTypeProfile
#'  
#' Disable type profile. Disabling releases type profile data collected so far.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Profiler.stopTypeProfile <- function(promise) {
  method <- 'Profiler.stopTypeProfile'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Profiler.takePreciseCoverage
#'  
#' Collect coverage data for the current isolate, and resets execution counters. Precise code
#'        coverage needs to have started.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Profiler.takePreciseCoverage <- function(promise) {
  method <- 'Profiler.takePreciseCoverage'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Profiler.takeTypeProfile
#'  
#' Collect type profile.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Profiler.takeTypeProfile <- function(promise) {
  method <- 'Profiler.takeTypeProfile'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
