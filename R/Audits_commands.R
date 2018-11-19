# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Audits.getEncodedResponse
#'  
#' Returns the response body and size if it were re-encoded with the specified settings. Only
#'        applies to images.
#'  
#' @param promise An aynchronous result object.
#' @param requestId A Network.RequestId. 
#'        Identifier of the network request to get content for. 
#' @param encoding A character string. 
#'        The encoding to use. Accepted values: webp, jpeg, png.
#' @param quality Optional. A numeric. 
#'        The quality of the encoding (0-1). (defaults to 1) 
#' @param sizeOnly Optional. A logical. 
#'        Whether to only return the size information (defaults to false). 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 3.
#' @export
Audits.getEncodedResponse <- function(promise, requestId, encoding, quality = NULL, sizeOnly = NULL) {
  method <- 'Audits.getEncodedResponse'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
