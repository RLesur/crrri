# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event Network.dataReceived or create a callback
#' 
#' **Event description**:  
#' Fired when data chunk was received over the network.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param timestamp A MonotonicTime. 
#'        Timestamp. Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param dataLength An integer. 
#'        Data chunk length. Accepted values: `~ .res$dataLength` (to refer to the previous result).
#' @param encodedDataLength An integer. 
#'        Actual bytes received (might be less than dataLength for compressed encodings). Accepted values: `~ .res$encodedDataLength` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"dataReceived"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `timestamp`, `dataLength`, `encodedDataLength`.
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
Network.dataReceived <- function(promise, requestId = NULL, timestamp = NULL, dataLength = NULL, encodedDataLength = NULL, .callback = NULL) {
  method <- 'Network.dataReceived'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.eventSourceMessageReceived or create a callback
#' 
#' **Event description**:  
#' Fired when EventSource message is received.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param timestamp A MonotonicTime. 
#'        Timestamp. Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param eventName A character string. 
#'        Message type. Accepted values: `~ .res$eventName` (to refer to the previous result).
#' @param eventId A character string. 
#'        Message identifier. Accepted values: `~ .res$eventId` (to refer to the previous result).
#' @param data A character string. 
#'        Message content. Accepted values: `~ .res$data` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"eventSourceMessageReceived"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `timestamp`, `eventName`, `eventId`, `data`.
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
Network.eventSourceMessageReceived <- function(promise, requestId = NULL, timestamp = NULL, eventName = NULL, eventId = NULL, data = NULL, .callback = NULL) {
  method <- 'Network.eventSourceMessageReceived'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.loadingFailed or create a callback
#' 
#' **Event description**:  
#' Fired when HTTP request has failed to load.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param timestamp A MonotonicTime. 
#'        Timestamp. Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param type A ResourceType. 
#'        Resource type. Accepted values: `~ .res$type` (to refer to the previous result).
#' @param errorText A character string. 
#'        User friendly error message. Accepted values: `~ .res$errorText` (to refer to the previous result).
#' @param canceled A logical. 
#'        True if loading was canceled. Accepted values: `~ .res$canceled` (to refer to the previous result).
#' @param blockedReason A BlockedReason. 
#'        The reason why loading was blocked, if any. Accepted values: `~ .res$blockedReason` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"loadingFailed"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `timestamp`, `type`, `errorText`, `canceled` (optional) , `blockedReason` (optional) .
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
Network.loadingFailed <- function(promise, requestId = NULL, timestamp = NULL, type = NULL, errorText = NULL, canceled = NULL, blockedReason = NULL, .callback = NULL) {
  method <- 'Network.loadingFailed'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.loadingFinished or create a callback
#' 
#' **Event description**:  
#' Fired when HTTP request has finished loading.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param timestamp A MonotonicTime. 
#'        Timestamp. Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param encodedDataLength A numeric. 
#'        Total number of bytes received for this request. Accepted values: `~ .res$encodedDataLength` (to refer to the previous result).
#' @param shouldReportCorbBlocking A logical. 
#'        Set when 1) response was blocked by Cross-Origin Read Blocking and also
#'        2) this needs to be reported to the DevTools console. Accepted values: `~ .res$shouldReportCorbBlocking` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"loadingFinished"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `timestamp`, `encodedDataLength`, `shouldReportCorbBlocking` (optional) .
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
Network.loadingFinished <- function(promise, requestId = NULL, timestamp = NULL, encodedDataLength = NULL, shouldReportCorbBlocking = NULL, .callback = NULL) {
  method <- 'Network.loadingFinished'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.requestIntercepted or create a callback
#' 
#' **Event description**:  
#' Details of an intercepted HTTP request, which must be either allowed, blocked, modified or
#'        mocked.
#' 
#' @param promise An asynchronous result object.
#' @param interceptionId A InterceptionId. 
#'        Each request the page makes will have a unique id, however if any redirects are encountered
#'        while processing that fetch, they will be reported with the same id as the original fetch.
#'        Likewise if HTTP authentication is needed then the same fetch id will be used. Accepted values: `~ .res$interceptionId` (to refer to the previous result).
#' @param request A Request. 
#'         Accepted values: `~ .res$request` (to refer to the previous result).
#' @param frameId A Page.FrameId. 
#'        The id of the frame that initiated the request. Accepted values: `~ .res$frameId` (to refer to the previous result).
#' @param resourceType A ResourceType. 
#'        How the requested resource will be used. Accepted values: `~ .res$resourceType` (to refer to the previous result).
#' @param isNavigationRequest A logical. 
#'        Whether this is a navigation request, which can abort the navigation completely. Accepted values: `~ .res$isNavigationRequest` (to refer to the previous result).
#' @param isDownload A logical. 
#'        Set if the request is a navigation that will result in a download.
#'        Only present after response is received from the server (i.e. HeadersReceived stage). Accepted values: `~ .res$isDownload` (to refer to the previous result).
#' @param redirectUrl A character string. 
#'        Redirect location, only sent if a redirect was intercepted. Accepted values: `~ .res$redirectUrl` (to refer to the previous result).
#' @param authChallenge A AuthChallenge. 
#'        Details of the Authorization Challenge encountered. If this is set then
#'        continueInterceptedRequest must contain an authChallengeResponse. Accepted values: `~ .res$authChallenge` (to refer to the previous result).
#' @param responseErrorReason A ErrorReason. 
#'        Response error if intercepted at response stage or if redirect occurred while intercepting
#'        request. Accepted values: `~ .res$responseErrorReason` (to refer to the previous result).
#' @param responseStatusCode An integer. 
#'        Response code if intercepted at response stage or if redirect occurred while intercepting
#'        request or auth retry occurred. Accepted values: `~ .res$responseStatusCode` (to refer to the previous result).
#' @param responseHeaders A Headers. 
#'        Response headers if intercepted at the response stage or if redirect occurred while
#'        intercepting request or auth retry occurred. Accepted values: `~ .res$responseHeaders` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"requestIntercepted"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `interceptionId`, `request`, `frameId`, `resourceType`, `isNavigationRequest`, `isDownload` (optional) , `redirectUrl` (optional) , `authChallenge` (optional) , `responseErrorReason` (optional) , `responseStatusCode` (optional) , `responseHeaders` (optional) .
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
Network.requestIntercepted <- function(promise, interceptionId = NULL, request = NULL, frameId = NULL, resourceType = NULL, isNavigationRequest = NULL, isDownload = NULL, redirectUrl = NULL, authChallenge = NULL, responseErrorReason = NULL, responseStatusCode = NULL, responseHeaders = NULL, .callback = NULL) {
  method <- 'Network.requestIntercepted'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.requestServedFromCache or create a callback
#' 
#' **Event description**:  
#' Fired if request ended up loading from cache.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"requestServedFromCache"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`.
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
Network.requestServedFromCache <- function(promise, requestId = NULL, .callback = NULL) {
  method <- 'Network.requestServedFromCache'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.requestWillBeSent or create a callback
#' 
#' **Event description**:  
#' Fired when page is about to send HTTP request.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param loaderId A LoaderId. 
#'        Loader identifier. Empty string if the request is fetched from worker. Accepted values: `~ .res$loaderId` (to refer to the previous result).
#' @param documentURL A character string. 
#'        URL of the document this request is loaded for. Accepted values: `~ .res$documentURL` (to refer to the previous result).
#' @param request A Request. 
#'        Request data. Accepted values: `~ .res$request` (to refer to the previous result).
#' @param timestamp A MonotonicTime. 
#'        Timestamp. Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param wallTime A TimeSinceEpoch. 
#'        Timestamp. Accepted values: `~ .res$wallTime` (to refer to the previous result).
#' @param initiator A Initiator. 
#'        Request initiator. Accepted values: `~ .res$initiator` (to refer to the previous result).
#' @param redirectResponse A Response. 
#'        Redirect response data. Accepted values: `~ .res$redirectResponse` (to refer to the previous result).
#' @param type A ResourceType. 
#'        Type of this resource. Accepted values: `~ .res$type` (to refer to the previous result).
#' @param frameId A Page.FrameId. 
#'        Frame identifier. Accepted values: `~ .res$frameId` (to refer to the previous result).
#' @param hasUserGesture A logical. 
#'        Whether the request is initiated by a user gesture. Defaults to false. Accepted values: `~ .res$hasUserGesture` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"requestWillBeSent"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `loaderId`, `documentURL`, `request`, `timestamp`, `wallTime`, `initiator`, `redirectResponse` (optional) , `type` (optional) , `frameId` (optional) , `hasUserGesture` (optional) .
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
Network.requestWillBeSent <- function(promise, requestId = NULL, loaderId = NULL, documentURL = NULL, request = NULL, timestamp = NULL, wallTime = NULL, initiator = NULL, redirectResponse = NULL, type = NULL, frameId = NULL, hasUserGesture = NULL, .callback = NULL) {
  method <- 'Network.requestWillBeSent'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.resourceChangedPriority or create a callback
#' 
#' **Event description**:  
#' Fired when resource loading priority is changed
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param newPriority A ResourcePriority. 
#'        New priority Accepted values: `~ .res$newPriority` (to refer to the previous result).
#' @param timestamp A MonotonicTime. 
#'        Timestamp. Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"resourceChangedPriority"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `newPriority`, `timestamp`.
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
Network.resourceChangedPriority <- function(promise, requestId = NULL, newPriority = NULL, timestamp = NULL, .callback = NULL) {
  method <- 'Network.resourceChangedPriority'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.signedExchangeReceived or create a callback
#' 
#' **Event description**:  
#' Fired when a signed exchange was received over the network
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param info A SignedExchangeInfo. 
#'        Information about the signed exchange response. Accepted values: `~ .res$info` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"signedExchangeReceived"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `info`.
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
Network.signedExchangeReceived <- function(promise, requestId = NULL, info = NULL, .callback = NULL) {
  method <- 'Network.signedExchangeReceived'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.responseReceived or create a callback
#' 
#' **Event description**:  
#' Fired when HTTP response is available.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param loaderId A LoaderId. 
#'        Loader identifier. Empty string if the request is fetched from worker. Accepted values: `~ .res$loaderId` (to refer to the previous result).
#' @param timestamp A MonotonicTime. 
#'        Timestamp. Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param type A ResourceType. 
#'        Resource type. Accepted values: `~ .res$type` (to refer to the previous result).
#' @param response A Response. 
#'        Response data. Accepted values: `~ .res$response` (to refer to the previous result).
#' @param frameId A Page.FrameId. 
#'        Frame identifier. Accepted values: `~ .res$frameId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"responseReceived"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `loaderId`, `timestamp`, `type`, `response`, `frameId` (optional) .
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
Network.responseReceived <- function(promise, requestId = NULL, loaderId = NULL, timestamp = NULL, type = NULL, response = NULL, frameId = NULL, .callback = NULL) {
  method <- 'Network.responseReceived'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.webSocketClosed or create a callback
#' 
#' **Event description**:  
#' Fired when WebSocket is closed.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param timestamp A MonotonicTime. 
#'        Timestamp. Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"webSocketClosed"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `timestamp`.
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
Network.webSocketClosed <- function(promise, requestId = NULL, timestamp = NULL, .callback = NULL) {
  method <- 'Network.webSocketClosed'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.webSocketCreated or create a callback
#' 
#' **Event description**:  
#' Fired upon WebSocket creation.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param url A character string. 
#'        WebSocket request URL. Accepted values: `~ .res$url` (to refer to the previous result).
#' @param initiator A Initiator. 
#'        Request initiator. Accepted values: `~ .res$initiator` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"webSocketCreated"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `url`, `initiator` (optional) .
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
Network.webSocketCreated <- function(promise, requestId = NULL, url = NULL, initiator = NULL, .callback = NULL) {
  method <- 'Network.webSocketCreated'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.webSocketFrameError or create a callback
#' 
#' **Event description**:  
#' Fired when WebSocket frame error occurs.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param timestamp A MonotonicTime. 
#'        Timestamp. Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param errorMessage A character string. 
#'        WebSocket frame error message. Accepted values: `~ .res$errorMessage` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"webSocketFrameError"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `timestamp`, `errorMessage`.
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
Network.webSocketFrameError <- function(promise, requestId = NULL, timestamp = NULL, errorMessage = NULL, .callback = NULL) {
  method <- 'Network.webSocketFrameError'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.webSocketFrameReceived or create a callback
#' 
#' **Event description**:  
#' Fired when WebSocket frame is received.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param timestamp A MonotonicTime. 
#'        Timestamp. Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param response A WebSocketFrame. 
#'        WebSocket response data. Accepted values: `~ .res$response` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"webSocketFrameReceived"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `timestamp`, `response`.
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
Network.webSocketFrameReceived <- function(promise, requestId = NULL, timestamp = NULL, response = NULL, .callback = NULL) {
  method <- 'Network.webSocketFrameReceived'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.webSocketFrameSent or create a callback
#' 
#' **Event description**:  
#' Fired when WebSocket frame is sent.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param timestamp A MonotonicTime. 
#'        Timestamp. Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param response A WebSocketFrame. 
#'        WebSocket response data. Accepted values: `~ .res$response` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"webSocketFrameSent"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `timestamp`, `response`.
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
Network.webSocketFrameSent <- function(promise, requestId = NULL, timestamp = NULL, response = NULL, .callback = NULL) {
  method <- 'Network.webSocketFrameSent'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.webSocketHandshakeResponseReceived or create a callback
#' 
#' **Event description**:  
#' Fired when WebSocket handshake response becomes available.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param timestamp A MonotonicTime. 
#'        Timestamp. Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param response A WebSocketResponse. 
#'        WebSocket response data. Accepted values: `~ .res$response` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"webSocketHandshakeResponseReceived"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `timestamp`, `response`.
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
Network.webSocketHandshakeResponseReceived <- function(promise, requestId = NULL, timestamp = NULL, response = NULL, .callback = NULL) {
  method <- 'Network.webSocketHandshakeResponseReceived'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Network.webSocketWillSendHandshakeRequest or create a callback
#' 
#' **Event description**:  
#' Fired when WebSocket is about to initiate handshake.
#' 
#' @param promise An asynchronous result object.
#' @param requestId A RequestId. 
#'        Request identifier. Accepted values: `~ .res$requestId` (to refer to the previous result).
#' @param timestamp A MonotonicTime. 
#'        Timestamp. Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param wallTime A TimeSinceEpoch. 
#'        UTC Timestamp. Accepted values: `~ .res$wallTime` (to refer to the previous result).
#' @param request A WebSocketRequest. 
#'        WebSocket request data. Accepted values: `~ .res$request` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"webSocketWillSendHandshakeRequest"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `requestId`, `timestamp`, `wallTime`, `request`.
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
Network.webSocketWillSendHandshakeRequest <- function(promise, requestId = NULL, timestamp = NULL, wallTime = NULL, request = NULL, .callback = NULL) {
  method <- 'Network.webSocketWillSendHandshakeRequest'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
