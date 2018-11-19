# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Emulation.canEmulate
#' 
#' Tells whether emulation is supported.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Emulation.canEmulate <- function(promise) {
  method <- 'Emulation.canEmulate'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.clearDeviceMetricsOverride
#' 
#' Clears the overriden device metrics.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.clearDeviceMetricsOverride <- function(promise) {
  method <- 'Emulation.clearDeviceMetricsOverride'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.clearGeolocationOverride
#' 
#' Clears the overriden Geolocation Position and Error.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.clearGeolocationOverride <- function(promise) {
  method <- 'Emulation.clearGeolocationOverride'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.resetPageScaleFactor
#' 
#' Requests that page scale factor is reset to initial values.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.resetPageScaleFactor <- function(promise) {
  method <- 'Emulation.resetPageScaleFactor'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.setFocusEmulationEnabled
#' 
#' Enables or disables simulating a focused and active page.
#' 
#' @param promise An aynchronous result object.
#' @param enabled A logical. 
#'        Whether to enable to disable focus emulation. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.setFocusEmulationEnabled <- function(promise, enabled) {
  method <- 'Emulation.setFocusEmulationEnabled'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.setCPUThrottlingRate
#' 
#' Enables CPU throttling to emulate slow CPUs.
#' 
#' @param promise An aynchronous result object.
#' @param rate A numeric. 
#'        Throttling rate as a slowdown factor (1 is no throttle, 2 is 2x slowdown, etc). 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.setCPUThrottlingRate <- function(promise, rate) {
  method <- 'Emulation.setCPUThrottlingRate'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.setDefaultBackgroundColorOverride
#' 
#' Sets or clears an override of the default background color of the frame. This override is used
#'        if the content does not specify one.
#' 
#' @param promise An aynchronous result object.
#' @param color Optional. A DOM.RGBA. 
#'        RGBA of the default background color. If not specified, any existing override will be
#'        cleared. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.setDefaultBackgroundColorOverride <- function(promise, color = NULL) {
  method <- 'Emulation.setDefaultBackgroundColorOverride'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.setDeviceMetricsOverride
#' 
#' Overrides the values of device screen dimensions (window.screen.width, window.screen.height,
#'        window.innerWidth, window.innerHeight, and "device-width"/"device-height"-related CSS media
#'        query results).
#' 
#' @param promise An aynchronous result object.
#' @param width An integer. 
#'        Overriding width value in pixels (minimum 0, maximum 10000000). 0 disables the override. 
#' @param height An integer. 
#'        Overriding height value in pixels (minimum 0, maximum 10000000). 0 disables the override. 
#' @param deviceScaleFactor A numeric. 
#'        Overriding device scale factor value. 0 disables the override. 
#' @param mobile A logical. 
#'        Whether to emulate mobile device. This includes viewport meta tag, overlay scrollbars, text
#'        autosizing and more. 
#' @param scale Experimental. Optional. A numeric. 
#'        Scale to apply to resulting view image. 
#' @param screenWidth Experimental. Optional. An integer. 
#'        Overriding screen width value in pixels (minimum 0, maximum 10000000). 
#' @param screenHeight Experimental. Optional. An integer. 
#'        Overriding screen height value in pixels (minimum 0, maximum 10000000). 
#' @param positionX Experimental. Optional. An integer. 
#'        Overriding view X position on screen in pixels (minimum 0, maximum 10000000). 
#' @param positionY Experimental. Optional. An integer. 
#'        Overriding view Y position on screen in pixels (minimum 0, maximum 10000000). 
#' @param dontSetVisibleSize Experimental. Optional. A logical. 
#'        Do not set visible view size, rely upon explicit setVisibleSize call. 
#' @param screenOrientation Optional. A ScreenOrientation. 
#'        Screen orientation override. 
#' @param viewport Experimental. Optional. A Page.Viewport. 
#'        If set, the visible area of the page will be overridden to this viewport. This viewport
#'        change is not observed by the page, e.g. viewport-relative elements do not change positions. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.setDeviceMetricsOverride <- function(promise, width, height, deviceScaleFactor, mobile, scale = NULL, screenWidth = NULL, screenHeight = NULL, positionX = NULL, positionY = NULL, dontSetVisibleSize = NULL, screenOrientation = NULL, viewport = NULL) {
  method <- 'Emulation.setDeviceMetricsOverride'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.setScrollbarsHidden
#' 
#' 
#' 
#' @param promise An aynchronous result object.
#' @param hidden A logical. 
#'        Whether scrollbars should be always hidden. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.setScrollbarsHidden <- function(promise, hidden) {
  method <- 'Emulation.setScrollbarsHidden'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.setDocumentCookieDisabled
#' 
#' 
#' 
#' @param promise An aynchronous result object.
#' @param disabled A logical. 
#'        Whether document.coookie API should be disabled. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.setDocumentCookieDisabled <- function(promise, disabled) {
  method <- 'Emulation.setDocumentCookieDisabled'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.setEmitTouchEventsForMouse
#' 
#' 
#' 
#' @param promise An aynchronous result object.
#' @param enabled A logical. 
#'        Whether touch emulation based on mouse input should be enabled. 
#' @param configuration Optional. A character string. 
#'        Touch/gesture events configuration. Default: current platform. Accepted values: mobile, desktop.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.setEmitTouchEventsForMouse <- function(promise, enabled, configuration = NULL) {
  method <- 'Emulation.setEmitTouchEventsForMouse'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.setEmulatedMedia
#' 
#' Emulates the given media for CSS media queries.
#' 
#' @param promise An aynchronous result object.
#' @param media A character string. 
#'        Media type to emulate. Empty string disables the override. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.setEmulatedMedia <- function(promise, media) {
  method <- 'Emulation.setEmulatedMedia'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.setGeolocationOverride
#' 
#' Overrides the Geolocation Position or Error. Omitting any of the parameters emulates position
#'        unavailable.
#' 
#' @param promise An aynchronous result object.
#' @param latitude Optional. A numeric. 
#'        Mock latitude 
#' @param longitude Optional. A numeric. 
#'        Mock longitude 
#' @param accuracy Optional. A numeric. 
#'        Mock accuracy 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.setGeolocationOverride <- function(promise, latitude = NULL, longitude = NULL, accuracy = NULL) {
  method <- 'Emulation.setGeolocationOverride'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.setPageScaleFactor
#' 
#' Sets a specified page scale factor.
#' 
#' @param promise An aynchronous result object.
#' @param pageScaleFactor A numeric. 
#'        Page scale factor. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.setPageScaleFactor <- function(promise, pageScaleFactor) {
  method <- 'Emulation.setPageScaleFactor'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.setScriptExecutionDisabled
#' 
#' Switches script execution in the page.
#' 
#' @param promise An aynchronous result object.
#' @param value A logical. 
#'        Whether script execution should be disabled in the page. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.setScriptExecutionDisabled <- function(promise, value) {
  method <- 'Emulation.setScriptExecutionDisabled'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.setTouchEmulationEnabled
#' 
#' Enables touch on platforms which do not support them.
#' 
#' @param promise An aynchronous result object.
#' @param enabled A logical. 
#'        Whether the touch event emulation should be enabled. 
#' @param maxTouchPoints Optional. An integer. 
#'        Maximum touch points supported. Defaults to one. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.setTouchEmulationEnabled <- function(promise, enabled, maxTouchPoints = NULL) {
  method <- 'Emulation.setTouchEmulationEnabled'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.setVirtualTimePolicy
#' 
#' Turns on virtual time for all frames (replacing real-time with a synthetic time source) and sets
#'        the current virtual time policy.  Note this supersedes any previous time budget.
#' 
#' @param promise An aynchronous result object.
#' @param policy A VirtualTimePolicy. 
#' @param budget Optional. A numeric. 
#'        If set, after this many virtual milliseconds have elapsed virtual time will be paused and a
#'        virtualTimeBudgetExpired event is sent. 
#' @param maxVirtualTimeTaskStarvationCount Optional. An integer. 
#'        If set this specifies the maximum number of tasks that can be run before virtual is forced
#'        forwards to prevent deadlock. 
#' @param waitForNavigation Optional. A logical. 
#'        If set the virtual time policy change should be deferred until any frame starts navigating.
#'        Note any previous deferred policy change is superseded. 
#' @param initialVirtualTime Optional. A Network.TimeSinceEpoch. 
#'        If set, base::Time::Now will be overriden to initially return this value. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Emulation.setVirtualTimePolicy <- function(promise, policy, budget = NULL, maxVirtualTimeTaskStarvationCount = NULL, waitForNavigation = NULL, initialVirtualTime = NULL) {
  method <- 'Emulation.setVirtualTimePolicy'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Emulation.setUserAgentOverride
#' 
#' Allows overriding user agent with the given string.
#' 
#' @param promise An aynchronous result object.
#' @param userAgent A character string. 
#'        User agent to use. 
#' @param acceptLanguage Optional. A character string. 
#'        Browser langugage to emulate. 
#' @param platform Optional. A character string. 
#'        The platform navigator.platform should return. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Emulation.setUserAgentOverride <- function(promise, userAgent, acceptLanguage = NULL, platform = NULL) {
  method <- 'Emulation.setUserAgentOverride'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
