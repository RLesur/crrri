# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Schema.getDomains
#' 
#' Returns supported domains.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Schema.getDomains <- function(promise) {
  method <- 'Schema.getDomains'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
