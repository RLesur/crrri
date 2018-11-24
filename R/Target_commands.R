# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Target.activateTarget
#' 
#' Activates (focuses) the target.
#' 
#' @param promise An asynchronous result.
#' @param targetId A TargetID. 
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
Target.activateTarget <- function(promise, targetId, awaitResult = TRUE) {
  method <- 'Target.activateTarget'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Target.attachToTarget
#' 
#' Attaches to the target with given id.
#' 
#' @param promise An asynchronous result.
#' @param targetId A TargetID. 
#' @param flatten Experimental. Optional. A logical. 
#'        Enables "flat" access to the session via specifying sessionId attribute in the commands. 
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
Target.attachToTarget <- function(promise, targetId, flatten = NULL, awaitResult = TRUE) {
  method <- 'Target.attachToTarget'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Target.attachToBrowserTarget
#' 
#' Attaches to the browser target, only uses flat sessionId mode.
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
Target.attachToBrowserTarget <- function(promise, awaitResult = TRUE) {
  method <- 'Target.attachToBrowserTarget'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Target.closeTarget
#' 
#' Closes the target. If the target is a page that gets closed too.
#' 
#' @param promise An asynchronous result.
#' @param targetId A TargetID. 
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
Target.closeTarget <- function(promise, targetId, awaitResult = TRUE) {
  method <- 'Target.closeTarget'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Target.exposeDevToolsProtocol
#' 
#' Inject object to the target's main frame that provides a communication
#'        channel with browser target.
#'        
#'        Injected object will be available as `window[bindingName]`.
#'        
#'        The object has the follwing API:
#'        - `binding.send(json)` - a method to send messages over the remote debugging protocol
#'        - `binding.onmessage = json => handleMessage(json)` - a callback that will be called for the protocol notifications and command responses.
#' 
#' @param promise An asynchronous result.
#' @param targetId A TargetID. 
#' @param bindingName Optional. A character string. 
#'        Binding name, 'cdp' if not specified. 
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
Target.exposeDevToolsProtocol <- function(promise, targetId, bindingName = NULL, awaitResult = TRUE) {
  method <- 'Target.exposeDevToolsProtocol'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Target.createBrowserContext
#' 
#' Creates a new empty BrowserContext. Similar to an incognito profile but you can have more than
#'        one.
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
Target.createBrowserContext <- function(promise, awaitResult = TRUE) {
  method <- 'Target.createBrowserContext'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Target.getBrowserContexts
#' 
#' Returns all browser contexts created with `Target.createBrowserContext` method.
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
Target.getBrowserContexts <- function(promise, awaitResult = TRUE) {
  method <- 'Target.getBrowserContexts'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Target.createTarget
#' 
#' Creates a new page.
#' 
#' @param promise An asynchronous result.
#' @param url A character string. 
#'        The initial URL the page will be navigated to. 
#' @param width Optional. An integer. 
#'        Frame width in DIP (headless chrome only). 
#' @param height Optional. An integer. 
#'        Frame height in DIP (headless chrome only). 
#' @param browserContextId Optional. A BrowserContextID. 
#'        The browser context to create the page in. 
#' @param enableBeginFrameControl Experimental. Optional. A logical. 
#'        Whether BeginFrames for this target will be controlled via DevTools (headless chrome only,
#'        not supported on MacOS yet, false by default). 
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
Target.createTarget <- function(promise, url, width = NULL, height = NULL, browserContextId = NULL, enableBeginFrameControl = NULL, awaitResult = TRUE) {
  method <- 'Target.createTarget'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Target.detachFromTarget
#' 
#' Detaches session with given id.
#' 
#' @param promise An asynchronous result.
#' @param sessionId Optional. A SessionID. 
#'        Session to detach. 
#' @param targetId Deprecated. Optional. A TargetID. 
#'        Deprecated. 
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
Target.detachFromTarget <- function(promise, sessionId = NULL, targetId = NULL, awaitResult = TRUE) {
  method <- 'Target.detachFromTarget'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Target.disposeBrowserContext
#' 
#' Deletes a BrowserContext. All the belonging pages will be closed without calling their
#'        beforeunload hooks.
#' 
#' @param promise An asynchronous result.
#' @param browserContextId A BrowserContextID. 
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
Target.disposeBrowserContext <- function(promise, browserContextId, awaitResult = TRUE) {
  method <- 'Target.disposeBrowserContext'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Target.getTargetInfo
#' 
#' Returns information about a target.
#' 
#' @param promise An asynchronous result.
#' @param targetId Optional. A TargetID. 
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
Target.getTargetInfo <- function(promise, targetId = NULL, awaitResult = TRUE) {
  method <- 'Target.getTargetInfo'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Target.getTargets
#' 
#' Retrieves a list of available targets.
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
Target.getTargets <- function(promise, awaitResult = TRUE) {
  method <- 'Target.getTargets'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Target.sendMessageToTarget
#' 
#' Sends protocol message over session with given id.
#' 
#' @param promise An asynchronous result.
#' @param message A character string. 
#' @param sessionId Optional. A SessionID. 
#'        Identifier of the session. 
#' @param targetId Deprecated. Optional. A TargetID. 
#'        Deprecated. 
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
Target.sendMessageToTarget <- function(promise, message, sessionId = NULL, targetId = NULL, awaitResult = TRUE) {
  method <- 'Target.sendMessageToTarget'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Target.setAutoAttach
#' 
#' Controls whether to automatically attach to new targets which are considered to be related to
#'        this one. When turned on, attaches to all existing related targets as well. When turned off,
#'        automatically detaches from all currently attached targets.
#' 
#' @param promise An asynchronous result.
#' @param autoAttach A logical. 
#'        Whether to auto-attach to related targets. 
#' @param waitForDebuggerOnStart A logical. 
#'        Whether to pause new targets when attaching to them. Use `Runtime.runIfWaitingForDebugger`
#'        to run paused targets. 
#' @param flatten Experimental. Optional. A logical. 
#'        Enables "flat" access to the session via specifying sessionId attribute in the commands. 
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
Target.setAutoAttach <- function(promise, autoAttach, waitForDebuggerOnStart, flatten = NULL, awaitResult = TRUE) {
  method <- 'Target.setAutoAttach'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Target.setDiscoverTargets
#' 
#' Controls whether to discover available targets and notify via
#'        `targetCreated/targetInfoChanged/targetDestroyed` events.
#' 
#' @param promise An asynchronous result.
#' @param discover A logical. 
#'        Whether to discover available targets. 
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
Target.setDiscoverTargets <- function(promise, discover, awaitResult = TRUE) {
  method <- 'Target.setDiscoverTargets'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command Target.setRemoteLocations
#' 
#' Enables target discovery for the specified locations, when `setDiscoverTargets` was set to
#'        `true`.
#' 
#' @param promise An asynchronous result.
#' @param locations A list of RemoteLocation. 
#'        List of remote locations. 
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
Target.setRemoteLocations <- function(promise, locations, awaitResult = TRUE) {
  method <- 'Target.setRemoteLocations'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}
