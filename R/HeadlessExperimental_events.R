# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event HeadlessExperimental.needsBeginFramesChanged or create a callback
#' 
#' **Event description**:  
#' Issued when the target starts or stops needing BeginFrames.
#' 
#' @param promise An asynchronous result object.
#' @param needsBeginFrames A logical. 
#'        True if BeginFrames are needed, false otherwise. Accepted values: `~ .res$needsBeginFrames` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"needsBeginFramesChanged"`)
#'        and an element `params` which is a named list. The `params` list is composed of
#'        the following element(s): `needsBeginFrames`.
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
HeadlessExperimental.needsBeginFramesChanged <- function(promise, needsBeginFrames = NULL, .callback = NULL) {
  method <- 'HeadlessExperimental.needsBeginFramesChanged'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
