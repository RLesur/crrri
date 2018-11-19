# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Browser.grantPermissions
#'  
#' Grant specific permissions to the given origin and reject all others.
#'  
#' @param promise An aynchronous result object.
#' @param origin A character string. 
#' @param permissions A list of PermissionType. 
#' @param browserContextId Optional. A Target.BrowserContextID. 
#'        BrowserContext to override permissions. When omitted, default browser context is used. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Browser.grantPermissions <- function(promise, origin, permissions, browserContextId = NULL) {
  method <- 'Browser.grantPermissions'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Browser.resetPermissions
#'  
#' Reset all permission management for all origins.
#'  
#' @param promise An aynchronous result object.
#' @param browserContextId Optional. A Target.BrowserContextID. 
#'        BrowserContext to reset permissions. When omitted, default browser context is used. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Browser.resetPermissions <- function(promise, browserContextId = NULL) {
  method <- 'Browser.resetPermissions'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Browser.close
#'  
#' Close browser gracefully.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Browser.close <- function(promise) {
  method <- 'Browser.close'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Browser.crash
#'  
#' Crashes browser on the main thread.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Browser.crash <- function(promise) {
  method <- 'Browser.crash'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Browser.getVersion
#'  
#' Returns version information.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 5.
#' @export
Browser.getVersion <- function(promise) {
  method <- 'Browser.getVersion'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Browser.getBrowserCommandLine
#'  
#' Returns the command line switches for the browser process if, and only if
#'        --enable-automation is on the commandline.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Browser.getBrowserCommandLine <- function(promise) {
  method <- 'Browser.getBrowserCommandLine'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Browser.getHistograms
#'  
#' Get Chrome histograms.
#'  
#' @param promise An aynchronous result object.
#' @param query Optional. A character string. 
#'        Requested substring in name. Only histograms which have query as a
#'        substring in their name are extracted. An empty or absent query returns
#'        all histograms. 
#' @param delta Optional. A logical. 
#'        If true, retrieve delta since last call. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Browser.getHistograms <- function(promise, query = NULL, delta = NULL) {
  method <- 'Browser.getHistograms'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Browser.getHistogram
#'  
#' Get a Chrome histogram by name.
#'  
#' @param promise An aynchronous result object.
#' @param name A character string. 
#'        Requested histogram name. 
#' @param delta Optional. A logical. 
#'        If true, retrieve delta since last call. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Browser.getHistogram <- function(promise, name, delta = NULL) {
  method <- 'Browser.getHistogram'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Browser.getWindowBounds
#'  
#' Get position and size of the browser window.
#'  
#' @param promise An aynchronous result object.
#' @param windowId A WindowID. 
#'        Browser window id. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Browser.getWindowBounds <- function(promise, windowId) {
  method <- 'Browser.getWindowBounds'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Browser.getWindowForTarget
#'  
#' Get the browser window that contains the devtools target.
#'  
#' @param promise An aynchronous result object.
#' @param targetId Optional. A Target.TargetID. 
#'        Devtools agent host id. If called as a part of the session, associated targetId is used. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
Browser.getWindowForTarget <- function(promise, targetId = NULL) {
  method <- 'Browser.getWindowForTarget'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Browser.setWindowBounds
#'  
#' Set position and/or size of the browser window.
#'  
#' @param promise An aynchronous result object.
#' @param windowId A WindowID. 
#'        Browser window id. 
#' @param bounds A Bounds. 
#'        New window bounds. The 'minimized', 'maximized' and 'fullscreen' states cannot be combined
#'        with 'left', 'top', 'width' or 'height'. Leaves unspecified fields unchanged. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Browser.setWindowBounds <- function(promise, windowId, bounds) {
  method <- 'Browser.setWindowBounds'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Browser.setDockTile
#'  
#' Set dock tile details, platform-specific.
#'  
#' @param promise An aynchronous result object.
#' @param badgeLabel Optional. A character string. 
#' @param image Optional. A character string. 
#'        Png encoded image. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Browser.setDockTile <- function(promise, badgeLabel = NULL, image = NULL) {
  method <- 'Browser.setDockTile'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
