# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Animation.disable
#' 
#' Disables animation domain notifications.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Animation.disable <- function(promise) {
  method <- 'Animation.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Animation.enable
#' 
#' Enables animation domain notifications.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Animation.enable <- function(promise) {
  method <- 'Animation.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Animation.getCurrentTime
#' 
#' Returns the current time of the an animation.
#' 
#' @param promise An aynchronous result object.
#' @param id A character string. 
#'        Id of animation. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Animation.getCurrentTime <- function(promise, id) {
  method <- 'Animation.getCurrentTime'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Animation.getPlaybackRate
#' 
#' Gets the playback rate of the document timeline.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Animation.getPlaybackRate <- function(promise) {
  method <- 'Animation.getPlaybackRate'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Animation.releaseAnimations
#' 
#' Releases a set of animations to no longer be manipulated.
#' 
#' @param promise An aynchronous result object.
#' @param animations A list of string. 
#'        List of animation ids to seek. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Animation.releaseAnimations <- function(promise, animations) {
  method <- 'Animation.releaseAnimations'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Animation.resolveAnimation
#' 
#' Gets the remote object of the Animation.
#' 
#' @param promise An aynchronous result object.
#' @param animationId A character string. 
#'        Animation id. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Animation.resolveAnimation <- function(promise, animationId) {
  method <- 'Animation.resolveAnimation'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Animation.seekAnimations
#' 
#' Seek a set of animations to a particular time within each animation.
#' 
#' @param promise An aynchronous result object.
#' @param animations A list of string. 
#'        List of animation ids to seek. 
#' @param currentTime A numeric. 
#'        Set the current time of each animation. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Animation.seekAnimations <- function(promise, animations, currentTime) {
  method <- 'Animation.seekAnimations'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Animation.setPaused
#' 
#' Sets the paused state of a set of animations.
#' 
#' @param promise An aynchronous result object.
#' @param animations A list of string. 
#'        Animations to set the pause state of. 
#' @param paused A logical. 
#'        Paused state to set to. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Animation.setPaused <- function(promise, animations, paused) {
  method <- 'Animation.setPaused'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Animation.setPlaybackRate
#' 
#' Sets the playback rate of the document timeline.
#' 
#' @param promise An aynchronous result object.
#' @param playbackRate A numeric. 
#'        Playback rate for animations on page 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Animation.setPlaybackRate <- function(promise, playbackRate) {
  method <- 'Animation.setPlaybackRate'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Animation.setTiming
#' 
#' Sets the timing of an animation node.
#' 
#' @param promise An aynchronous result object.
#' @param animationId A character string. 
#'        Animation id. 
#' @param duration A numeric. 
#'        Duration of the animation. 
#' @param delay A numeric. 
#'        Delay of the animation. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Animation.setTiming <- function(promise, animationId, duration, delay) {
  method <- 'Animation.setTiming'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
