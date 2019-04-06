# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event Debugger.breakpointResolved or create a callback
#' 
#' **Event description**:  
#' Fired when breakpoint is resolved to an actual script and location.
#' 
#' @param promise An asynchronous result object.
#' @param breakpointId A BreakpointId. 
#'        Breakpoint unique identifier. Accepted values: `~ .res$breakpointId` (to refer to the previous result).
#' @param location A Location. 
#'        Actual breakpoint location. Accepted values: `~ .res$location` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"breakpointResolved"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `breakpointId`, `location`.
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
Debugger.breakpointResolved <- function(promise, breakpointId = NULL, location = NULL, .callback = NULL) {
  method <- 'Debugger.breakpointResolved'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Debugger.paused or create a callback
#' 
#' **Event description**:  
#' Fired when the virtual machine stopped on breakpoint or exception or any other stop criteria.
#' 
#' @param promise An asynchronous result object.
#' @param callFrames A list of CallFrame. 
#'        Call stack the virtual machine stopped on. Accepted values: `~ .res$callFrames` (to refer to the previous result).
#' @param reason A character string. 
#'        Pause reason. Accepted values: `~ .res$reason` (to refer to the previous result), XHR, DOM, EventListener, exception, assert, debugCommand, promiseRejection, OOM, other, ambiguous.
#' @param data NA
#'        Object containing break-specific auxiliary properties. Accepted values: `~ .res$data` (to refer to the previous result).
#' @param hitBreakpoints A list of string. 
#'        Hit breakpoints IDs Accepted values: `~ .res$hitBreakpoints` (to refer to the previous result).
#' @param asyncStackTrace A Runtime.StackTrace. 
#'        Async stack trace, if any. Accepted values: `~ .res$asyncStackTrace` (to refer to the previous result).
#' @param asyncStackTraceId Experimental. A Runtime.StackTraceId. 
#'        Async stack trace, if any. Accepted values: `~ .res$asyncStackTraceId` (to refer to the previous result).
#' @param asyncCallStackTraceId Experimental. A Runtime.StackTraceId. 
#'        Just scheduled async call will have this stack trace as parent stack during async execution.
#'        This field is available only after `Debugger.stepInto` call with `breakOnAsynCall` flag. Accepted values: `~ .res$asyncCallStackTraceId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"paused"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `callFrames`, `reason`, `data` (optional) , `hitBreakpoints` (optional) , `asyncStackTrace` (optional) , `asyncStackTraceId` (optional) , `asyncCallStackTraceId` (optional) .
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
Debugger.paused <- function(promise, callFrames = NULL, reason = NULL, data = NULL, hitBreakpoints = NULL, asyncStackTrace = NULL, asyncStackTraceId = NULL, asyncCallStackTraceId = NULL, .callback = NULL) {
  method <- 'Debugger.paused'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Debugger.resumed or create a callback
#' 
#' **Event description**:  
#' Fired when the virtual machine resumed execution.
#' 
#' @param promise An asynchronous result object.
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"resumed"`)
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
Debugger.resumed <- function(promise, .callback = NULL) {
  method <- 'Debugger.resumed'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Debugger.scriptFailedToParse or create a callback
#' 
#' **Event description**:  
#' Fired when virtual machine fails to parse the script.
#' 
#' @param promise An asynchronous result object.
#' @param scriptId A Runtime.ScriptId. 
#'        Identifier of the script parsed. Accepted values: `~ .res$scriptId` (to refer to the previous result).
#' @param url A character string. 
#'        URL or name of the script parsed (if any). Accepted values: `~ .res$url` (to refer to the previous result).
#' @param startLine An integer. 
#'        Line offset of the script within the resource with given URL (for script tags). Accepted values: `~ .res$startLine` (to refer to the previous result).
#' @param startColumn An integer. 
#'        Column offset of the script within the resource with given URL. Accepted values: `~ .res$startColumn` (to refer to the previous result).
#' @param endLine An integer. 
#'        Last line of the script. Accepted values: `~ .res$endLine` (to refer to the previous result).
#' @param endColumn An integer. 
#'        Length of the last line of the script. Accepted values: `~ .res$endColumn` (to refer to the previous result).
#' @param executionContextId A Runtime.ExecutionContextId. 
#'        Specifies script creation context. Accepted values: `~ .res$executionContextId` (to refer to the previous result).
#' @param hash A character string. 
#'        Content hash of the script. Accepted values: `~ .res$hash` (to refer to the previous result).
#' @param executionContextAuxData NA
#'        Embedder-specific auxiliary data. Accepted values: `~ .res$executionContextAuxData` (to refer to the previous result).
#' @param sourceMapURL A character string. 
#'        URL of source map associated with script (if any). Accepted values: `~ .res$sourceMapURL` (to refer to the previous result).
#' @param hasSourceURL A logical. 
#'        True, if this script has sourceURL. Accepted values: `~ .res$hasSourceURL` (to refer to the previous result).
#' @param isModule A logical. 
#'        True, if this script is ES6 module. Accepted values: `~ .res$isModule` (to refer to the previous result).
#' @param length An integer. 
#'        This script length. Accepted values: `~ .res$length` (to refer to the previous result).
#' @param stackTrace Experimental. A Runtime.StackTrace. 
#'        JavaScript top stack frame of where the script parsed event was triggered if available. Accepted values: `~ .res$stackTrace` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"scriptFailedToParse"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `scriptId`, `url`, `startLine`, `startColumn`, `endLine`, `endColumn`, `executionContextId`, `hash`, `executionContextAuxData` (optional) , `sourceMapURL` (optional) , `hasSourceURL` (optional) , `isModule` (optional) , `length` (optional) , `stackTrace` (optional) .
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
Debugger.scriptFailedToParse <- function(promise, scriptId = NULL, url = NULL, startLine = NULL, startColumn = NULL, endLine = NULL, endColumn = NULL, executionContextId = NULL, hash = NULL, executionContextAuxData = NULL, sourceMapURL = NULL, hasSourceURL = NULL, isModule = NULL, length = NULL, stackTrace = NULL, .callback = NULL) {
  method <- 'Debugger.scriptFailedToParse'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Debugger.scriptParsed or create a callback
#' 
#' **Event description**:  
#' Fired when virtual machine parses script. This event is also fired for all known and uncollected
#'        scripts upon enabling debugger.
#' 
#' @param promise An asynchronous result object.
#' @param scriptId A Runtime.ScriptId. 
#'        Identifier of the script parsed. Accepted values: `~ .res$scriptId` (to refer to the previous result).
#' @param url A character string. 
#'        URL or name of the script parsed (if any). Accepted values: `~ .res$url` (to refer to the previous result).
#' @param startLine An integer. 
#'        Line offset of the script within the resource with given URL (for script tags). Accepted values: `~ .res$startLine` (to refer to the previous result).
#' @param startColumn An integer. 
#'        Column offset of the script within the resource with given URL. Accepted values: `~ .res$startColumn` (to refer to the previous result).
#' @param endLine An integer. 
#'        Last line of the script. Accepted values: `~ .res$endLine` (to refer to the previous result).
#' @param endColumn An integer. 
#'        Length of the last line of the script. Accepted values: `~ .res$endColumn` (to refer to the previous result).
#' @param executionContextId A Runtime.ExecutionContextId. 
#'        Specifies script creation context. Accepted values: `~ .res$executionContextId` (to refer to the previous result).
#' @param hash A character string. 
#'        Content hash of the script. Accepted values: `~ .res$hash` (to refer to the previous result).
#' @param executionContextAuxData NA
#'        Embedder-specific auxiliary data. Accepted values: `~ .res$executionContextAuxData` (to refer to the previous result).
#' @param isLiveEdit Experimental. A logical. 
#'        True, if this script is generated as a result of the live edit operation. Accepted values: `~ .res$isLiveEdit` (to refer to the previous result).
#' @param sourceMapURL A character string. 
#'        URL of source map associated with script (if any). Accepted values: `~ .res$sourceMapURL` (to refer to the previous result).
#' @param hasSourceURL A logical. 
#'        True, if this script has sourceURL. Accepted values: `~ .res$hasSourceURL` (to refer to the previous result).
#' @param isModule A logical. 
#'        True, if this script is ES6 module. Accepted values: `~ .res$isModule` (to refer to the previous result).
#' @param length An integer. 
#'        This script length. Accepted values: `~ .res$length` (to refer to the previous result).
#' @param stackTrace Experimental. A Runtime.StackTrace. 
#'        JavaScript top stack frame of where the script parsed event was triggered if available. Accepted values: `~ .res$stackTrace` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"scriptParsed"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `scriptId`, `url`, `startLine`, `startColumn`, `endLine`, `endColumn`, `executionContextId`, `hash`, `executionContextAuxData` (optional) , `isLiveEdit` (optional) , `sourceMapURL` (optional) , `hasSourceURL` (optional) , `isModule` (optional) , `length` (optional) , `stackTrace` (optional) .
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
Debugger.scriptParsed <- function(promise, scriptId = NULL, url = NULL, startLine = NULL, startColumn = NULL, endLine = NULL, endColumn = NULL, executionContextId = NULL, hash = NULL, executionContextAuxData = NULL, isLiveEdit = NULL, sourceMapURL = NULL, hasSourceURL = NULL, isModule = NULL, length = NULL, stackTrace = NULL, .callback = NULL) {
  method <- 'Debugger.scriptParsed'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
