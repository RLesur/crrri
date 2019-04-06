# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event HeapProfiler.addHeapSnapshotChunk or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param chunk A character string. 
#'         Accepted values: `~ .res$chunk` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"addHeapSnapshotChunk"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `chunk`.
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
HeapProfiler.addHeapSnapshotChunk <- function(promise, chunk = NULL, .callback = NULL) {
  method <- 'HeapProfiler.addHeapSnapshotChunk'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event HeapProfiler.heapStatsUpdate or create a callback
#' 
#' **Event description**:  
#' If heap objects tracking has been started then backend may send update for one or more fragments
#' 
#' @param promise An asynchronous result object.
#' @param statsUpdate A list of integer. 
#'        An array of triplets. Each triplet describes a fragment. The first integer is the fragment
#'        index, the second integer is a total count of objects for the fragment, the third integer is
#'        a total size of the objects for the fragment. Accepted values: `~ .res$statsUpdate` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"heapStatsUpdate"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `statsUpdate`.
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
HeapProfiler.heapStatsUpdate <- function(promise, statsUpdate = NULL, .callback = NULL) {
  method <- 'HeapProfiler.heapStatsUpdate'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event HeapProfiler.lastSeenObjectId or create a callback
#' 
#' **Event description**:  
#' If heap objects tracking has been started then backend regularly sends a current value for last
#'        seen object id and corresponding timestamp. If the were changes in the heap since last event
#'        then one or more heapStatsUpdate events will be sent before a new lastSeenObjectId event.
#' 
#' @param promise An asynchronous result object.
#' @param lastSeenObjectId An integer. 
#'         Accepted values: `~ .res$lastSeenObjectId` (to refer to the previous result).
#' @param timestamp A numeric. 
#'         Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"lastSeenObjectId"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `lastSeenObjectId`, `timestamp`.
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
HeapProfiler.lastSeenObjectId <- function(promise, lastSeenObjectId = NULL, timestamp = NULL, .callback = NULL) {
  method <- 'HeapProfiler.lastSeenObjectId'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event HeapProfiler.reportHeapSnapshotProgress or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param done An integer. 
#'         Accepted values: `~ .res$done` (to refer to the previous result).
#' @param total An integer. 
#'         Accepted values: `~ .res$total` (to refer to the previous result).
#' @param finished A logical. 
#'         Accepted values: `~ .res$finished` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"reportHeapSnapshotProgress"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `done`, `total`, `finished` (optional) .
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
HeapProfiler.reportHeapSnapshotProgress <- function(promise, done = NULL, total = NULL, finished = NULL, .callback = NULL) {
  method <- 'HeapProfiler.reportHeapSnapshotProgress'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event HeapProfiler.resetProfiles or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"resetProfiles"`)
#'        and an element `params` which is a named list.
#'        For this event, `params` is void.
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
HeapProfiler.resetProfiles <- function(promise, .callback = NULL) {
  method <- 'HeapProfiler.resetProfiles'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
