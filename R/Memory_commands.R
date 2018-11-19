# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Memory.getDOMCounters
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 3.
#' @export
Memory.getDOMCounters <- function(promise) {
  method <- 'Memory.getDOMCounters'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Memory.prepareForLeakDetection
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Memory.prepareForLeakDetection <- function(promise) {
  method <- 'Memory.prepareForLeakDetection'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Memory.setPressureNotificationsSuppressed
#'  
#' Enable/disable suppressing memory pressure notifications in all processes.
#'  
#' @param promise An aynchronous result object.
#' @param suppressed A logical. 
#'        If true, memory pressure notifications will be suppressed. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Memory.setPressureNotificationsSuppressed <- function(promise, suppressed) {
  method <- 'Memory.setPressureNotificationsSuppressed'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Memory.simulatePressureNotification
#'  
#' Simulate a memory pressure notification in all processes.
#'  
#' @param promise An aynchronous result object.
#' @param level A PressureLevel. 
#'        Memory pressure level of the notification. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Memory.simulatePressureNotification <- function(promise, level) {
  method <- 'Memory.simulatePressureNotification'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Memory.startSampling
#'  
#' Start collecting native memory profile.
#'  
#' @param promise An aynchronous result object.
#' @param samplingInterval Optional. An integer. 
#'        Average number of bytes between samples. 
#' @param suppressRandomness Optional. A logical. 
#'        Do not randomize intervals between samples. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Memory.startSampling <- function(promise, samplingInterval = NULL, suppressRandomness = NULL) {
  method <- 'Memory.startSampling'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Memory.stopSampling
#'  
#' Stop collecting native memory profile.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Memory.stopSampling <- function(promise) {
  method <- 'Memory.stopSampling'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Memory.getAllTimeSamplingProfile
#'  
#' Retrieve native memory allocations profile
#'        collected since renderer process startup.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Memory.getAllTimeSamplingProfile <- function(promise) {
  method <- 'Memory.getAllTimeSamplingProfile'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Memory.getBrowserSamplingProfile
#'  
#' Retrieve native memory allocations profile
#'        collected since browser process startup.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Memory.getBrowserSamplingProfile <- function(promise) {
  method <- 'Memory.getBrowserSamplingProfile'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Memory.getSamplingProfile
#'  
#' Retrieve native memory allocations profile collected since last
#'        `startSampling` call.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Memory.getSamplingProfile <- function(promise) {
  method <- 'Memory.getSamplingProfile'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
