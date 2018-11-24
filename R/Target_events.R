# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event Target.attachedToTarget or create a callback
#' 
#' **Event description**:  
#' Issued when attached to target because of auto-attach or `attachToTarget` command.
#' 
#' @param promise An asynchronous result object.
#' @param sessionId A SessionID. 
#'        Identifier assigned to the session used to send/receive messages. Accepted values: `~ .res$sessionId` (to refer to the previous result).
#' @param targetInfo A TargetInfo. 
#'         Accepted values: `~ .res$targetInfo` (to refer to the previous result).
#' @param waitingForDebugger A logical. 
#'         Accepted values: `~ .res$waitingForDebugger` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"attachedToTarget"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `sessionId`, `targetInfo`, `waitingForDebugger`.
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
Target.attachedToTarget <- function(promise, sessionId = NULL, targetInfo = NULL, waitingForDebugger = NULL, .callback = NULL) {
  method <- 'Target.attachedToTarget'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Target.detachedFromTarget or create a callback
#' 
#' **Event description**:  
#' Issued when detached from target for any reason (including `detachFromTarget` command). Can be
#'        issued multiple times per target if multiple sessions have been attached to it.
#' 
#' @param promise An asynchronous result object.
#' @param sessionId A SessionID. 
#'        Detached session identifier. Accepted values: `~ .res$sessionId` (to refer to the previous result).
#' @param targetId Deprecated. A TargetID. 
#'        Deprecated. Accepted values: `~ .res$targetId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"detachedFromTarget"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `sessionId`, `targetId` (optional) .
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
Target.detachedFromTarget <- function(promise, sessionId = NULL, targetId = NULL, .callback = NULL) {
  method <- 'Target.detachedFromTarget'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Target.receivedMessageFromTarget or create a callback
#' 
#' **Event description**:  
#' Notifies about a new protocol message received from the session (as reported in
#'        `attachedToTarget` event).
#' 
#' @param promise An asynchronous result object.
#' @param sessionId A SessionID. 
#'        Identifier of a session which sends a message. Accepted values: `~ .res$sessionId` (to refer to the previous result).
#' @param message A character string. 
#'         Accepted values: `~ .res$message` (to refer to the previous result).
#' @param targetId Deprecated. A TargetID. 
#'        Deprecated. Accepted values: `~ .res$targetId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"receivedMessageFromTarget"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `sessionId`, `message`, `targetId` (optional) .
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
Target.receivedMessageFromTarget <- function(promise, sessionId = NULL, message = NULL, targetId = NULL, .callback = NULL) {
  method <- 'Target.receivedMessageFromTarget'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Target.targetCreated or create a callback
#' 
#' **Event description**:  
#' Issued when a possible inspection target is created.
#' 
#' @param promise An asynchronous result object.
#' @param targetInfo A TargetInfo. 
#'         Accepted values: `~ .res$targetInfo` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"targetCreated"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `targetInfo`.
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
Target.targetCreated <- function(promise, targetInfo = NULL, .callback = NULL) {
  method <- 'Target.targetCreated'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Target.targetDestroyed or create a callback
#' 
#' **Event description**:  
#' Issued when a target is destroyed.
#' 
#' @param promise An asynchronous result object.
#' @param targetId A TargetID. 
#'         Accepted values: `~ .res$targetId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"targetDestroyed"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `targetId`.
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
Target.targetDestroyed <- function(promise, targetId = NULL, .callback = NULL) {
  method <- 'Target.targetDestroyed'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Target.targetCrashed or create a callback
#' 
#' **Event description**:  
#' Issued when a target has crashed.
#' 
#' @param promise An asynchronous result object.
#' @param targetId A TargetID. 
#'         Accepted values: `~ .res$targetId` (to refer to the previous result).
#' @param status A character string. 
#'        Termination status type. Accepted values: `~ .res$status` (to refer to the previous result).
#' @param errorCode An integer. 
#'        Termination error code. Accepted values: `~ .res$errorCode` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"targetCrashed"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `targetId`, `status`, `errorCode`.
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
Target.targetCrashed <- function(promise, targetId = NULL, status = NULL, errorCode = NULL, .callback = NULL) {
  method <- 'Target.targetCrashed'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Target.targetInfoChanged or create a callback
#' 
#' **Event description**:  
#' Issued when some information about a target has changed. This only happens between
#'        `targetCreated` and `targetDestroyed`.
#' 
#' @param promise An asynchronous result object.
#' @param targetInfo A TargetInfo. 
#'         Accepted values: `~ .res$targetInfo` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"targetInfoChanged"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `targetInfo`.
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
Target.targetInfoChanged <- function(promise, targetInfo = NULL, .callback = NULL) {
  method <- 'Target.targetInfoChanged'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
