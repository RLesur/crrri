# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Network.clearBrowserCache
#' 
#' Clears browser cache.
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
Network.clearBrowserCache <- function(promise, awaitResult = TRUE) {
  method <- 'Network.clearBrowserCache'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.clearBrowserCookies
#' 
#' Clears browser cookies.
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
Network.clearBrowserCookies <- function(promise, awaitResult = TRUE) {
  method <- 'Network.clearBrowserCookies'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.continueInterceptedRequest
#' 
#' Response to Network.requestIntercepted which either modifies the request to continue with any
#'        modifications, or blocks it, or completes it with the provided response bytes. If a network
#'        fetch occurs as a result which encounters a redirect an additional Network.requestIntercepted
#'        event will be sent with the same InterceptionId.
#' 
#' @param promise An asynchronous result.
#' @param interceptionId A InterceptionId. 
#' @param errorReason Optional. A ErrorReason. 
#'        If set this causes the request to fail with the given reason. Passing `Aborted` for requests
#'        marked with `isNavigationRequest` also cancels the navigation. Must not be set in response
#'        to an authChallenge. 
#' @param rawResponse Optional. A character string. 
#'        If set the requests completes using with the provided base64 encoded raw response, including
#'        HTTP status line and headers etc... Must not be set in response to an authChallenge. 
#' @param url Optional. A character string. 
#'        If set the request url will be modified in a way that's not observable by page. Must not be
#'        set in response to an authChallenge. 
#' @param method Optional. A character string. 
#'        If set this allows the request method to be overridden. Must not be set in response to an
#'        authChallenge. 
#' @param postData Optional. A character string. 
#'        If set this allows postData to be set. Must not be set in response to an authChallenge. 
#' @param headers Optional. A Headers. 
#'        If set this allows the request headers to be changed. Must not be set in response to an
#'        authChallenge. 
#' @param authChallengeResponse Optional. A AuthChallengeResponse. 
#'        Response to a requestIntercepted with an authChallenge. Must not be set otherwise. 
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
Network.continueInterceptedRequest <- function(promise, interceptionId, errorReason = NULL, rawResponse = NULL, url = NULL, method = NULL, postData = NULL, headers = NULL, authChallengeResponse = NULL, awaitResult = TRUE) {
  method <- 'Network.continueInterceptedRequest'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.deleteCookies
#' 
#' Deletes browser cookies with matching name and url or domain/path pair.
#' 
#' @param promise An asynchronous result.
#' @param name A character string. 
#'        Name of the cookies to remove. 
#' @param url Optional. A character string. 
#'        If specified, deletes all the cookies with the given name where domain and path match
#'        provided URL. 
#' @param domain Optional. A character string. 
#'        If specified, deletes only cookies with the exact domain. 
#' @param path Optional. A character string. 
#'        If specified, deletes only cookies with the exact path. 
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
Network.deleteCookies <- function(promise, name, url = NULL, domain = NULL, path = NULL, awaitResult = TRUE) {
  method <- 'Network.deleteCookies'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.disable
#' 
#' Disables network tracking, prevents network events from being sent to the client.
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
Network.disable <- function(promise, awaitResult = TRUE) {
  method <- 'Network.disable'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.emulateNetworkConditions
#' 
#' Activates emulation of network conditions.
#' 
#' @param promise An asynchronous result.
#' @param offline A logical. 
#'        True to emulate internet disconnection. 
#' @param latency A numeric. 
#'        Minimum latency from request sent to response headers received (ms). 
#' @param downloadThroughput A numeric. 
#'        Maximal aggregated download throughput (bytes/sec). -1 disables download throttling. 
#' @param uploadThroughput A numeric. 
#'        Maximal aggregated upload throughput (bytes/sec).  -1 disables upload throttling. 
#' @param connectionType Optional. A ConnectionType. 
#'        Connection type if known. 
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
Network.emulateNetworkConditions <- function(promise, offline, latency, downloadThroughput, uploadThroughput, connectionType = NULL, awaitResult = TRUE) {
  method <- 'Network.emulateNetworkConditions'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.enable
#' 
#' Enables network tracking, network events will now be delivered to the client.
#' 
#' @param promise An asynchronous result.
#' @param maxTotalBufferSize Experimental. Optional. An integer. 
#'        Buffer size in bytes to use when preserving network payloads (XHRs, etc). 
#' @param maxResourceBufferSize Experimental. Optional. An integer. 
#'        Per-resource buffer size in bytes to use when preserving network payloads (XHRs, etc). 
#' @param maxPostDataSize Optional. An integer. 
#'        Longest post body size (in bytes) that would be included in requestWillBeSent notification 
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
Network.enable <- function(promise, maxTotalBufferSize = NULL, maxResourceBufferSize = NULL, maxPostDataSize = NULL, awaitResult = TRUE) {
  method <- 'Network.enable'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.getAllCookies
#' 
#' Returns all browser cookies. Depending on the backend support, will return detailed cookie
#'        information in the `cookies` field.
#' 
#' @param promise An asynchronous result.
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
Network.getAllCookies <- function(promise, awaitResult = TRUE) {
  method <- 'Network.getAllCookies'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.getCertificate
#' 
#' Returns the DER-encoded certificate.
#' 
#' @param promise An asynchronous result.
#' @param origin A character string. 
#'        Origin to get certificate for. 
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
Network.getCertificate <- function(promise, origin, awaitResult = TRUE) {
  method <- 'Network.getCertificate'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.getCookies
#' 
#' Returns all browser cookies for the current URL. Depending on the backend support, will return
#'        detailed cookie information in the `cookies` field.
#' 
#' @param promise An asynchronous result.
#' @param urls Optional. A list of string. 
#'        The list of URLs for which applicable cookies will be fetched 
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
Network.getCookies <- function(promise, urls = NULL, awaitResult = TRUE) {
  method <- 'Network.getCookies'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.getResponseBody
#' 
#' Returns content served for the given request.
#' 
#' @param promise An asynchronous result.
#' @param requestId A RequestId. 
#'        Identifier of the network request to get content for. 
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
Network.getResponseBody <- function(promise, requestId, awaitResult = TRUE) {
  method <- 'Network.getResponseBody'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.getRequestPostData
#' 
#' Returns post data sent with the request. Returns an error when no data was sent with the request.
#' 
#' @param promise An asynchronous result.
#' @param requestId A RequestId. 
#'        Identifier of the network request to get content for. 
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
Network.getRequestPostData <- function(promise, requestId, awaitResult = TRUE) {
  method <- 'Network.getRequestPostData'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.getResponseBodyForInterception
#' 
#' Returns content served for the given currently intercepted request.
#' 
#' @param promise An asynchronous result.
#' @param interceptionId A InterceptionId. 
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
Network.getResponseBodyForInterception <- function(promise, interceptionId, awaitResult = TRUE) {
  method <- 'Network.getResponseBodyForInterception'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.takeResponseBodyForInterceptionAsStream
#' 
#' Returns a handle to the stream representing the response body. Note that after this command,
#'        the intercepted request can't be continued as is -- you either need to cancel it or to provide
#'        the response body. The stream only supports sequential read, IO.read will fail if the position
#'        is specified.
#' 
#' @param promise An asynchronous result.
#' @param interceptionId A InterceptionId. 
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
Network.takeResponseBodyForInterceptionAsStream <- function(promise, interceptionId, awaitResult = TRUE) {
  method <- 'Network.takeResponseBodyForInterceptionAsStream'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.replayXHR
#' 
#' This method sends a new XMLHttpRequest which is identical to the original one. The following
#'        parameters should be identical: method, url, async, request body, extra headers, withCredentials
#'        attribute, user, password.
#' 
#' @param promise An asynchronous result.
#' @param requestId A RequestId. 
#'        Identifier of XHR to replay. 
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
Network.replayXHR <- function(promise, requestId, awaitResult = TRUE) {
  method <- 'Network.replayXHR'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.searchInResponseBody
#' 
#' Searches for given string in response content.
#' 
#' @param promise An asynchronous result.
#' @param requestId A RequestId. 
#'        Identifier of the network response to search. 
#' @param query A character string. 
#'        String to search for. 
#' @param caseSensitive Optional. A logical. 
#'        If true, search is case sensitive. 
#' @param isRegex Optional. A logical. 
#'        If true, treats string parameter as regex. 
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
Network.searchInResponseBody <- function(promise, requestId, query, caseSensitive = NULL, isRegex = NULL, awaitResult = TRUE) {
  method <- 'Network.searchInResponseBody'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.setBlockedURLs
#' 
#' Blocks URLs from loading.
#' 
#' @param promise An asynchronous result.
#' @param urls A list of string. 
#'        URL patterns to block. Wildcards ('*') are allowed. 
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
Network.setBlockedURLs <- function(promise, urls, awaitResult = TRUE) {
  method <- 'Network.setBlockedURLs'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.setBypassServiceWorker
#' 
#' Toggles ignoring of service worker for each request.
#' 
#' @param promise An asynchronous result.
#' @param bypass A logical. 
#'        Bypass service worker and load from network. 
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
Network.setBypassServiceWorker <- function(promise, bypass, awaitResult = TRUE) {
  method <- 'Network.setBypassServiceWorker'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.setCacheDisabled
#' 
#' Toggles ignoring cache for each request. If `true`, cache will not be used.
#' 
#' @param promise An asynchronous result.
#' @param cacheDisabled A logical. 
#'        Cache disabled state. 
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
Network.setCacheDisabled <- function(promise, cacheDisabled, awaitResult = TRUE) {
  method <- 'Network.setCacheDisabled'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.setCookie
#' 
#' Sets a cookie with the given cookie data; may overwrite equivalent cookies if they exist.
#' 
#' @param promise An asynchronous result.
#' @param name A character string. 
#'        Cookie name. 
#' @param value A character string. 
#'        Cookie value. 
#' @param url Optional. A character string. 
#'        The request-URI to associate with the setting of the cookie. This value can affect the
#'        default domain and path values of the created cookie. 
#' @param domain Optional. A character string. 
#'        Cookie domain. 
#' @param path Optional. A character string. 
#'        Cookie path. 
#' @param secure Optional. A logical. 
#'        True if cookie is secure. 
#' @param httpOnly Optional. A logical. 
#'        True if cookie is http-only. 
#' @param sameSite Optional. A CookieSameSite. 
#'        Cookie SameSite type. 
#' @param expires Optional. A TimeSinceEpoch. 
#'        Cookie expiration date, session cookie if not set 
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
Network.setCookie <- function(promise, name, value, url = NULL, domain = NULL, path = NULL, secure = NULL, httpOnly = NULL, sameSite = NULL, expires = NULL, awaitResult = TRUE) {
  method <- 'Network.setCookie'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.setCookies
#' 
#' Sets given cookies.
#' 
#' @param promise An asynchronous result.
#' @param cookies A list of CookieParam. 
#'        Cookies to be set. 
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
Network.setCookies <- function(promise, cookies, awaitResult = TRUE) {
  method <- 'Network.setCookies'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.setDataSizeLimitsForTest
#' 
#' For testing.
#' 
#' @param promise An asynchronous result.
#' @param maxTotalSize An integer. 
#'        Maximum total buffer size. 
#' @param maxResourceSize An integer. 
#'        Maximum per-resource size. 
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
Network.setDataSizeLimitsForTest <- function(promise, maxTotalSize, maxResourceSize, awaitResult = TRUE) {
  method <- 'Network.setDataSizeLimitsForTest'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.setExtraHTTPHeaders
#' 
#' Specifies whether to always send extra HTTP headers with the requests from this page.
#' 
#' @param promise An asynchronous result.
#' @param headers A Headers. 
#'        Map with extra HTTP headers. 
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
Network.setExtraHTTPHeaders <- function(promise, headers, awaitResult = TRUE) {
  method <- 'Network.setExtraHTTPHeaders'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.setRequestInterception
#' 
#' Sets the requests to intercept that match a the provided patterns and optionally resource types.
#' 
#' @param promise An asynchronous result.
#' @param patterns A list of RequestPattern. 
#'        Requests matching any of these patterns will be forwarded and wait for the corresponding
#'        continueInterceptedRequest call. 
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
Network.setRequestInterception <- function(promise, patterns, awaitResult = TRUE) {
  method <- 'Network.setRequestInterception'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Network.setUserAgentOverride
#' 
#' Allows overriding user agent with the given string.
#' 
#' @param promise An asynchronous result.
#' @param userAgent A character string. 
#'        User agent to use. 
#' @param acceptLanguage Optional. A character string. 
#'        Browser langugage to emulate. 
#' @param platform Optional. A character string. 
#'        The platform navigator.platform should return. 
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
Network.setUserAgentOverride <- function(promise, userAgent, acceptLanguage = NULL, platform = NULL, awaitResult = TRUE) {
  method <- 'Network.setUserAgentOverride'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}
