# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event Tracing.bufferUsage or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param percentFull A numeric. 
#'        A number in range `[0..1]` that indicates the used size of event buffer as a fraction of its
#'        total size. Accepted values: `~ .res$percentFull` (to refer to the previous result).
#' @param eventCount A numeric. 
#'        An approximate number of events in the trace log. Accepted values: `~ .res$eventCount` (to refer to the previous result).
#' @param value A numeric. 
#'        A number in range `[0..1]` that indicates the used size of event buffer as a fraction of its
#'        total size. Accepted values: `~ .res$value` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"bufferUsage"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `percentFull` (optional) , `eventCount` (optional) , `value` (optional) .
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
Tracing.bufferUsage <- function(promise, percentFull = NULL, eventCount = NULL, value = NULL, .callback = NULL) {
  method <- 'Tracing.bufferUsage'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Tracing.dataCollected or create a callback
#' 
#' **Event description**:  
#' Contains an bucket of collected trace events. When tracing is stopped collected events will be
#'        send as a sequence of dataCollected events followed by tracingComplete event.
#' 
#' @param promise An asynchronous result object.
#' @param value A list of object. 
#'         Accepted values: `~ .res$value` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"dataCollected"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `value`.
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
Tracing.dataCollected <- function(promise, value = NULL, .callback = NULL) {
  method <- 'Tracing.dataCollected'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Tracing.tracingComplete or create a callback
#' 
#' **Event description**:  
#' Signals that tracing is stopped and there is no trace buffers pending flush, all data were
#'        delivered via dataCollected events.
#' 
#' @param promise An asynchronous result object.
#' @param stream A IO.StreamHandle. 
#'        A handle of the stream that holds resulting trace data. Accepted values: `~ .res$stream` (to refer to the previous result).
#' @param streamCompression A StreamCompression. 
#'        Compression format of returned stream. Accepted values: `~ .res$streamCompression` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"tracingComplete"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `stream` (optional) , `streamCompression` (optional) .
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
Tracing.tracingComplete <- function(promise, stream = NULL, streamCompression = NULL, .callback = NULL) {
  method <- 'Tracing.tracingComplete'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
