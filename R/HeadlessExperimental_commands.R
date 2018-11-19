# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command HeadlessExperimental.beginFrame
#' 
#' Sends a BeginFrame to the target and returns when the frame was completed. Optionally captures a
#'        screenshot from the resulting frame. Requires that the target was created with enabled
#'        BeginFrameControl. Designed for use with --run-all-compositor-stages-before-draw, see also
#'        https://goo.gl/3zHXhB for more background.
#' 
#' @param promise An aynchronous result object.
#' @param frameTimeTicks Optional. A numeric. 
#'        Timestamp of this BeginFrame in Renderer TimeTicks (milliseconds of uptime). If not set,
#'        the current time will be used. 
#' @param interval Optional. A numeric. 
#'        The interval between BeginFrames that is reported to the compositor, in milliseconds.
#'        Defaults to a 60 frames/second interval, i.e. about 16.666 milliseconds. 
#' @param noDisplayUpdates Optional. A logical. 
#'        Whether updates should not be committed and drawn onto the display. False by default. If
#'        true, only side effects of the BeginFrame will be run, such as layout and animations, but
#'        any visual updates may not be visible on the display or in screenshots. 
#' @param screenshot Optional. A ScreenshotParams. 
#'        If set, a screenshot of the frame will be captured and returned in the response. Otherwise,
#'        no screenshot will be captured. Note that capturing a screenshot can fail, for example,
#'        during renderer initialization. In such a case, no screenshot data will be returned. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
HeadlessExperimental.beginFrame <- function(promise, frameTimeTicks = NULL, interval = NULL, noDisplayUpdates = NULL, screenshot = NULL) {
  method <- 'HeadlessExperimental.beginFrame'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command HeadlessExperimental.disable
#' 
#' Disables headless events for the target.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
HeadlessExperimental.disable <- function(promise) {
  method <- 'HeadlessExperimental.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command HeadlessExperimental.enable
#' 
#' Enables headless events for the target.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
HeadlessExperimental.enable <- function(promise) {
  method <- 'HeadlessExperimental.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
