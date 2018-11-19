# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Runtime.awaitPromise
#' 
#' Add handler to promise with given promise object id.
#' 
#' @param promise An aynchronous result object.
#' @param promiseObjectId A RemoteObjectId. 
#'        Identifier of the promise. 
#' @param returnByValue Optional. A logical. 
#'        Whether the result is expected to be a JSON object that should be sent by value. 
#' @param generatePreview Optional. A logical. 
#'        Whether preview should be generated for the result. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
Runtime.awaitPromise <- function(promise, promiseObjectId, returnByValue = NULL, generatePreview = NULL) {
  method <- 'Runtime.awaitPromise'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.callFunctionOn
#' 
#' Calls function with given declaration on the given object. Object group of the result is
#'        inherited from the target object.
#' 
#' @param promise An aynchronous result object.
#' @param functionDeclaration A character string. 
#'        Declaration of the function to call. 
#' @param objectId Optional. A RemoteObjectId. 
#'        Identifier of the object to call function on. Either objectId or executionContextId should
#'        be specified. 
#' @param arguments Optional. A list of CallArgument. 
#'        Call arguments. All call arguments must belong to the same JavaScript world as the target
#'        object. 
#' @param silent Optional. A logical. 
#'        In silent mode exceptions thrown during evaluation are not reported and do not pause
#'        execution. Overrides `setPauseOnException` state. 
#' @param returnByValue Optional. A logical. 
#'        Whether the result is expected to be a JSON object which should be sent by value. 
#' @param generatePreview Experimental. Optional. A logical. 
#'        Whether preview should be generated for the result. 
#' @param userGesture Optional. A logical. 
#'        Whether execution should be treated as initiated by user in the UI. 
#' @param awaitPromise Optional. A logical. 
#'        Whether execution should `await` for resulting value and return once awaited promise is
#'        resolved. 
#' @param executionContextId Optional. A ExecutionContextId. 
#'        Specifies execution context which global object will be used to call function on. Either
#'        executionContextId or objectId should be specified. 
#' @param objectGroup Optional. A character string. 
#'        Symbolic group name that can be used to release multiple objects. If objectGroup is not
#'        specified and objectId is, objectGroup will be inherited from object. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
Runtime.callFunctionOn <- function(promise, functionDeclaration, objectId = NULL, arguments = NULL, silent = NULL, returnByValue = NULL, generatePreview = NULL, userGesture = NULL, awaitPromise = NULL, executionContextId = NULL, objectGroup = NULL) {
  method <- 'Runtime.callFunctionOn'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.compileScript
#' 
#' Compiles expression.
#' 
#' @param promise An aynchronous result object.
#' @param expression A character string. 
#'        Expression to compile. 
#' @param sourceURL A character string. 
#'        Source url to be set for the script. 
#' @param persistScript A logical. 
#'        Specifies whether the compiled script should be persisted. 
#' @param executionContextId Optional. A ExecutionContextId. 
#'        Specifies in which execution context to perform script run. If the parameter is omitted the
#'        evaluation will be performed in the context of the inspected page. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
Runtime.compileScript <- function(promise, expression, sourceURL, persistScript, executionContextId = NULL) {
  method <- 'Runtime.compileScript'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.disable
#' 
#' Disables reporting of execution contexts creation.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Runtime.disable <- function(promise) {
  method <- 'Runtime.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.discardConsoleEntries
#' 
#' Discards collected exceptions and console API calls.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Runtime.discardConsoleEntries <- function(promise) {
  method <- 'Runtime.discardConsoleEntries'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.enable
#' 
#' Enables reporting of execution contexts creation by means of `executionContextCreated` event.
#'        When the reporting gets enabled the event will be sent immediately for each existing execution
#'        context.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Runtime.enable <- function(promise) {
  method <- 'Runtime.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.evaluate
#' 
#' Evaluates expression on global object.
#' 
#' @param promise An aynchronous result object.
#' @param expression A character string. 
#'        Expression to evaluate. 
#' @param objectGroup Optional. A character string. 
#'        Symbolic group name that can be used to release multiple objects. 
#' @param includeCommandLineAPI Optional. A logical. 
#'        Determines whether Command Line API should be available during the evaluation. 
#' @param silent Optional. A logical. 
#'        In silent mode exceptions thrown during evaluation are not reported and do not pause
#'        execution. Overrides `setPauseOnException` state. 
#' @param contextId Optional. A ExecutionContextId. 
#'        Specifies in which execution context to perform evaluation. If the parameter is omitted the
#'        evaluation will be performed in the context of the inspected page. 
#' @param returnByValue Optional. A logical. 
#'        Whether the result is expected to be a JSON object that should be sent by value. 
#' @param generatePreview Experimental. Optional. A logical. 
#'        Whether preview should be generated for the result. 
#' @param userGesture Optional. A logical. 
#'        Whether execution should be treated as initiated by user in the UI. 
#' @param awaitPromise Optional. A logical. 
#'        Whether execution should `await` for resulting value and return once awaited promise is
#'        resolved. 
#' @param throwOnSideEffect Experimental. Optional. A logical. 
#'        Whether to throw an exception if side effect cannot be ruled out during evaluation. 
#' @param timeout Experimental. Optional. A TimeDelta. 
#'        Terminate execution after timing out (number of milliseconds). 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
Runtime.evaluate <- function(promise, expression, objectGroup = NULL, includeCommandLineAPI = NULL, silent = NULL, contextId = NULL, returnByValue = NULL, generatePreview = NULL, userGesture = NULL, awaitPromise = NULL, throwOnSideEffect = NULL, timeout = NULL) {
  method <- 'Runtime.evaluate'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.getIsolateId
#' 
#' Returns the isolate id.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Runtime.getIsolateId <- function(promise) {
  method <- 'Runtime.getIsolateId'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.getHeapUsage
#' 
#' Returns the JavaScript heap usage.
#'        It is the total usage of the corresponding isolate not scoped to a particular Runtime.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
Runtime.getHeapUsage <- function(promise) {
  method <- 'Runtime.getHeapUsage'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.getProperties
#' 
#' Returns properties of a given object. Object group of the result is inherited from the target
#'        object.
#' 
#' @param promise An aynchronous result object.
#' @param objectId A RemoteObjectId. 
#'        Identifier of the object to return properties for. 
#' @param ownProperties Optional. A logical. 
#'        If true, returns properties belonging only to the element itself, not to its prototype
#'        chain. 
#' @param accessorPropertiesOnly Experimental. Optional. A logical. 
#'        If true, returns accessor properties (with getter/setter) only; internal properties are not
#'        returned either. 
#' @param generatePreview Experimental. Optional. A logical. 
#'        Whether preview should be generated for the results. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 3.
#' @export
Runtime.getProperties <- function(promise, objectId, ownProperties = NULL, accessorPropertiesOnly = NULL, generatePreview = NULL) {
  method <- 'Runtime.getProperties'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.globalLexicalScopeNames
#' 
#' Returns all let, const and class variables from global scope.
#' 
#' @param promise An aynchronous result object.
#' @param executionContextId Optional. A ExecutionContextId. 
#'        Specifies in which execution context to lookup global scope variables. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Runtime.globalLexicalScopeNames <- function(promise, executionContextId = NULL) {
  method <- 'Runtime.globalLexicalScopeNames'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.queryObjects
#' 
#' 
#' 
#' @param promise An aynchronous result object.
#' @param prototypeObjectId A RemoteObjectId. 
#'        Identifier of the prototype to return objects for. 
#' @param objectGroup Optional. A character string. 
#'        Symbolic group name that can be used to release the results. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Runtime.queryObjects <- function(promise, prototypeObjectId, objectGroup = NULL) {
  method <- 'Runtime.queryObjects'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.releaseObject
#' 
#' Releases remote object with given id.
#' 
#' @param promise An aynchronous result object.
#' @param objectId A RemoteObjectId. 
#'        Identifier of the object to release. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Runtime.releaseObject <- function(promise, objectId) {
  method <- 'Runtime.releaseObject'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.releaseObjectGroup
#' 
#' Releases all remote objects that belong to a given group.
#' 
#' @param promise An aynchronous result object.
#' @param objectGroup A character string. 
#'        Symbolic object group name. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Runtime.releaseObjectGroup <- function(promise, objectGroup) {
  method <- 'Runtime.releaseObjectGroup'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.runIfWaitingForDebugger
#' 
#' Tells inspected instance to run if it was waiting for debugger to attach.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Runtime.runIfWaitingForDebugger <- function(promise) {
  method <- 'Runtime.runIfWaitingForDebugger'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.runScript
#' 
#' Runs script with given id in a given context.
#' 
#' @param promise An aynchronous result object.
#' @param scriptId A ScriptId. 
#'        Id of the script to run. 
#' @param executionContextId Optional. A ExecutionContextId. 
#'        Specifies in which execution context to perform script run. If the parameter is omitted the
#'        evaluation will be performed in the context of the inspected page. 
#' @param objectGroup Optional. A character string. 
#'        Symbolic group name that can be used to release multiple objects. 
#' @param silent Optional. A logical. 
#'        In silent mode exceptions thrown during evaluation are not reported and do not pause
#'        execution. Overrides `setPauseOnException` state. 
#' @param includeCommandLineAPI Optional. A logical. 
#'        Determines whether Command Line API should be available during the evaluation. 
#' @param returnByValue Optional. A logical. 
#'        Whether the result is expected to be a JSON object which should be sent by value. 
#' @param generatePreview Optional. A logical. 
#'        Whether preview should be generated for the result. 
#' @param awaitPromise Optional. A logical. 
#'        Whether execution should `await` for resulting value and return once awaited promise is
#'        resolved. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
Runtime.runScript <- function(promise, scriptId, executionContextId = NULL, objectGroup = NULL, silent = NULL, includeCommandLineAPI = NULL, returnByValue = NULL, generatePreview = NULL, awaitPromise = NULL) {
  method <- 'Runtime.runScript'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.setAsyncCallStackDepth
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
Runtime.setAsyncCallStackDepth <- function(promise, maxDepth) {
  method <- 'Runtime.setAsyncCallStackDepth'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.setCustomObjectFormatterEnabled
#' 
#' 
#' 
#' @param promise An aynchronous result object.
#' @param enabled A logical. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Runtime.setCustomObjectFormatterEnabled <- function(promise, enabled) {
  method <- 'Runtime.setCustomObjectFormatterEnabled'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.setMaxCallStackSizeToCapture
#' 
#' 
#' 
#' @param promise An aynchronous result object.
#' @param size An integer. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Runtime.setMaxCallStackSizeToCapture <- function(promise, size) {
  method <- 'Runtime.setMaxCallStackSizeToCapture'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.terminateExecution
#' 
#' Terminate current or next JavaScript execution.
#'        Will cancel the termination when the outer-most script execution ends.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Runtime.terminateExecution <- function(promise) {
  method <- 'Runtime.terminateExecution'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.addBinding
#' 
#' If executionContextId is empty, adds binding with the given name on the
#'        global objects of all inspected contexts, including those created later,
#'        bindings survive reloads.
#'        If executionContextId is specified, adds binding only on global object of
#'        given execution context.
#'        Binding function takes exactly one argument, this argument should be string,
#'        in case of any other input, function throws an exception.
#'        Each binding function call produces Runtime.bindingCalled notification.
#' 
#' @param promise An aynchronous result object.
#' @param name A character string. 
#' @param executionContextId Optional. A ExecutionContextId. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Runtime.addBinding <- function(promise, name, executionContextId = NULL) {
  method <- 'Runtime.addBinding'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Runtime.removeBinding
#' 
#' This method does not remove binding function from global object but
#'        unsubscribes current runtime agent from Runtime.bindingCalled notifications.
#' 
#' @param promise An aynchronous result object.
#' @param name A character string. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Runtime.removeBinding <- function(promise, name) {
  method <- 'Runtime.removeBinding'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
