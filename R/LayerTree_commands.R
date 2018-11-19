# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command LayerTree.compositingReasons
#' 
#' Provides the reasons why the given layer was composited.
#' 
#' @param promise An aynchronous result object.
#' @param layerId A LayerId. 
#'        The id of the layer for which we want to get the reasons it was composited. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
LayerTree.compositingReasons <- function(promise, layerId) {
  method <- 'LayerTree.compositingReasons'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command LayerTree.disable
#' 
#' Disables compositing tree inspection.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
LayerTree.disable <- function(promise) {
  method <- 'LayerTree.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command LayerTree.enable
#' 
#' Enables compositing tree inspection.
#' 
#' @param promise An aynchronous result object.
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
LayerTree.enable <- function(promise) {
  method <- 'LayerTree.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command LayerTree.loadSnapshot
#' 
#' Returns the snapshot identifier.
#' 
#' @param promise An aynchronous result object.
#' @param tiles A list of PictureTile. 
#'        An array of tiles composing the snapshot. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
LayerTree.loadSnapshot <- function(promise, tiles) {
  method <- 'LayerTree.loadSnapshot'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command LayerTree.makeSnapshot
#' 
#' Returns the layer snapshot identifier.
#' 
#' @param promise An aynchronous result object.
#' @param layerId A LayerId. 
#'        The id of the layer. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
LayerTree.makeSnapshot <- function(promise, layerId) {
  method <- 'LayerTree.makeSnapshot'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command LayerTree.profileSnapshot
#' 
#' 
#' 
#' @param promise An aynchronous result object.
#' @param snapshotId A SnapshotId. 
#'        The id of the layer snapshot. 
#' @param minRepeatCount Optional. An integer. 
#'        The maximum number of times to replay the snapshot (1, if not specified). 
#' @param minDuration Optional. A numeric. 
#'        The minimum duration (in seconds) to replay the snapshot. 
#' @param clipRect Optional. A DOM.Rect. 
#'        The clip rectangle to apply when replaying the snapshot. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
LayerTree.profileSnapshot <- function(promise, snapshotId, minRepeatCount = NULL, minDuration = NULL, clipRect = NULL) {
  method <- 'LayerTree.profileSnapshot'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command LayerTree.releaseSnapshot
#' 
#' Releases layer snapshot captured by the back-end.
#' 
#' @param promise An aynchronous result object.
#' @param snapshotId A SnapshotId. 
#'        The id of the layer snapshot. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
LayerTree.releaseSnapshot <- function(promise, snapshotId) {
  method <- 'LayerTree.releaseSnapshot'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command LayerTree.replaySnapshot
#' 
#' Replays the layer snapshot and returns the resulting bitmap.
#' 
#' @param promise An aynchronous result object.
#' @param snapshotId A SnapshotId. 
#'        The id of the layer snapshot. 
#' @param fromStep Optional. An integer. 
#'        The first step to replay from (replay from the very start if not specified). 
#' @param toStep Optional. An integer. 
#'        The last step to replay to (replay till the end if not specified). 
#' @param scale Optional. A numeric. 
#'        The scale to apply while replaying (defaults to 1). 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
LayerTree.replaySnapshot <- function(promise, snapshotId, fromStep = NULL, toStep = NULL, scale = NULL) {
  method <- 'LayerTree.replaySnapshot'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command LayerTree.snapshotCommandLog
#' 
#' Replays the layer snapshot and returns canvas log.
#' 
#' @param promise An aynchronous result object.
#' @param snapshotId A SnapshotId. 
#'        The id of the layer snapshot. 
#' 
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
LayerTree.snapshotCommandLog <- function(promise, snapshotId) {
  method <- 'LayerTree.snapshotCommandLog'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
