# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Network.clearBrowserCache
#' 
#' Clears browser cache.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.clearBrowserCache <- function(promise) {
  method <- 'Network.clearBrowserCache'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.clearBrowserCookies
#' 
#' Clears browser cookies.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.clearBrowserCookies <- function(promise) {
  method <- 'Network.clearBrowserCookies'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.continueInterceptedRequest
#' 
#' Response to Network.requestIntercepted which either modifies the request to continue with any
#'        modifications, or blocks it, or completes it with the provided response bytes. If a network
#'        fetch occurs as a result which encounters a redirect an additional Network.requestIntercepted
#'        event will be sent with the same InterceptionId.
#' 
#' @param promise An aynchronous result object.
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
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.continueInterceptedRequest <- function(promise, interceptionId, errorReason = NULL, rawResponse = NULL, url = NULL, method = NULL, postData = NULL, headers = NULL, authChallengeResponse = NULL) {
  method <- 'Network.continueInterceptedRequest'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.deleteCookies
#' 
#' Deletes browser cookies with matching name and url or domain/path pair.
#' 
#' @param promise An aynchronous result object.
#' @param name A character string. 
#'        Name of the cookies to remove. 
#' @param url Optional. A character string. 
#'        If specified, deletes all the cookies with the given name where domain and path match
#'        provided URL. 
#' @param domain Optional. A character string. 
#'        If specified, deletes only cookies with the exact domain. 
#' @param path Optional. A character string. 
#'        If specified, deletes only cookies with the exact path. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.deleteCookies <- function(promise, name, url = NULL, domain = NULL, path = NULL) {
  method <- 'Network.deleteCookies'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.disable
#' 
#' Disables network tracking, prevents network events from being sent to the client.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.disable <- function(promise) {
  method <- 'Network.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.emulateNetworkConditions
#' 
#' Activates emulation of network conditions.
#' 
#' @param promise An aynchronous result object.
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
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.emulateNetworkConditions <- function(promise, offline, latency, downloadThroughput, uploadThroughput, connectionType = NULL) {
  method <- 'Network.emulateNetworkConditions'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.enable
#' 
#' Enables network tracking, network events will now be delivered to the client.
#' 
#' @param promise An aynchronous result object.
#' @param maxTotalBufferSize Experimental. Optional. An integer. 
#'        Buffer size in bytes to use when preserving network payloads (XHRs, etc). 
#' @param maxResourceBufferSize Experimental. Optional. An integer. 
#'        Per-resource buffer size in bytes to use when preserving network payloads (XHRs, etc). 
#' @param maxPostDataSize Optional. An integer. 
#'        Longest post body size (in bytes) that would be included in requestWillBeSent notification 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.enable <- function(promise, maxTotalBufferSize = NULL, maxResourceBufferSize = NULL, maxPostDataSize = NULL) {
  method <- 'Network.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.getAllCookies
#' 
#' Returns all browser cookies. Depending on the backend support, will return detailed cookie
#'        information in the `cookies` field.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Network.getAllCookies <- function(promise) {
  method <- 'Network.getAllCookies'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.getCertificate
#' 
#' Returns the DER-encoded certificate.
#' 
#' @param promise An aynchronous result object.
#' @param origin A character string. 
#'        Origin to get certificate for. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Network.getCertificate <- function(promise, origin) {
  method <- 'Network.getCertificate'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.getCookies
#' 
#' Returns all browser cookies for the current URL. Depending on the backend support, will return
#'        detailed cookie information in the `cookies` field.
#' 
#' @param promise An aynchronous result object.
#' @param urls Optional. A list of string. 
#'        The list of URLs for which applicable cookies will be fetched 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Network.getCookies <- function(promise, urls = NULL) {
  method <- 'Network.getCookies'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.getResponseBody
#' 
#' Returns content served for the given request.
#' 
#' @param promise An aynchronous result object.
#' @param requestId A RequestId. 
#'        Identifier of the network request to get content for. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
Network.getResponseBody <- function(promise, requestId) {
  method <- 'Network.getResponseBody'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.getRequestPostData
#' 
#' Returns post data sent with the request. Returns an error when no data was sent with the request.
#' 
#' @param promise An aynchronous result object.
#' @param requestId A RequestId. 
#'        Identifier of the network request to get content for. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Network.getRequestPostData <- function(promise, requestId) {
  method <- 'Network.getRequestPostData'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.getResponseBodyForInterception
#' 
#' Returns content served for the given currently intercepted request.
#' 
#' @param promise An aynchronous result object.
#' @param interceptionId A InterceptionId. 
#'        Identifier for the intercepted request to get body for. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
Network.getResponseBodyForInterception <- function(promise, interceptionId) {
  method <- 'Network.getResponseBodyForInterception'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.takeResponseBodyForInterceptionAsStream
#' 
#' Returns a handle to the stream representing the response body. Note that after this command,
#'        the intercepted request can't be continued as is -- you either need to cancel it or to provide
#'        the response body. The stream only supports sequential read, IO.read will fail if the position
#'        is specified.
#' 
#' @param promise An aynchronous result object.
#' @param interceptionId A InterceptionId. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Network.takeResponseBodyForInterceptionAsStream <- function(promise, interceptionId) {
  method <- 'Network.takeResponseBodyForInterceptionAsStream'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.replayXHR
#' 
#' This method sends a new XMLHttpRequest which is identical to the original one. The following
#'        parameters should be identical: method, url, async, request body, extra headers, withCredentials
#'        attribute, user, password.
#' 
#' @param promise An aynchronous result object.
#' @param requestId A RequestId. 
#'        Identifier of XHR to replay. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.replayXHR <- function(promise, requestId) {
  method <- 'Network.replayXHR'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.searchInResponseBody
#' 
#' Searches for given string in response content.
#' 
#' @param promise An aynchronous result object.
#' @param requestId A RequestId. 
#'        Identifier of the network response to search. 
#' @param query A character string. 
#'        String to search for. 
#' @param caseSensitive Optional. A logical. 
#'        If true, search is case sensitive. 
#' @param isRegex Optional. A logical. 
#'        If true, treats string parameter as regex. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Network.searchInResponseBody <- function(promise, requestId, query, caseSensitive = NULL, isRegex = NULL) {
  method <- 'Network.searchInResponseBody'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.setBlockedURLs
#' 
#' Blocks URLs from loading.
#' 
#' @param promise An aynchronous result object.
#' @param urls A list of string. 
#'        URL patterns to block. Wildcards ('*') are allowed. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.setBlockedURLs <- function(promise, urls) {
  method <- 'Network.setBlockedURLs'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.setBypassServiceWorker
#' 
#' Toggles ignoring of service worker for each request.
#' 
#' @param promise An aynchronous result object.
#' @param bypass A logical. 
#'        Bypass service worker and load from network. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.setBypassServiceWorker <- function(promise, bypass) {
  method <- 'Network.setBypassServiceWorker'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.setCacheDisabled
#' 
#' Toggles ignoring cache for each request. If `true`, cache will not be used.
#' 
#' @param promise An aynchronous result object.
#' @param cacheDisabled A logical. 
#'        Cache disabled state. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.setCacheDisabled <- function(promise, cacheDisabled) {
  method <- 'Network.setCacheDisabled'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.setCookie
#' 
#' Sets a cookie with the given cookie data; may overwrite equivalent cookies if they exist.
#' 
#' @param promise An aynchronous result object.
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
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Network.setCookie <- function(promise, name, value, url = NULL, domain = NULL, path = NULL, secure = NULL, httpOnly = NULL, sameSite = NULL, expires = NULL) {
  method <- 'Network.setCookie'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.setCookies
#' 
#' Sets given cookies.
#' 
#' @param promise An aynchronous result object.
#' @param cookies A list of CookieParam. 
#'        Cookies to be set. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.setCookies <- function(promise, cookies) {
  method <- 'Network.setCookies'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.setDataSizeLimitsForTest
#' 
#' For testing.
#' 
#' @param promise An aynchronous result object.
#' @param maxTotalSize An integer. 
#'        Maximum total buffer size. 
#' @param maxResourceSize An integer. 
#'        Maximum per-resource size. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.setDataSizeLimitsForTest <- function(promise, maxTotalSize, maxResourceSize) {
  method <- 'Network.setDataSizeLimitsForTest'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.setExtraHTTPHeaders
#' 
#' Specifies whether to always send extra HTTP headers with the requests from this page.
#' 
#' @param promise An aynchronous result object.
#' @param headers A Headers. 
#'        Map with extra HTTP headers. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.setExtraHTTPHeaders <- function(promise, headers) {
  method <- 'Network.setExtraHTTPHeaders'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.setRequestInterception
#' 
#' Sets the requests to intercept that match a the provided patterns and optionally resource types.
#' 
#' @param promise An aynchronous result object.
#' @param patterns A list of RequestPattern. 
#'        Requests matching any of these patterns will be forwarded and wait for the corresponding
#'        continueInterceptedRequest call. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.setRequestInterception <- function(promise, patterns) {
  method <- 'Network.setRequestInterception'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Network.setUserAgentOverride
#' 
#' Allows overriding user agent with the given string.
#' 
#' @param promise An aynchronous result object.
#' @param userAgent A character string. 
#'        User agent to use. 
#' @param acceptLanguage Optional. A character string. 
#'        Browser langugage to emulate. 
#' @param platform Optional. A character string. 
#'        The platform navigator.platform should return. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Network.setUserAgentOverride <- function(promise, userAgent, acceptLanguage = NULL, platform = NULL) {
  method <- 'Network.setUserAgentOverride'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
