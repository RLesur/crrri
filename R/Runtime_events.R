# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event Runtime.bindingCalled or create a callback
#' 
#' **Event description**:  
#' Notification is issued every time when binding is called.
#' 
#' @param promise An asynchronous result object.
#' @param name A character string. 
#'         Accepted values: `~ .res$name` (to refer to the previous result).
#' @param payload A character string. 
#'         Accepted values: `~ .res$payload` (to refer to the previous result).
#' @param executionContextId A ExecutionContextId. 
#'        Identifier of the context where the call was made. Accepted values: `~ .res$executionContextId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"bindingCalled"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `name`, `payload`, `executionContextId`.
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
Runtime.bindingCalled <- function(promise, name = NULL, payload = NULL, executionContextId = NULL, .callback = NULL) {
  method <- 'Runtime.bindingCalled'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Runtime.consoleAPICalled or create a callback
#' 
#' **Event description**:  
#' Issued when console API was called.
#' 
#' @param promise An asynchronous result object.
#' @param type A character string. 
#'        Type of the call. Accepted values: `~ .res$type` (to refer to the previous result), log, debug, info, error, warning, dir, dirxml, table, trace, clear, startGroup, startGroupCollapsed, endGroup, assert, profile, profileEnd, count, timeEnd.
#' @param args A list of RemoteObject. 
#'        Call arguments. Accepted values: `~ .res$args` (to refer to the previous result).
#' @param executionContextId A ExecutionContextId. 
#'        Identifier of the context where the call was made. Accepted values: `~ .res$executionContextId` (to refer to the previous result).
#' @param timestamp A Timestamp. 
#'        Call timestamp. Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param stackTrace A StackTrace. 
#'        Stack trace captured when the call was made. Accepted values: `~ .res$stackTrace` (to refer to the previous result).
#' @param context Experimental. A character string. 
#'        Console context descriptor for calls on non-default console context (not console.*):
#'        'anonymous#unique-logger-id' for call on unnamed context, 'name#unique-logger-id' for call
#'        on named context. Accepted values: `~ .res$context` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"consoleAPICalled"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `type`, `args`, `executionContextId`, `timestamp`, `stackTrace` (optional) , `context` (optional) .
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
Runtime.consoleAPICalled <- function(promise, type = NULL, args = NULL, executionContextId = NULL, timestamp = NULL, stackTrace = NULL, context = NULL, .callback = NULL) {
  method <- 'Runtime.consoleAPICalled'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Runtime.exceptionRevoked or create a callback
#' 
#' **Event description**:  
#' Issued when unhandled exception was revoked.
#' 
#' @param promise An asynchronous result object.
#' @param reason A character string. 
#'        Reason describing why exception was revoked. Accepted values: `~ .res$reason` (to refer to the previous result).
#' @param exceptionId An integer. 
#'        The id of revoked exception, as reported in `exceptionThrown`. Accepted values: `~ .res$exceptionId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"exceptionRevoked"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `reason`, `exceptionId`.
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
Runtime.exceptionRevoked <- function(promise, reason = NULL, exceptionId = NULL, .callback = NULL) {
  method <- 'Runtime.exceptionRevoked'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Runtime.exceptionThrown or create a callback
#' 
#' **Event description**:  
#' Issued when exception was thrown and unhandled.
#' 
#' @param promise An asynchronous result object.
#' @param timestamp A Timestamp. 
#'        Timestamp of the exception. Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param exceptionDetails A ExceptionDetails. 
#'         Accepted values: `~ .res$exceptionDetails` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"exceptionThrown"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `timestamp`, `exceptionDetails`.
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
Runtime.exceptionThrown <- function(promise, timestamp = NULL, exceptionDetails = NULL, .callback = NULL) {
  method <- 'Runtime.exceptionThrown'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Runtime.executionContextCreated or create a callback
#' 
#' **Event description**:  
#' Issued when new execution context is created.
#' 
#' @param promise An asynchronous result object.
#' @param context A ExecutionContextDescription. 
#'        A newly created execution context. Accepted values: `~ .res$context` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"executionContextCreated"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `context`.
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
Runtime.executionContextCreated <- function(promise, context = NULL, .callback = NULL) {
  method <- 'Runtime.executionContextCreated'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Runtime.executionContextDestroyed or create a callback
#' 
#' **Event description**:  
#' Issued when execution context is destroyed.
#' 
#' @param promise An asynchronous result object.
#' @param executionContextId A ExecutionContextId. 
#'        Id of the destroyed context Accepted values: `~ .res$executionContextId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"executionContextDestroyed"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `executionContextId`.
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
Runtime.executionContextDestroyed <- function(promise, executionContextId = NULL, .callback = NULL) {
  method <- 'Runtime.executionContextDestroyed'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Runtime.executionContextsCleared or create a callback
#' 
#' **Event description**:  
#' Issued when all executionContexts were cleared in browser
#' 
#' @param promise An asynchronous result object.
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"executionContextsCleared"`)
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
Runtime.executionContextsCleared <- function(promise, .callback = NULL) {
  method <- 'Runtime.executionContextsCleared'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Runtime.inspectRequested or create a callback
#' 
#' **Event description**:  
#' Issued when object should be inspected (for example, as a result of inspect() command line API
#'        call).
#' 
#' @param promise An asynchronous result object.
#' @param object A RemoteObject. 
#'         Accepted values: `~ .res$object` (to refer to the previous result).
#' @param hints NA
#'         Accepted values: `~ .res$hints` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"inspectRequested"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `object`, `hints`.
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
Runtime.inspectRequested <- function(promise, object = NULL, hints = NULL, .callback = NULL) {
  method <- 'Runtime.inspectRequested'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
