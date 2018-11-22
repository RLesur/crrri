# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Runtime.awaitPromise
#' 
#' Add handler to promise with given promise object id.
#' 
#' @param promise An asynchronous result.
#' @param promiseObjectId A RemoteObjectId. 
#'        Identifier of the promise. 
#' @param returnByValue Optional. A logical. 
#'        Whether the result is expected to be a JSON object that should be sent by value. 
#' @param generatePreview Optional. A logical. 
#'        Whether preview should be generated for the result. 
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
Runtime.awaitPromise <- function(promise, promiseObjectId, returnByValue = NULL, generatePreview = NULL, awaitResult = TRUE) {
  method <- 'Runtime.awaitPromise'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.callFunctionOn
#' 
#' Calls function with given declaration on the given object. Object group of the result is
#'        inherited from the target object.
#' 
#' @param promise An asynchronous result.
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
Runtime.callFunctionOn <- function(promise, functionDeclaration, objectId = NULL, arguments = NULL, silent = NULL, returnByValue = NULL, generatePreview = NULL, userGesture = NULL, awaitPromise = NULL, executionContextId = NULL, objectGroup = NULL, awaitResult = TRUE) {
  method <- 'Runtime.callFunctionOn'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.compileScript
#' 
#' Compiles expression.
#' 
#' @param promise An asynchronous result.
#' @param expression A character string. 
#'        Expression to compile. 
#' @param sourceURL A character string. 
#'        Source url to be set for the script. 
#' @param persistScript A logical. 
#'        Specifies whether the compiled script should be persisted. 
#' @param executionContextId Optional. A ExecutionContextId. 
#'        Specifies in which execution context to perform script run. If the parameter is omitted the
#'        evaluation will be performed in the context of the inspected page. 
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
Runtime.compileScript <- function(promise, expression, sourceURL, persistScript, executionContextId = NULL, awaitResult = TRUE) {
  method <- 'Runtime.compileScript'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.disable
#' 
#' Disables reporting of execution contexts creation.
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
Runtime.disable <- function(promise, awaitResult = TRUE) {
  method <- 'Runtime.disable'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.discardConsoleEntries
#' 
#' Discards collected exceptions and console API calls.
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
Runtime.discardConsoleEntries <- function(promise, awaitResult = TRUE) {
  method <- 'Runtime.discardConsoleEntries'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.enable
#' 
#' Enables reporting of execution contexts creation by means of `executionContextCreated` event.
#'        When the reporting gets enabled the event will be sent immediately for each existing execution
#'        context.
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
Runtime.enable <- function(promise, awaitResult = TRUE) {
  method <- 'Runtime.enable'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.evaluate
#' 
#' Evaluates expression on global object.
#' 
#' @param promise An asynchronous result.
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
Runtime.evaluate <- function(promise, expression, objectGroup = NULL, includeCommandLineAPI = NULL, silent = NULL, contextId = NULL, returnByValue = NULL, generatePreview = NULL, userGesture = NULL, awaitPromise = NULL, throwOnSideEffect = NULL, timeout = NULL, awaitResult = TRUE) {
  method <- 'Runtime.evaluate'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.getIsolateId
#' 
#' Returns the isolate id.
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
Runtime.getIsolateId <- function(promise, awaitResult = TRUE) {
  method <- 'Runtime.getIsolateId'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.getHeapUsage
#' 
#' Returns the JavaScript heap usage.
#'        It is the total usage of the corresponding isolate not scoped to a particular Runtime.
#' 
#' @param promise An asynchronous result.
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
Runtime.getHeapUsage <- function(promise, awaitResult = TRUE) {
  method <- 'Runtime.getHeapUsage'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.getProperties
#' 
#' Returns properties of a given object. Object group of the result is inherited from the target
#'        object.
#' 
#' @param promise An asynchronous result.
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
Runtime.getProperties <- function(promise, objectId, ownProperties = NULL, accessorPropertiesOnly = NULL, generatePreview = NULL, awaitResult = TRUE) {
  method <- 'Runtime.getProperties'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.globalLexicalScopeNames
#' 
#' Returns all let, const and class variables from global scope.
#' 
#' @param promise An asynchronous result.
#' @param executionContextId Optional. A ExecutionContextId. 
#'        Specifies in which execution context to lookup global scope variables. 
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
Runtime.globalLexicalScopeNames <- function(promise, executionContextId = NULL, awaitResult = TRUE) {
  method <- 'Runtime.globalLexicalScopeNames'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.queryObjects
#' 
#' 
#' 
#' @param promise An asynchronous result.
#' @param prototypeObjectId A RemoteObjectId. 
#'        Identifier of the prototype to return objects for. 
#' @param objectGroup Optional. A character string. 
#'        Symbolic group name that can be used to release the results. 
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
Runtime.queryObjects <- function(promise, prototypeObjectId, objectGroup = NULL, awaitResult = TRUE) {
  method <- 'Runtime.queryObjects'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.releaseObject
#' 
#' Releases remote object with given id.
#' 
#' @param promise An asynchronous result.
#' @param objectId A RemoteObjectId. 
#'        Identifier of the object to release. 
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
Runtime.releaseObject <- function(promise, objectId, awaitResult = TRUE) {
  method <- 'Runtime.releaseObject'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.releaseObjectGroup
#' 
#' Releases all remote objects that belong to a given group.
#' 
#' @param promise An asynchronous result.
#' @param objectGroup A character string. 
#'        Symbolic object group name. 
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
Runtime.releaseObjectGroup <- function(promise, objectGroup, awaitResult = TRUE) {
  method <- 'Runtime.releaseObjectGroup'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.runIfWaitingForDebugger
#' 
#' Tells inspected instance to run if it was waiting for debugger to attach.
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
Runtime.runIfWaitingForDebugger <- function(promise, awaitResult = TRUE) {
  method <- 'Runtime.runIfWaitingForDebugger'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.runScript
#' 
#' Runs script with given id in a given context.
#' 
#' @param promise An asynchronous result.
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
Runtime.runScript <- function(promise, scriptId, executionContextId = NULL, objectGroup = NULL, silent = NULL, includeCommandLineAPI = NULL, returnByValue = NULL, generatePreview = NULL, awaitPromise = NULL, awaitResult = TRUE) {
  method <- 'Runtime.runScript'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.setAsyncCallStackDepth
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
Runtime.setAsyncCallStackDepth <- function(promise, maxDepth, awaitResult = TRUE) {
  method <- 'Runtime.setAsyncCallStackDepth'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.setCustomObjectFormatterEnabled
#' 
#' 
#' 
#' @param promise An asynchronous result.
#' @param enabled A logical. 
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
Runtime.setCustomObjectFormatterEnabled <- function(promise, enabled, awaitResult = TRUE) {
  method <- 'Runtime.setCustomObjectFormatterEnabled'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.setMaxCallStackSizeToCapture
#' 
#' 
#' 
#' @param promise An asynchronous result.
#' @param size An integer. 
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
Runtime.setMaxCallStackSizeToCapture <- function(promise, size, awaitResult = TRUE) {
  method <- 'Runtime.setMaxCallStackSizeToCapture'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.terminateExecution
#' 
#' Terminate current or next JavaScript execution.
#'        Will cancel the termination when the outer-most script execution ends.
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
Runtime.terminateExecution <- function(promise, awaitResult = TRUE) {
  method <- 'Runtime.terminateExecution'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
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
#' @param promise An asynchronous result.
#' @param name A character string. 
#' @param executionContextId Optional. A ExecutionContextId. 
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
Runtime.addBinding <- function(promise, name, executionContextId = NULL, awaitResult = TRUE) {
  method <- 'Runtime.addBinding'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Runtime.removeBinding
#' 
#' This method does not remove binding function from global object but
#'        unsubscribes current runtime agent from Runtime.bindingCalled notifications.
#' 
#' @param promise An asynchronous result.
#' @param name A character string. 
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
Runtime.removeBinding <- function(promise, name, awaitResult = TRUE) {
  method <- 'Runtime.removeBinding'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}
