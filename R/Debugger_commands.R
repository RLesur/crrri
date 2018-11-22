# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Debugger.continueToLocation
#' 
#' Continues execution until specific location is reached.
#' 
#' @param promise An asynchronous result.
#' @param location A Location. 
#'        Location to continue to. 
#' @param targetCallFrames Optional. A character string. 
#'         Accepted values: any, current.
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
Debugger.continueToLocation <- function(promise, location, targetCallFrames = NULL, awaitResult = TRUE) {
  method <- 'Debugger.continueToLocation'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.disable
#' 
#' Disables debugger for given page.
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
Debugger.disable <- function(promise, awaitResult = TRUE) {
  method <- 'Debugger.disable'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.enable
#' 
#' Enables debugger for the given page. Clients should not assume that the debugging has been
#'        enabled until the result for this command is received.
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
Debugger.enable <- function(promise, awaitResult = TRUE) {
  method <- 'Debugger.enable'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.evaluateOnCallFrame
#' 
#' Evaluates expression on a given call frame.
#' 
#' @param promise An asynchronous result.
#' @param callFrameId A CallFrameId. 
#'        Call frame identifier to evaluate on. 
#' @param expression A character string. 
#'        Expression to evaluate. 
#' @param objectGroup Optional. A character string. 
#'        String object group name to put result into (allows rapid releasing resulting object handles
#'        using `releaseObjectGroup`). 
#' @param includeCommandLineAPI Optional. A logical. 
#'        Specifies whether command line API should be available to the evaluated expression, defaults
#'        to false. 
#' @param silent Optional. A logical. 
#'        In silent mode exceptions thrown during evaluation are not reported and do not pause
#'        execution. Overrides `setPauseOnException` state. 
#' @param returnByValue Optional. A logical. 
#'        Whether the result is expected to be a JSON object that should be sent by value. 
#' @param generatePreview Experimental. Optional. A logical. 
#'        Whether preview should be generated for the result. 
#' @param throwOnSideEffect Optional. A logical. 
#'        Whether to throw an exception if side effect cannot be ruled out during evaluation. 
#' @param timeout Experimental. Optional. A Runtime.TimeDelta. 
#'        Terminate execution after timing out (number of milliseconds). 
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
Debugger.evaluateOnCallFrame <- function(promise, callFrameId, expression, objectGroup = NULL, includeCommandLineAPI = NULL, silent = NULL, returnByValue = NULL, generatePreview = NULL, throwOnSideEffect = NULL, timeout = NULL, awaitResult = TRUE) {
  method <- 'Debugger.evaluateOnCallFrame'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.getPossibleBreakpoints
#' 
#' Returns possible locations for breakpoint. scriptId in start and end range locations should be
#'        the same.
#' 
#' @param promise An asynchronous result.
#' @param start A Location. 
#'        Start of range to search possible breakpoint locations in. 
#' @param end Optional. A Location. 
#'        End of range to search possible breakpoint locations in (excluding). When not specified, end
#'        of scripts is used as end of range. 
#' @param restrictToFunction Optional. A logical. 
#'        Only consider locations which are in the same (non-nested) function as start. 
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
Debugger.getPossibleBreakpoints <- function(promise, start, end = NULL, restrictToFunction = NULL, awaitResult = TRUE) {
  method <- 'Debugger.getPossibleBreakpoints'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.getScriptSource
#' 
#' Returns source for the script with given id.
#' 
#' @param promise An asynchronous result.
#' @param scriptId A Runtime.ScriptId. 
#'        Id of the script to get source for. 
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
Debugger.getScriptSource <- function(promise, scriptId, awaitResult = TRUE) {
  method <- 'Debugger.getScriptSource'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.getStackTrace
#' 
#' Returns stack trace with given `stackTraceId`.
#' 
#' @param promise An asynchronous result.
#' @param stackTraceId A Runtime.StackTraceId. 
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
Debugger.getStackTrace <- function(promise, stackTraceId, awaitResult = TRUE) {
  method <- 'Debugger.getStackTrace'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.pause
#' 
#' Stops on the next JavaScript statement.
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
Debugger.pause <- function(promise, awaitResult = TRUE) {
  method <- 'Debugger.pause'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.pauseOnAsyncCall
#' 
#' 
#' 
#' @param promise An asynchronous result.
#' @param parentStackTraceId A Runtime.StackTraceId. 
#'        Debugger will pause when async call with given stack trace is started. 
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
Debugger.pauseOnAsyncCall <- function(promise, parentStackTraceId, awaitResult = TRUE) {
  method <- 'Debugger.pauseOnAsyncCall'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.removeBreakpoint
#' 
#' Removes JavaScript breakpoint.
#' 
#' @param promise An asynchronous result.
#' @param breakpointId A BreakpointId. 
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
Debugger.removeBreakpoint <- function(promise, breakpointId, awaitResult = TRUE) {
  method <- 'Debugger.removeBreakpoint'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.restartFrame
#' 
#' Restarts particular call frame from the beginning.
#' 
#' @param promise An asynchronous result.
#' @param callFrameId A CallFrameId. 
#'        Call frame identifier to evaluate on. 
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a named list of length 3.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
Debugger.restartFrame <- function(promise, callFrameId, awaitResult = TRUE) {
  method <- 'Debugger.restartFrame'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.resume
#' 
#' Resumes JavaScript execution.
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
Debugger.resume <- function(promise, awaitResult = TRUE) {
  method <- 'Debugger.resume'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.scheduleStepIntoAsync
#' 
#' This method is deprecated - use Debugger.stepInto with breakOnAsyncCall and
#'        Debugger.pauseOnAsyncTask instead. Steps into next scheduled async task if any is scheduled
#'        before next pause. Returns success when async task is actually scheduled, returns error if no
#'        task were scheduled or another scheduleStepIntoAsync was called.
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
Debugger.scheduleStepIntoAsync <- function(promise, awaitResult = TRUE) {
  method <- 'Debugger.scheduleStepIntoAsync'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.searchInContent
#' 
#' Searches for given string in script content.
#' 
#' @param promise An asynchronous result.
#' @param scriptId A Runtime.ScriptId. 
#'        Id of the script to search in. 
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
Debugger.searchInContent <- function(promise, scriptId, query, caseSensitive = NULL, isRegex = NULL, awaitResult = TRUE) {
  method <- 'Debugger.searchInContent'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.setAsyncCallStackDepth
#' 
#' Enables or disables async call stacks tracking.
#' 
#' @param promise An asynchronous result.
#' @param maxDepth An integer. 
#'        Maximum depth of async call stacks. Setting to `0` will effectively disable collecting async
#'        call stacks (default). 
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
Debugger.setAsyncCallStackDepth <- function(promise, maxDepth, awaitResult = TRUE) {
  method <- 'Debugger.setAsyncCallStackDepth'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.setBlackboxPatterns
#' 
#' Replace previous blackbox patterns with passed ones. Forces backend to skip stepping/pausing in
#'        scripts with url matching one of the patterns. VM will try to leave blackboxed script by
#'        performing 'step in' several times, finally resorting to 'step out' if unsuccessful.
#' 
#' @param promise An asynchronous result.
#' @param patterns A list of string. 
#'        Array of regexps that will be used to check script url for blackbox state. 
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
Debugger.setBlackboxPatterns <- function(promise, patterns, awaitResult = TRUE) {
  method <- 'Debugger.setBlackboxPatterns'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.setBlackboxedRanges
#' 
#' Makes backend skip steps in the script in blackboxed ranges. VM will try leave blacklisted
#'        scripts by performing 'step in' several times, finally resorting to 'step out' if unsuccessful.
#'        Positions array contains positions where blackbox state is changed. First interval isn't
#'        blackboxed. Array should be sorted.
#' 
#' @param promise An asynchronous result.
#' @param scriptId A Runtime.ScriptId. 
#'        Id of the script. 
#' @param positions A list of ScriptPosition. 
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
Debugger.setBlackboxedRanges <- function(promise, scriptId, positions, awaitResult = TRUE) {
  method <- 'Debugger.setBlackboxedRanges'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.setBreakpoint
#' 
#' Sets JavaScript breakpoint at a given location.
#' 
#' @param promise An asynchronous result.
#' @param location A Location. 
#'        Location to set breakpoint in. 
#' @param condition Optional. A character string. 
#'        Expression to use as a breakpoint condition. When specified, debugger will only stop on the
#'        breakpoint if this expression evaluates to true. 
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
Debugger.setBreakpoint <- function(promise, location, condition = NULL, awaitResult = TRUE) {
  method <- 'Debugger.setBreakpoint'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.setBreakpointByUrl
#' 
#' Sets JavaScript breakpoint at given location specified either by URL or URL regex. Once this
#'        command is issued, all existing parsed scripts will have breakpoints resolved and returned in
#'        `locations` property. Further matching script parsing will result in subsequent
#'        `breakpointResolved` events issued. This logical breakpoint will survive page reloads.
#' 
#' @param promise An asynchronous result.
#' @param lineNumber An integer. 
#'        Line number to set breakpoint at. 
#' @param url Optional. A character string. 
#'        URL of the resources to set breakpoint on. 
#' @param urlRegex Optional. A character string. 
#'        Regex pattern for the URLs of the resources to set breakpoints on. Either `url` or
#'        `urlRegex` must be specified. 
#' @param scriptHash Optional. A character string. 
#'        Script hash of the resources to set breakpoint on. 
#' @param columnNumber Optional. An integer. 
#'        Offset in the line to set breakpoint at. 
#' @param condition Optional. A character string. 
#'        Expression to use as a breakpoint condition. When specified, debugger will only stop on the
#'        breakpoint if this expression evaluates to true. 
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
Debugger.setBreakpointByUrl <- function(promise, lineNumber, url = NULL, urlRegex = NULL, scriptHash = NULL, columnNumber = NULL, condition = NULL, awaitResult = TRUE) {
  method <- 'Debugger.setBreakpointByUrl'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.setBreakpointOnFunctionCall
#' 
#' Sets JavaScript breakpoint before each call to the given function.
#'        If another function was created from the same source as a given one,
#'        calling it will also trigger the breakpoint.
#' 
#' @param promise An asynchronous result.
#' @param objectId A Runtime.RemoteObjectId. 
#'        Function object id. 
#' @param condition Optional. A character string. 
#'        Expression to use as a breakpoint condition. When specified, debugger will
#'        stop on the breakpoint if this expression evaluates to true. 
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
Debugger.setBreakpointOnFunctionCall <- function(promise, objectId, condition = NULL, awaitResult = TRUE) {
  method <- 'Debugger.setBreakpointOnFunctionCall'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.setBreakpointsActive
#' 
#' Activates / deactivates all breakpoints on the page.
#' 
#' @param promise An asynchronous result.
#' @param active A logical. 
#'        New value for breakpoints active state. 
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
Debugger.setBreakpointsActive <- function(promise, active, awaitResult = TRUE) {
  method <- 'Debugger.setBreakpointsActive'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.setPauseOnExceptions
#' 
#' Defines pause on exceptions state. Can be set to stop on all exceptions, uncaught exceptions or
#'        no exceptions. Initial pause on exceptions state is `none`.
#' 
#' @param promise An asynchronous result.
#' @param state A character string. 
#'        Pause on exceptions mode. Accepted values: none, uncaught, all.
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
Debugger.setPauseOnExceptions <- function(promise, state, awaitResult = TRUE) {
  method <- 'Debugger.setPauseOnExceptions'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.setReturnValue
#' 
#' Changes return value in top frame. Available only at return break position.
#' 
#' @param promise An asynchronous result.
#' @param newValue A Runtime.CallArgument. 
#'        New return value. 
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
Debugger.setReturnValue <- function(promise, newValue, awaitResult = TRUE) {
  method <- 'Debugger.setReturnValue'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.setScriptSource
#' 
#' Edits JavaScript source live.
#' 
#' @param promise An asynchronous result.
#' @param scriptId A Runtime.ScriptId. 
#'        Id of the script to edit. 
#' @param scriptSource A character string. 
#'        New content of the script. 
#' @param dryRun Optional. A logical. 
#'        If true the change will not actually be applied. Dry run may be used to get result
#'        description without actually modifying the code. 
#' @param awaitResult Await for the command result?
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the value of `awaitResult`.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         When `awaitResult` is `TRUE`, the promise is fulfilled once the result of the command is received. In this case,
#'         `result` is a named list of length 5.
#'         When `awaitResult` is `FALSE`, the promise is fulfilled once the command is sent:
#'         `result` is equal to the previous result (`promise$result`).
#'         In both cases, you can chain this promise with another command or event listener.
#' @export
Debugger.setScriptSource <- function(promise, scriptId, scriptSource, dryRun = NULL, awaitResult = TRUE) {
  method <- 'Debugger.setScriptSource'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.setSkipAllPauses
#' 
#' Makes page not interrupt on any pauses (breakpoint, exception, dom exception etc).
#' 
#' @param promise An asynchronous result.
#' @param skip A logical. 
#'        New value for skip pauses state. 
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
Debugger.setSkipAllPauses <- function(promise, skip, awaitResult = TRUE) {
  method <- 'Debugger.setSkipAllPauses'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.setVariableValue
#' 
#' Changes value of variable in a callframe. Object-based scopes are not supported and must be
#'        mutated manually.
#' 
#' @param promise An asynchronous result.
#' @param scopeNumber An integer. 
#'        0-based number of scope as was listed in scope chain. Only 'local', 'closure' and 'catch'
#'        scope types are allowed. Other scopes could be manipulated manually. 
#' @param variableName A character string. 
#'        Variable name. 
#' @param newValue A Runtime.CallArgument. 
#'        New variable value. 
#' @param callFrameId A CallFrameId. 
#'        Id of callframe that holds variable. 
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
Debugger.setVariableValue <- function(promise, scopeNumber, variableName, newValue, callFrameId, awaitResult = TRUE) {
  method <- 'Debugger.setVariableValue'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.stepInto
#' 
#' Steps into the function call.
#' 
#' @param promise An asynchronous result.
#' @param breakOnAsyncCall Experimental. Optional. A logical. 
#'        Debugger will issue additional Debugger.paused notification if any async task is scheduled
#'        before next pause. 
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
Debugger.stepInto <- function(promise, breakOnAsyncCall = NULL, awaitResult = TRUE) {
  method <- 'Debugger.stepInto'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.stepOut
#' 
#' Steps out of the function call.
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
Debugger.stepOut <- function(promise, awaitResult = TRUE) {
  method <- 'Debugger.stepOut'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Debugger.stepOver
#' 
#' Steps over the statement.
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
Debugger.stepOver <- function(promise, awaitResult = TRUE) {
  method <- 'Debugger.stepOver'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}
