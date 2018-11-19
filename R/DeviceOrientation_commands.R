# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command DeviceOrientation.clearDeviceOrientationOverride
#' 
#' Clears the overridden Device Orientation.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DeviceOrientation.clearDeviceOrientationOverride <- function(promise) {
  method <- 'DeviceOrientation.clearDeviceOrientationOverride'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command DeviceOrientation.setDeviceOrientationOverride
#' 
#' Overrides the Device Orientation.
#' 
#' @param promise An aynchronous result object.
#' @param alpha A numeric. 
#'        Mock alpha 
#' @param beta A numeric. 
#'        Mock beta 
#' @param gamma A numeric. 
#'        Mock gamma 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
DeviceOrientation.setDeviceOrientationOverride <- function(promise, alpha, beta, gamma) {
  method <- 'DeviceOrientation.setDeviceOrientationOverride'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
