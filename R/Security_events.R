# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event Security.certificateError or create a callback
#' 
#' **Event description**:  
#' There is a certificate error. If overriding certificate errors is enabled, then it should be
#'        handled with the `handleCertificateError` command. Note: this event does not fire if the
#'        certificate error has been allowed internally. Only one client per target should override
#'        certificate errors at the same time.
#' 
#' @param promise An asynchronous result object.
#' @param eventId An integer. 
#'        The ID of the event. Accepted values: `~ .res$eventId` (to refer to the previous result).
#' @param errorType A character string. 
#'        The type of the error. Accepted values: `~ .res$errorType` (to refer to the previous result).
#' @param requestURL A character string. 
#'        The url that was requested. Accepted values: `~ .res$requestURL` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"certificateError"`)
#'        and an element `params` which is a named list. The `params` list is composed of
#'        the following element(s): `eventId`, `errorType`, `requestURL`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
Security.certificateError <- function(promise, eventId = NULL, errorType = NULL, requestURL = NULL, .callback = NULL) {
  method <- 'Security.certificateError'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Security.securityStateChanged or create a callback
#' 
#' **Event description**:  
#' The security state of the page changed.
#' 
#' @param promise An asynchronous result object.
#' @param securityState A SecurityState. 
#'        Security state. Accepted values: `~ .res$securityState` (to refer to the previous result).
#' @param schemeIsCryptographic A logical. 
#'        True if the page was loaded over cryptographic transport such as HTTPS. Accepted values: `~ .res$schemeIsCryptographic` (to refer to the previous result).
#' @param explanations A list of SecurityStateExplanation. 
#'        List of explanations for the security state. If the overall security state is `insecure` or
#'        `warning`, at least one corresponding explanation should be included. Accepted values: `~ .res$explanations` (to refer to the previous result).
#' @param insecureContentStatus A InsecureContentStatus. 
#'        Information about insecure content on the page. Accepted values: `~ .res$insecureContentStatus` (to refer to the previous result).
#' @param summary A character string. 
#'        Overrides user-visible description of the state. Accepted values: `~ .res$summary` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"securityStateChanged"`)
#'        and an element `params` which is a named list. The `params` list is composed of
#'        the following element(s): `securityState`, `schemeIsCryptographic`, `explanations`, `insecureContentStatus`, `summary` (optional) .
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
Security.securityStateChanged <- function(promise, securityState = NULL, schemeIsCryptographic = NULL, explanations = NULL, insecureContentStatus = NULL, summary = NULL, .callback = NULL) {
  method <- 'Security.securityStateChanged'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
