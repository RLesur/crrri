# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Fetch.disable
#' 
#' Disables the fetch domain.
#' 
#' @param promise An asynchronous result.
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a void named list.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
Fetch.disable <- function(promise, awaitResult = TRUE) {
  method <- 'Fetch.disable'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Fetch.enable
#' 
#' Enables issuing of requestPaused events. A request will be paused until client
#'        calls one of failRequest, fulfillRequest or continueRequest/continueWithAuth.
#' 
#' @param promise An asynchronous result.
#' @param patterns Optional. A list of RequestPattern. 
#'        If specified, only requests matching any of these patterns will produce
#'        fetchRequested event and will be paused until clients response. If not set,
#'        all requests will be affected. 
#' @param handleAuthRequests Optional. A logical. 
#'        If true, authRequired events will be issued and requests will be paused
#'        expecting a call to continueWithAuth. 
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a void named list.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
Fetch.enable <- function(promise, patterns = NULL, handleAuthRequests = NULL, awaitResult = TRUE) {
  method <- 'Fetch.enable'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Fetch.failRequest
#' 
#' Causes the request to fail with specified reason.
#' 
#' @param promise An asynchronous result.
#' @param requestId A RequestId. 
#'        An id the client received in requestPaused event. 
#' @param errorReason A Network.ErrorReason. 
#'        Causes the request to fail with the given reason. 
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a void named list.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
Fetch.failRequest <- function(promise, requestId, errorReason, awaitResult = TRUE) {
  method <- 'Fetch.failRequest'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Fetch.fulfillRequest
#' 
#' Provides response to the request.
#' 
#' @param promise An asynchronous result.
#' @param requestId A RequestId. 
#'        An id the client received in requestPaused event. 
#' @param responseCode An integer. 
#'        An HTTP response code. 
#' @param responseHeaders A list of HeaderEntry. 
#'        Response headers. 
#' @param body Optional. A character string. 
#'        A response body. 
#' @param responsePhrase Optional. A character string. 
#'        A textual representation of responseCode.
#'        If absent, a standard phrase mathcing responseCode is used. 
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a void named list.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
Fetch.fulfillRequest <- function(promise, requestId, responseCode, responseHeaders, body = NULL, responsePhrase = NULL, awaitResult = TRUE) {
  method <- 'Fetch.fulfillRequest'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Fetch.continueRequest
#' 
#' Continues the request, optionally modifying some of its parameters.
#' 
#' @param promise An asynchronous result.
#' @param requestId A RequestId. 
#'        An id the client received in requestPaused event. 
#' @param url Optional. A character string. 
#'        If set, the request url will be modified in a way that's not observable by page. 
#' @param method Optional. A character string. 
#'        If set, the request method is overridden. 
#' @param postData Optional. A character string. 
#'        If set, overrides the post data in the request. 
#' @param headers Optional. A list of HeaderEntry. 
#'        If set, overrides the request headrts. 
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a void named list.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
Fetch.continueRequest <- function(promise, requestId, url = NULL, method = NULL, postData = NULL, headers = NULL, awaitResult = TRUE) {
  method <- 'Fetch.continueRequest'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Fetch.continueWithAuth
#' 
#' Continues a request supplying authChallengeResponse following authRequired event.
#' 
#' @param promise An asynchronous result.
#' @param requestId A RequestId. 
#'        An id the client received in authRequired event. 
#' @param authChallengeResponse A AuthChallengeResponse. 
#'        Response to  with an authChallenge. 
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a void named list.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
Fetch.continueWithAuth <- function(promise, requestId, authChallengeResponse, awaitResult = TRUE) {
  method <- 'Fetch.continueWithAuth'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Fetch.getResponseBody
#' 
#' Causes the body of the response to be received from the server and
#'        returned as a single string. May only be issued for a request that
#'        is paused in the Response stage and is mutually exclusive with
#'        takeResponseBodyForInterceptionAsStream. Calling other methods that
#'        affect the request or disabling fetch domain before body is received
#'        results in an undefined behavior.
#' 
#' @param promise An asynchronous result.
#' @param requestId A RequestId. 
#'        Identifier for the intercepted request to get body for. 
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a named list of length 2.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
Fetch.getResponseBody <- function(promise, requestId, awaitResult = TRUE) {
  method <- 'Fetch.getResponseBody'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Fetch.takeResponseBodyAsStream
#' 
#' Returns a handle to the stream representing the response body.
#'        The request must be paused in the HeadersReceived stage.
#'        Note that after this command the request can't be continued
#'        as is -- client either needs to cancel it or to provide the
#'        response body.
#'        The stream only supports sequential read, IO.read will fail if the position
#'        is specified.
#'        This method is mutually exclusive with getResponseBody.
#'        Calling other methods that affect the request or disabling fetch
#'        domain before body is received results in an undefined behavior.
#' 
#' @param promise An asynchronous result.
#' @param requestId A RequestId. 
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a named list of length 1.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
Fetch.takeResponseBodyAsStream <- function(promise, requestId, awaitResult = TRUE) {
  method <- 'Fetch.takeResponseBodyAsStream'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}
