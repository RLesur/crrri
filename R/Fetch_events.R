# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event Fetch.requestPaused or create a callback
#' 
#' **Event description**:  
#' Issued when the domain is enabled and the request URL matches the
#'        specified filter. The request is paused until the client responds
#'        with one of continueRequest, failRequest or fulfillRequest.
#'        The stage of the request can be determined by presence of responseErrorReason
#'        and responseStatusCode -- the request is at the response stage if either
#'        of these fields is present and in the request stage otherwise.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Each request the page makes will have a unique id. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param request A Network.Request. 
#'        The details of the request. Accepted values: `~ .res$request` (to refer to the previous result).
#' @param frameId A Page.FrameId. 
#'        The id of the frame that initiated the request. Accepted values: `~ .res$frameId` (to refer to the previous result).
#' @param resourceType A Network.ResourceType. 
#'        How the requested resource will be used. Accepted values: `~ .res$resourceType` (to refer to the previous result).
#' @param responseErrorReason A Network.ErrorReason. 
#'        Response error if intercepted at response stage. Accepted values: `~ .res$responseErrorReason` (to refer to the previous result).
#' @param responseStatusCode An integer. 
#'        Response code if intercepted at response stage. Accepted values: `~ .res$responseStatusCode` (to refer to the previous result).
#' @param responseHeaders A list of HeaderEntry. 
#'        Response headers if intercepted at the response stage. Accepted values: `~ .res$responseHeaders` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"requestPaused"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `request`, `frameId`, `resourceType`, `responseErrorReason` (optional) , `responseStatusCode` (optional) , `responseHeaders` (optional) .
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
Fetch.requestPaused <- function(promise, requestId = NULL, request = NULL, frameId = NULL, resourceType = NULL, responseErrorReason = NULL, responseStatusCode = NULL, responseHeaders = NULL, .callback = NULL) {
  method <- 'Fetch.requestPaused'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Fetch.authRequired or create a callback
#' 
#' **Event description**:  
#' Issued when the domain is enabled with handleAuthRequests set to true.
#'        The request is paused until client responds with continueWithAuth.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Each request the page makes will have a unique id. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param request A Network.Request. 
#'        The details of the request. Accepted values: `~ .res$request` (to refer to the previous result).
#' @param frameId A Page.FrameId. 
#'        The id of the frame that initiated the request. Accepted values: `~ .res$frameId` (to refer to the previous result).
#' @param resourceType A Network.ResourceType. 
#'        How the requested resource will be used. Accepted values: `~ .res$resourceType` (to refer to the previous result).
#' @param authChallenge A AuthChallenge. 
#'        Details of the Authorization Challenge encountered.
#'        If this is set, client should respond with continueRequest that
#'        contains AuthChallengeResponse. Accepted values: `~ .res$authChallenge` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"authRequired"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `request`, `frameId`, `resourceType`, `authChallenge`.
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
Fetch.authRequired <- function(promise, requestId = NULL, request = NULL, frameId = NULL, resourceType = NULL, authChallenge = NULL, .callback = NULL) {
  method <- 'Fetch.authRequired'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
