# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Audits.getEncodedResponse
#' 
#' Returns the response body and size if it were re-encoded with the specified settings. Only
#'        applies to images.
#' 
#' @param promise An asynchronous result.
#' @param requestId A Network.RequestId. 
#'        Identifier of the network request to get content for. 
#' @param encoding A character string. 
#'        The encoding to use. Accepted values: webp, jpeg, png.
#' @param quality Optional. A numeric. 
#'        The quality of the encoding (0-1). (defaults to 1) 
#' @param sizeOnly Optional. A logical. 
#'        Whether to only return the size information (defaults to false). 
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a named list of length 3.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
Audits.getEncodedResponse <- function(promise, requestId, encoding, quality = NULL, sizeOnly = NULL, awaitResult = TRUE) {
  method <- 'Audits.getEncodedResponse'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}
