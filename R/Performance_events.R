# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event Performance.metrics or create a callback
#' 
#' **Event description**:  
#' Current values of the metrics.
#' 
#' @param promise An asynchronous result object.
#' @param metrics A list of Metric. 
#'        Current values of the metrics. Accepted values: `~ .res$metrics` (to refer to the previous result).
#' @param title A character string. 
#'        Timestamp title. Accepted values: `~ .res$title` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"metrics"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `metrics`, `title`.
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
Performance.metrics <- function(promise, metrics = NULL, title = NULL, .callback = NULL) {
  method <- 'Performance.metrics'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
