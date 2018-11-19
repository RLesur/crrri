#' DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Accessibility.disable
#'  
#' Disables the accessibility domain.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Accessibility.disable <- function(promise) {
  method <- 'Accessibility.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Accessibility.enable
#'  
#' Enables the accessibility domain which causes `AXNodeId`s to remain consistent between method calls.
#'        This turns on accessibility for the page, which can impact performance until accessibility is disabled.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Accessibility.enable <- function(promise) {
  method <- 'Accessibility.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Accessibility.getPartialAXTree
#'  
#' Fetches the accessibility node and partial accessibility tree for this DOM node, if it exists.
#'  
#' @param promise An aynchronous result object.
#' @param nodeId Optional. A DOM.NodeId. 
#'        Identifier of the node to get the partial accessibility tree for. 
#' @param backendNodeId Optional. A DOM.BackendNodeId. 
#'        Identifier of the backend node to get the partial accessibility tree for. 
#' @param objectId Optional. A Runtime.RemoteObjectId. 
#'        JavaScript object id of the node wrapper to get the partial accessibility tree for. 
#' @param fetchRelatives Optional. A logical. 
#'        Whether to fetch this nodes ancestors, siblings and children. Defaults to true. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Accessibility.getPartialAXTree <- function(promise, nodeId = NULL, backendNodeId = NULL, objectId = NULL, fetchRelatives = NULL) {
  method <- 'Accessibility.getPartialAXTree'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Accessibility.getFullAXTree
#'  
#' Fetches the entire accessibility tree
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Accessibility.getFullAXTree <- function(promise) {
  method <- 'Accessibility.getFullAXTree'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
