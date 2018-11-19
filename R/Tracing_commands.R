#' DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Tracing.end
#'  
#' Stop trace events collection.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Tracing.end <- function(promise) {
  method <- 'Tracing.end'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Tracing.getCategories
#'  
#' Gets supported tracing categories.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Tracing.getCategories <- function(promise) {
  method <- 'Tracing.getCategories'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Tracing.recordClockSyncMarker
#'  
#' Record a clock sync marker in the trace.
#'  
#' @param promise An aynchronous result object.
#' @param syncId A character string. 
#'        The ID of this clock sync marker 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Tracing.recordClockSyncMarker <- function(promise, syncId) {
  method <- 'Tracing.recordClockSyncMarker'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Tracing.requestMemoryDump
#'  
#' Request a global memory dump.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
Tracing.requestMemoryDump <- function(promise) {
  method <- 'Tracing.requestMemoryDump'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Tracing.start
#'  
#' Start trace events collection.
#'  
#' @param promise An aynchronous result object.
#' @param categories Deprecated. Optional. A character string. 
#'        Category/tag filter 
#' @param options Deprecated. Optional. A character string. 
#'        Tracing options 
#' @param bufferUsageReportingInterval Optional. A numeric. 
#'        If set, the agent will issue bufferUsage events at this interval, specified in milliseconds 
#' @param transferMode Optional. A character string. 
#'        Whether to report trace events as series of dataCollected events or to save trace to a
#'        stream (defaults to `ReportEvents`). Accepted values: ReportEvents, ReturnAsStream.
#' @param streamCompression Optional. A StreamCompression. 
#'        Compression format to use. This only applies when using `ReturnAsStream`
#'        transfer mode (defaults to `none`) 
#' @param traceConfig Optional. A TraceConfig. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Tracing.start <- function(promise, categories = NULL, options = NULL, bufferUsageReportingInterval = NULL, transferMode = NULL, streamCompression = NULL, traceConfig = NULL) {
  method <- 'Tracing.start'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
