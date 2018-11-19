# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Target.activateTarget
#'  
#' Activates (focuses) the target.
#'  
#' @param promise An aynchronous result object.
#' @param targetId A TargetID. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Target.activateTarget <- function(promise, targetId) {
  method <- 'Target.activateTarget'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Target.attachToTarget
#'  
#' Attaches to the target with given id.
#'  
#' @param promise An aynchronous result object.
#' @param targetId A TargetID. 
#' @param flatten Experimental. Optional. A logical. 
#'        Enables "flat" access to the session via specifying sessionId attribute in the commands. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Target.attachToTarget <- function(promise, targetId, flatten = NULL) {
  method <- 'Target.attachToTarget'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Target.attachToBrowserTarget
#'  
#' Attaches to the browser target, only uses flat sessionId mode.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Target.attachToBrowserTarget <- function(promise) {
  method <- 'Target.attachToBrowserTarget'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Target.closeTarget
#'  
#' Closes the target. If the target is a page that gets closed too.
#'  
#' @param promise An aynchronous result object.
#' @param targetId A TargetID. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Target.closeTarget <- function(promise, targetId) {
  method <- 'Target.closeTarget'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
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
#' @param promise An aynchronous result object.
#' @param targetId A TargetID. 
#' @param bindingName Optional. A character string. 
#'        Binding name, 'cdp' if not specified. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Target.exposeDevToolsProtocol <- function(promise, targetId, bindingName = NULL) {
  method <- 'Target.exposeDevToolsProtocol'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Target.createBrowserContext
#'  
#' Creates a new empty BrowserContext. Similar to an incognito profile but you can have more than
#'        one.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Target.createBrowserContext <- function(promise) {
  method <- 'Target.createBrowserContext'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Target.getBrowserContexts
#'  
#' Returns all browser contexts created with `Target.createBrowserContext` method.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Target.getBrowserContexts <- function(promise) {
  method <- 'Target.getBrowserContexts'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Target.createTarget
#'  
#' Creates a new page.
#'  
#' @param promise An aynchronous result object.
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
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Target.createTarget <- function(promise, url, width = NULL, height = NULL, browserContextId = NULL, enableBeginFrameControl = NULL) {
  method <- 'Target.createTarget'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Target.detachFromTarget
#'  
#' Detaches session with given id.
#'  
#' @param promise An aynchronous result object.
#' @param sessionId Optional. A SessionID. 
#'        Session to detach. 
#' @param targetId Deprecated. Optional. A TargetID. 
#'        Deprecated. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Target.detachFromTarget <- function(promise, sessionId = NULL, targetId = NULL) {
  method <- 'Target.detachFromTarget'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Target.disposeBrowserContext
#'  
#' Deletes a BrowserContext. All the belonging pages will be closed without calling their
#'        beforeunload hooks.
#'  
#' @param promise An aynchronous result object.
#' @param browserContextId A BrowserContextID. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Target.disposeBrowserContext <- function(promise, browserContextId) {
  method <- 'Target.disposeBrowserContext'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Target.getTargetInfo
#'  
#' Returns information about a target.
#'  
#' @param promise An aynchronous result object.
#' @param targetId Optional. A TargetID. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Target.getTargetInfo <- function(promise, targetId = NULL) {
  method <- 'Target.getTargetInfo'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Target.getTargets
#'  
#' Retrieves a list of available targets.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Target.getTargets <- function(promise) {
  method <- 'Target.getTargets'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Target.sendMessageToTarget
#'  
#' Sends protocol message over session with given id.
#'  
#' @param promise An aynchronous result object.
#' @param message A character string. 
#' @param sessionId Optional. A SessionID. 
#'        Identifier of the session. 
#' @param targetId Deprecated. Optional. A TargetID. 
#'        Deprecated. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Target.sendMessageToTarget <- function(promise, message, sessionId = NULL, targetId = NULL) {
  method <- 'Target.sendMessageToTarget'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Target.setAutoAttach
#'  
#' Controls whether to automatically attach to new targets which are considered to be related to
#'        this one. When turned on, attaches to all existing related targets as well. When turned off,
#'        automatically detaches from all currently attached targets.
#'  
#' @param promise An aynchronous result object.
#' @param autoAttach A logical. 
#'        Whether to auto-attach to related targets. 
#' @param waitForDebuggerOnStart A logical. 
#'        Whether to pause new targets when attaching to them. Use `Runtime.runIfWaitingForDebugger`
#'        to run paused targets. 
#' @param flatten Experimental. Optional. A logical. 
#'        Enables "flat" access to the session via specifying sessionId attribute in the commands. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Target.setAutoAttach <- function(promise, autoAttach, waitForDebuggerOnStart, flatten = NULL) {
  method <- 'Target.setAutoAttach'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Target.setDiscoverTargets
#'  
#' Controls whether to discover available targets and notify via
#'        `targetCreated/targetInfoChanged/targetDestroyed` events.
#'  
#' @param promise An aynchronous result object.
#' @param discover A logical. 
#'        Whether to discover available targets. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Target.setDiscoverTargets <- function(promise, discover) {
  method <- 'Target.setDiscoverTargets'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Target.setRemoteLocations
#'  
#' Enables target discovery for the specified locations, when `setDiscoverTargets` was set to
#'        `true`.
#'  
#' @param promise An aynchronous result object.
#' @param locations A list of RemoteLocation. 
#'        List of remote locations. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Target.setRemoteLocations <- function(promise, locations) {
  method <- 'Target.setRemoteLocations'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
