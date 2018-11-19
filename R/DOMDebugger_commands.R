#' DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command DOMDebugger.getEventListeners
#'  
#' Returns event listeners of the given object.
#'  
#' @param promise An aynchronous result object.
#' @param objectId A Runtime.RemoteObjectId. 
#'        Identifier of the object to return listeners for. 
#' @param depth Optional. An integer. 
#'        The maximum depth at which Node children should be retrieved, defaults to 1. Use -1 for the
#'        entire subtree or provide an integer larger than 0. 
#' @param pierce Optional. A logical. 
#'        Whether or not iframes and shadow roots should be traversed when returning the subtree
#'        (default is false). Reports listeners for all contexts if pierce is enabled. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
DOMDebugger.getEventListeners <- function(promise, objectId, depth = NULL, pierce = NULL) {
  method <- 'DOMDebugger.getEventListeners'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DOMDebugger.removeDOMBreakpoint
#'  
#' Removes DOM breakpoint that was set using `setDOMBreakpoint`.
#'  
#' @param promise An aynchronous result object.
#' @param nodeId A DOM.NodeId. 
#'        Identifier of the node to remove breakpoint from. 
#' @param type A DOMBreakpointType. 
#'        Type of the breakpoint to remove. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DOMDebugger.removeDOMBreakpoint <- function(promise, nodeId, type) {
  method <- 'DOMDebugger.removeDOMBreakpoint'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DOMDebugger.removeEventListenerBreakpoint
#'  
#' Removes breakpoint on particular DOM event.
#'  
#' @param promise An aynchronous result object.
#' @param eventName A character string. 
#'        Event name. 
#' @param targetName Experimental. Optional. A character string. 
#'        EventTarget interface name. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DOMDebugger.removeEventListenerBreakpoint <- function(promise, eventName, targetName = NULL) {
  method <- 'DOMDebugger.removeEventListenerBreakpoint'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DOMDebugger.removeInstrumentationBreakpoint
#'  
#' Removes breakpoint on particular native event.
#'  
#' @param promise An aynchronous result object.
#' @param eventName A character string. 
#'        Instrumentation name to stop on. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DOMDebugger.removeInstrumentationBreakpoint <- function(promise, eventName) {
  method <- 'DOMDebugger.removeInstrumentationBreakpoint'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DOMDebugger.removeXHRBreakpoint
#'  
#' Removes breakpoint from XMLHttpRequest.
#'  
#' @param promise An aynchronous result object.
#' @param url A character string. 
#'        Resource URL substring. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DOMDebugger.removeXHRBreakpoint <- function(promise, url) {
  method <- 'DOMDebugger.removeXHRBreakpoint'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DOMDebugger.setDOMBreakpoint
#'  
#' Sets breakpoint on particular operation with DOM.
#'  
#' @param promise An aynchronous result object.
#' @param nodeId A DOM.NodeId. 
#'        Identifier of the node to set breakpoint on. 
#' @param type A DOMBreakpointType. 
#'        Type of the operation to stop upon. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DOMDebugger.setDOMBreakpoint <- function(promise, nodeId, type) {
  method <- 'DOMDebugger.setDOMBreakpoint'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DOMDebugger.setEventListenerBreakpoint
#'  
#' Sets breakpoint on particular DOM event.
#'  
#' @param promise An aynchronous result object.
#' @param eventName A character string. 
#'        DOM Event name to stop on (any DOM event will do). 
#' @param targetName Experimental. Optional. A character string. 
#'        EventTarget interface name to stop on. If equal to `"*"` or not provided, will stop on any
#'        EventTarget. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DOMDebugger.setEventListenerBreakpoint <- function(promise, eventName, targetName = NULL) {
  method <- 'DOMDebugger.setEventListenerBreakpoint'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DOMDebugger.setInstrumentationBreakpoint
#'  
#' Sets breakpoint on particular native event.
#'  
#' @param promise An aynchronous result object.
#' @param eventName A character string. 
#'        Instrumentation name to stop on. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DOMDebugger.setInstrumentationBreakpoint <- function(promise, eventName) {
  method <- 'DOMDebugger.setInstrumentationBreakpoint'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DOMDebugger.setXHRBreakpoint
#'  
#' Sets breakpoint on XMLHttpRequest.
#'  
#' @param promise An aynchronous result object.
#' @param url A character string. 
#'        Resource URL substring. All XHRs having this substring in the URL will get stopped upon. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DOMDebugger.setXHRBreakpoint <- function(promise, url) {
  method <- 'DOMDebugger.setXHRBreakpoint'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
