# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Database.disable
#'  
#' Disables database tracking, prevents database events from being sent to the client.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Database.disable <- function(promise) {
  method <- 'Database.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Database.enable
#'  
#' Enables database tracking, database events will now be delivered to the client.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Database.enable <- function(promise) {
  method <- 'Database.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Database.executeSQL
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param databaseId A DatabaseId. 
#' @param query A character string. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 3.
#' @export
Database.executeSQL <- function(promise, databaseId, query) {
  method <- 'Database.executeSQL'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Database.getDatabaseTableNames
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param databaseId A DatabaseId. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Database.getDatabaseTableNames <- function(promise, databaseId) {
  method <- 'Database.getDatabaseTableNames'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
