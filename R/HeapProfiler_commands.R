#' DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command HeapProfiler.addInspectedHeapObject
#'  
#' Enables console to refer to the node with given id via $x (see Command Line API for more details
#'        $x functions).
#'  
#' @param promise An aynchronous result object.
#' @param heapObjectId A HeapSnapshotObjectId. 
#'        Heap snapshot object id to be accessible by means of $x command line API. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
HeapProfiler.addInspectedHeapObject <- function(promise, heapObjectId) {
  method <- 'HeapProfiler.addInspectedHeapObject'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command HeapProfiler.collectGarbage
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
HeapProfiler.collectGarbage <- function(promise) {
  method <- 'HeapProfiler.collectGarbage'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command HeapProfiler.disable
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
HeapProfiler.disable <- function(promise) {
  method <- 'HeapProfiler.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command HeapProfiler.enable
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
HeapProfiler.enable <- function(promise) {
  method <- 'HeapProfiler.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command HeapProfiler.getHeapObjectId
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param objectId A Runtime.RemoteObjectId. 
#'        Identifier of the object to get heap object id for. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
HeapProfiler.getHeapObjectId <- function(promise, objectId) {
  method <- 'HeapProfiler.getHeapObjectId'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command HeapProfiler.getObjectByHeapObjectId
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param objectId A HeapSnapshotObjectId. 
#' @param objectGroup Optional. A character string. 
#'        Symbolic group name that can be used to release multiple objects. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
HeapProfiler.getObjectByHeapObjectId <- function(promise, objectId, objectGroup = NULL) {
  method <- 'HeapProfiler.getObjectByHeapObjectId'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command HeapProfiler.getSamplingProfile
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
HeapProfiler.getSamplingProfile <- function(promise) {
  method <- 'HeapProfiler.getSamplingProfile'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command HeapProfiler.startSampling
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param samplingInterval Optional. A numeric. 
#'        Average sample interval in bytes. Poisson distribution is used for the intervals. The
#'        default value is 32768 bytes. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
HeapProfiler.startSampling <- function(promise, samplingInterval = NULL) {
  method <- 'HeapProfiler.startSampling'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command HeapProfiler.startTrackingHeapObjects
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param trackAllocations Optional. A logical. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
HeapProfiler.startTrackingHeapObjects <- function(promise, trackAllocations = NULL) {
  method <- 'HeapProfiler.startTrackingHeapObjects'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command HeapProfiler.stopSampling
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
HeapProfiler.stopSampling <- function(promise) {
  method <- 'HeapProfiler.stopSampling'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command HeapProfiler.stopTrackingHeapObjects
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param reportProgress Optional. A logical. 
#'        If true 'reportHeapSnapshotProgress' events will be generated while snapshot is being taken
#'        when the tracking is stopped. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
HeapProfiler.stopTrackingHeapObjects <- function(promise, reportProgress = NULL) {
  method <- 'HeapProfiler.stopTrackingHeapObjects'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command HeapProfiler.takeHeapSnapshot
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param reportProgress Optional. A logical. 
#'        If true 'reportHeapSnapshotProgress' events will be generated while snapshot is being taken. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
HeapProfiler.takeHeapSnapshot <- function(promise, reportProgress = NULL) {
  method <- 'HeapProfiler.takeHeapSnapshot'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
