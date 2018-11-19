# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Debugger.continueToLocation
#'  
#' Continues execution until specific location is reached.
#'  
#' @param promise An aynchronous result object.
#' @param location A Location. 
#'        Location to continue to. 
#' @param targetCallFrames Optional. A character string. 
#'         Accepted values: any, current.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.continueToLocation <- function(promise, location, targetCallFrames = NULL) {
  method <- 'Debugger.continueToLocation'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.disable
#'  
#' Disables debugger for given page.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.disable <- function(promise) {
  method <- 'Debugger.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.enable
#'  
#' Enables debugger for the given page. Clients should not assume that the debugging has been
#'        enabled until the result for this command is received.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Debugger.enable <- function(promise) {
  method <- 'Debugger.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.evaluateOnCallFrame
#'  
#' Evaluates expression on a given call frame.
#'  
#' @param promise An aynchronous result object.
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
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
Debugger.evaluateOnCallFrame <- function(promise, callFrameId, expression, objectGroup = NULL, includeCommandLineAPI = NULL, silent = NULL, returnByValue = NULL, generatePreview = NULL, throwOnSideEffect = NULL, timeout = NULL) {
  method <- 'Debugger.evaluateOnCallFrame'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.getPossibleBreakpoints
#'  
#' Returns possible locations for breakpoint. scriptId in start and end range locations should be
#'        the same.
#'  
#' @param promise An aynchronous result object.
#' @param start A Location. 
#'        Start of range to search possible breakpoint locations in. 
#' @param end Optional. A Location. 
#'        End of range to search possible breakpoint locations in (excluding). When not specified, end
#'        of scripts is used as end of range. 
#' @param restrictToFunction Optional. A logical. 
#'        Only consider locations which are in the same (non-nested) function as start. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Debugger.getPossibleBreakpoints <- function(promise, start, end = NULL, restrictToFunction = NULL) {
  method <- 'Debugger.getPossibleBreakpoints'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.getScriptSource
#'  
#' Returns source for the script with given id.
#'  
#' @param promise An aynchronous result object.
#' @param scriptId A Runtime.ScriptId. 
#'        Id of the script to get source for. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Debugger.getScriptSource <- function(promise, scriptId) {
  method <- 'Debugger.getScriptSource'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.getStackTrace
#'  
#' Returns stack trace with given `stackTraceId`.
#'  
#' @param promise An aynchronous result object.
#' @param stackTraceId A Runtime.StackTraceId. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Debugger.getStackTrace <- function(promise, stackTraceId) {
  method <- 'Debugger.getStackTrace'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.pause
#'  
#' Stops on the next JavaScript statement.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.pause <- function(promise) {
  method <- 'Debugger.pause'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.pauseOnAsyncCall
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param parentStackTraceId A Runtime.StackTraceId. 
#'        Debugger will pause when async call with given stack trace is started. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.pauseOnAsyncCall <- function(promise, parentStackTraceId) {
  method <- 'Debugger.pauseOnAsyncCall'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.removeBreakpoint
#'  
#' Removes JavaScript breakpoint.
#'  
#' @param promise An aynchronous result object.
#' @param breakpointId A BreakpointId. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.removeBreakpoint <- function(promise, breakpointId) {
  method <- 'Debugger.removeBreakpoint'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.restartFrame
#'  
#' Restarts particular call frame from the beginning.
#'  
#' @param promise An aynchronous result object.
#' @param callFrameId A CallFrameId. 
#'        Call frame identifier to evaluate on. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 3.
#' @export
Debugger.restartFrame <- function(promise, callFrameId) {
  method <- 'Debugger.restartFrame'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.resume
#'  
#' Resumes JavaScript execution.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.resume <- function(promise) {
  method <- 'Debugger.resume'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.scheduleStepIntoAsync
#'  
#' This method is deprecated - use Debugger.stepInto with breakOnAsyncCall and
#'        Debugger.pauseOnAsyncTask instead. Steps into next scheduled async task if any is scheduled
#'        before next pause. Returns success when async task is actually scheduled, returns error if no
#'        task were scheduled or another scheduleStepIntoAsync was called.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.scheduleStepIntoAsync <- function(promise) {
  method <- 'Debugger.scheduleStepIntoAsync'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.searchInContent
#'  
#' Searches for given string in script content.
#'  
#' @param promise An aynchronous result object.
#' @param scriptId A Runtime.ScriptId. 
#'        Id of the script to search in. 
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
Debugger.searchInContent <- function(promise, scriptId, query, caseSensitive = NULL, isRegex = NULL) {
  method <- 'Debugger.searchInContent'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.setAsyncCallStackDepth
#'  
#' Enables or disables async call stacks tracking.
#'  
#' @param promise An aynchronous result object.
#' @param maxDepth An integer. 
#'        Maximum depth of async call stacks. Setting to `0` will effectively disable collecting async
#'        call stacks (default). 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.setAsyncCallStackDepth <- function(promise, maxDepth) {
  method <- 'Debugger.setAsyncCallStackDepth'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.setBlackboxPatterns
#'  
#' Replace previous blackbox patterns with passed ones. Forces backend to skip stepping/pausing in
#'        scripts with url matching one of the patterns. VM will try to leave blackboxed script by
#'        performing 'step in' several times, finally resorting to 'step out' if unsuccessful.
#'  
#' @param promise An aynchronous result object.
#' @param patterns A list of string. 
#'        Array of regexps that will be used to check script url for blackbox state. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.setBlackboxPatterns <- function(promise, patterns) {
  method <- 'Debugger.setBlackboxPatterns'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.setBlackboxedRanges
#'  
#' Makes backend skip steps in the script in blackboxed ranges. VM will try leave blacklisted
#'        scripts by performing 'step in' several times, finally resorting to 'step out' if unsuccessful.
#'        Positions array contains positions where blackbox state is changed. First interval isn't
#'        blackboxed. Array should be sorted.
#'  
#' @param promise An aynchronous result object.
#' @param scriptId A Runtime.ScriptId. 
#'        Id of the script. 
#' @param positions A list of ScriptPosition. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.setBlackboxedRanges <- function(promise, scriptId, positions) {
  method <- 'Debugger.setBlackboxedRanges'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.setBreakpoint
#'  
#' Sets JavaScript breakpoint at a given location.
#'  
#' @param promise An aynchronous result object.
#' @param location A Location. 
#'        Location to set breakpoint in. 
#' @param condition Optional. A character string. 
#'        Expression to use as a breakpoint condition. When specified, debugger will only stop on the
#'        breakpoint if this expression evaluates to true. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
Debugger.setBreakpoint <- function(promise, location, condition = NULL) {
  method <- 'Debugger.setBreakpoint'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.setBreakpointByUrl
#'  
#' Sets JavaScript breakpoint at given location specified either by URL or URL regex. Once this
#'        command is issued, all existing parsed scripts will have breakpoints resolved and returned in
#'        `locations` property. Further matching script parsing will result in subsequent
#'        `breakpointResolved` events issued. This logical breakpoint will survive page reloads.
#'  
#' @param promise An aynchronous result object.
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
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
Debugger.setBreakpointByUrl <- function(promise, lineNumber, url = NULL, urlRegex = NULL, scriptHash = NULL, columnNumber = NULL, condition = NULL) {
  method <- 'Debugger.setBreakpointByUrl'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.setBreakpointOnFunctionCall
#'  
#' Sets JavaScript breakpoint before each call to the given function.
#'        If another function was created from the same source as a given one,
#'        calling it will also trigger the breakpoint.
#'  
#' @param promise An aynchronous result object.
#' @param objectId A Runtime.RemoteObjectId. 
#'        Function object id. 
#' @param condition Optional. A character string. 
#'        Expression to use as a breakpoint condition. When specified, debugger will
#'        stop on the breakpoint if this expression evaluates to true. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Debugger.setBreakpointOnFunctionCall <- function(promise, objectId, condition = NULL) {
  method <- 'Debugger.setBreakpointOnFunctionCall'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.setBreakpointsActive
#'  
#' Activates / deactivates all breakpoints on the page.
#'  
#' @param promise An aynchronous result object.
#' @param active A logical. 
#'        New value for breakpoints active state. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.setBreakpointsActive <- function(promise, active) {
  method <- 'Debugger.setBreakpointsActive'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.setPauseOnExceptions
#'  
#' Defines pause on exceptions state. Can be set to stop on all exceptions, uncaught exceptions or
#'        no exceptions. Initial pause on exceptions state is `none`.
#'  
#' @param promise An aynchronous result object.
#' @param state A character string. 
#'        Pause on exceptions mode. Accepted values: none, uncaught, all.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.setPauseOnExceptions <- function(promise, state) {
  method <- 'Debugger.setPauseOnExceptions'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.setReturnValue
#'  
#' Changes return value in top frame. Available only at return break position.
#'  
#' @param promise An aynchronous result object.
#' @param newValue A Runtime.CallArgument. 
#'        New return value. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.setReturnValue <- function(promise, newValue) {
  method <- 'Debugger.setReturnValue'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.setScriptSource
#'  
#' Edits JavaScript source live.
#'  
#' @param promise An aynchronous result object.
#' @param scriptId A Runtime.ScriptId. 
#'        Id of the script to edit. 
#' @param scriptSource A character string. 
#'        New content of the script. 
#' @param dryRun Optional. A logical. 
#'        If true the change will not actually be applied. Dry run may be used to get result
#'        description without actually modifying the code. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 5.
#' @export
Debugger.setScriptSource <- function(promise, scriptId, scriptSource, dryRun = NULL) {
  method <- 'Debugger.setScriptSource'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.setSkipAllPauses
#'  
#' Makes page not interrupt on any pauses (breakpoint, exception, dom exception etc).
#'  
#' @param promise An aynchronous result object.
#' @param skip A logical. 
#'        New value for skip pauses state. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.setSkipAllPauses <- function(promise, skip) {
  method <- 'Debugger.setSkipAllPauses'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.setVariableValue
#'  
#' Changes value of variable in a callframe. Object-based scopes are not supported and must be
#'        mutated manually.
#'  
#' @param promise An aynchronous result object.
#' @param scopeNumber An integer. 
#'        0-based number of scope as was listed in scope chain. Only 'local', 'closure' and 'catch'
#'        scope types are allowed. Other scopes could be manipulated manually. 
#' @param variableName A character string. 
#'        Variable name. 
#' @param newValue A Runtime.CallArgument. 
#'        New variable value. 
#' @param callFrameId A CallFrameId. 
#'        Id of callframe that holds variable. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.setVariableValue <- function(promise, scopeNumber, variableName, newValue, callFrameId) {
  method <- 'Debugger.setVariableValue'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.stepInto
#'  
#' Steps into the function call.
#'  
#' @param promise An aynchronous result object.
#' @param breakOnAsyncCall Experimental. Optional. A logical. 
#'        Debugger will issue additional Debugger.paused notification if any async task is scheduled
#'        before next pause. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.stepInto <- function(promise, breakOnAsyncCall = NULL) {
  method <- 'Debugger.stepInto'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.stepOut
#'  
#' Steps out of the function call.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.stepOut <- function(promise) {
  method <- 'Debugger.stepOut'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Debugger.stepOver
#'  
#' Steps over the statement.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Debugger.stepOver <- function(promise) {
  method <- 'Debugger.stepOver'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
