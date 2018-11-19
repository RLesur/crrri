# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command DOMSnapshot.disable
#'  
#' Disables DOM snapshot agent for the given page.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DOMSnapshot.disable <- function(promise) {
  method <- 'DOMSnapshot.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DOMSnapshot.enable
#'  
#' Enables DOM snapshot agent for the given page.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DOMSnapshot.enable <- function(promise) {
  method <- 'DOMSnapshot.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DOMSnapshot.captureSnapshot
#'  
#' Returns a document snapshot, including the full DOM tree of the root node (including iframes,
#'        template contents, and imported documents) in a flattened array, as well as layout and
#'        white-listed computed style information for the nodes. Shadow DOM in the returned DOM tree is
#'        flattened.
#'  
#' @param promise An aynchronous result object.
#' @param computedStyles A list of string. 
#'        Whitelist of computed styles to return. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
DOMSnapshot.captureSnapshot <- function(promise, computedStyles) {
  method <- 'DOMSnapshot.captureSnapshot'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
