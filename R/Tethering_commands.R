#' DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Tethering.bind
#'  
#' Request browser port binding.
#'  
#' @param promise An aynchronous result object.
#' @param port An integer. 
#'        Port number to bind. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Tethering.bind <- function(promise, port) {
  method <- 'Tethering.bind'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Tethering.unbind
#'  
#' Request browser port unbinding.
#'  
#' @param promise An aynchronous result object.
#' @param port An integer. 
#'        Port number to unbind. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Tethering.unbind <- function(promise, port) {
  method <- 'Tethering.unbind'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
