# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Testing.generateTestReport
#'  
#' Generates a report for testing.
#'  
#' @param promise An aynchronous result object.
#' @param message A character string. 
#'        Message to be displayed in the report. 
#' @param group Optional. A character string. 
#'        Specifies the endpoint group to deliver the report to. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Testing.generateTestReport <- function(promise, message, group = NULL) {
  method <- 'Testing.generateTestReport'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
