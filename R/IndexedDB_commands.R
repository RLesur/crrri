# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command IndexedDB.clearObjectStore
#'  
#' Clears all entries from an object store.
#'  
#' @param promise An aynchronous result object.
#' @param securityOrigin A character string. 
#'        Security origin. 
#' @param databaseName A character string. 
#'        Database name. 
#' @param objectStoreName A character string. 
#'        Object store name. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
IndexedDB.clearObjectStore <- function(promise, securityOrigin, databaseName, objectStoreName) {
  method <- 'IndexedDB.clearObjectStore'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command IndexedDB.deleteDatabase
#'  
#' Deletes a database.
#'  
#' @param promise An aynchronous result object.
#' @param securityOrigin A character string. 
#'        Security origin. 
#' @param databaseName A character string. 
#'        Database name. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
IndexedDB.deleteDatabase <- function(promise, securityOrigin, databaseName) {
  method <- 'IndexedDB.deleteDatabase'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command IndexedDB.deleteObjectStoreEntries
#'  
#' Delete a range of entries from an object store
#'  
#' @param promise An aynchronous result object.
#' @param securityOrigin A character string. 
#' @param databaseName A character string. 
#' @param objectStoreName A character string. 
#' @param keyRange A KeyRange. 
#'        Range of entry keys to delete 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
IndexedDB.deleteObjectStoreEntries <- function(promise, securityOrigin, databaseName, objectStoreName, keyRange) {
  method <- 'IndexedDB.deleteObjectStoreEntries'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command IndexedDB.disable
#'  
#' Disables events from backend.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
IndexedDB.disable <- function(promise) {
  method <- 'IndexedDB.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command IndexedDB.enable
#'  
#' Enables events from backend.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
IndexedDB.enable <- function(promise) {
  method <- 'IndexedDB.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command IndexedDB.requestData
#'  
#' Requests data from object store or index.
#'  
#' @param promise An aynchronous result object.
#' @param securityOrigin A character string. 
#'        Security origin. 
#' @param databaseName A character string. 
#'        Database name. 
#' @param objectStoreName A character string. 
#'        Object store name. 
#' @param indexName A character string. 
#'        Index name, empty string for object store data requests. 
#' @param skipCount An integer. 
#'        Number of records to skip. 
#' @param pageSize An integer. 
#'        Number of records to fetch. 
#' @param keyRange Optional. A KeyRange. 
#'        Key range. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
IndexedDB.requestData <- function(promise, securityOrigin, databaseName, objectStoreName, indexName, skipCount, pageSize, keyRange = NULL) {
  method <- 'IndexedDB.requestData'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command IndexedDB.requestDatabase
#'  
#' Requests database with given name in given frame.
#'  
#' @param promise An aynchronous result object.
#' @param securityOrigin A character string. 
#'        Security origin. 
#' @param databaseName A character string. 
#'        Database name. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
IndexedDB.requestDatabase <- function(promise, securityOrigin, databaseName) {
  method <- 'IndexedDB.requestDatabase'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command IndexedDB.requestDatabaseNames
#'  
#' Requests database names for given security origin.
#'  
#' @param promise An aynchronous result object.
#' @param securityOrigin A character string. 
#'        Security origin. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
IndexedDB.requestDatabaseNames <- function(promise, securityOrigin) {
  method <- 'IndexedDB.requestDatabaseNames'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
