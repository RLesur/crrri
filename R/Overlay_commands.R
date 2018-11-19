#' DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Overlay.disable
#'  
#' Disables domain notifications.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.disable <- function(promise) {
  method <- 'Overlay.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.enable
#'  
#' Enables domain notifications.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.enable <- function(promise) {
  method <- 'Overlay.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.getHighlightObjectForTest
#'  
#' For testing.
#'  
#' @param promise An aynchronous result object.
#' @param nodeId A DOM.NodeId. 
#'        Id of the node to get highlight object for. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Overlay.getHighlightObjectForTest <- function(promise, nodeId) {
  method <- 'Overlay.getHighlightObjectForTest'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.hideHighlight
#'  
#' Hides any highlight.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.hideHighlight <- function(promise) {
  method <- 'Overlay.hideHighlight'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.highlightFrame
#'  
#' Highlights owner element of the frame with given id.
#'  
#' @param promise An aynchronous result object.
#' @param frameId A Page.FrameId. 
#'        Identifier of the frame to highlight. 
#' @param contentColor Optional. A DOM.RGBA. 
#'        The content box highlight fill color (default: transparent). 
#' @param contentOutlineColor Optional. A DOM.RGBA. 
#'        The content box highlight outline color (default: transparent). 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.highlightFrame <- function(promise, frameId, contentColor = NULL, contentOutlineColor = NULL) {
  method <- 'Overlay.highlightFrame'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.highlightNode
#'  
#' Highlights DOM node with given id or with the given JavaScript object wrapper. Either nodeId or
#'        objectId must be specified.
#'  
#' @param promise An aynchronous result object.
#' @param highlightConfig A HighlightConfig. 
#'        A descriptor for the highlight appearance. 
#' @param nodeId Optional. A DOM.NodeId. 
#'        Identifier of the node to highlight. 
#' @param backendNodeId Optional. A DOM.BackendNodeId. 
#'        Identifier of the backend node to highlight. 
#' @param objectId Optional. A Runtime.RemoteObjectId. 
#'        JavaScript object id of the node to be highlighted. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.highlightNode <- function(promise, highlightConfig, nodeId = NULL, backendNodeId = NULL, objectId = NULL) {
  method <- 'Overlay.highlightNode'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.highlightQuad
#'  
#' Highlights given quad. Coordinates are absolute with respect to the main frame viewport.
#'  
#' @param promise An aynchronous result object.
#' @param quad A DOM.Quad. 
#'        Quad to highlight 
#' @param color Optional. A DOM.RGBA. 
#'        The highlight fill color (default: transparent). 
#' @param outlineColor Optional. A DOM.RGBA. 
#'        The highlight outline color (default: transparent). 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.highlightQuad <- function(promise, quad, color = NULL, outlineColor = NULL) {
  method <- 'Overlay.highlightQuad'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.highlightRect
#'  
#' Highlights given rectangle. Coordinates are absolute with respect to the main frame viewport.
#'  
#' @param promise An aynchronous result object.
#' @param x An integer. 
#'        X coordinate 
#' @param y An integer. 
#'        Y coordinate 
#' @param width An integer. 
#'        Rectangle width 
#' @param height An integer. 
#'        Rectangle height 
#' @param color Optional. A DOM.RGBA. 
#'        The highlight fill color (default: transparent). 
#' @param outlineColor Optional. A DOM.RGBA. 
#'        The highlight outline color (default: transparent). 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.highlightRect <- function(promise, x, y, width, height, color = NULL, outlineColor = NULL) {
  method <- 'Overlay.highlightRect'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.setInspectMode
#'  
#' Enters the 'inspect' mode. In this mode, elements that user is hovering over are highlighted.
#'        Backend then generates 'inspectNodeRequested' event upon element selection.
#'  
#' @param promise An aynchronous result object.
#' @param mode A InspectMode. 
#'        Set an inspection mode. 
#' @param highlightConfig Optional. A HighlightConfig. 
#'        A descriptor for the highlight appearance of hovered-over nodes. May be omitted if `enabled
#'        == false`. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.setInspectMode <- function(promise, mode, highlightConfig = NULL) {
  method <- 'Overlay.setInspectMode'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.setPausedInDebuggerMessage
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param message Optional. A character string. 
#'        The message to display, also triggers resume and step over controls. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.setPausedInDebuggerMessage <- function(promise, message = NULL) {
  method <- 'Overlay.setPausedInDebuggerMessage'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.setShowDebugBorders
#'  
#' Requests that backend shows debug borders on layers
#'  
#' @param promise An aynchronous result object.
#' @param show A logical. 
#'        True for showing debug borders 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.setShowDebugBorders <- function(promise, show) {
  method <- 'Overlay.setShowDebugBorders'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.setShowFPSCounter
#'  
#' Requests that backend shows the FPS counter
#'  
#' @param promise An aynchronous result object.
#' @param show A logical. 
#'        True for showing the FPS counter 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.setShowFPSCounter <- function(promise, show) {
  method <- 'Overlay.setShowFPSCounter'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.setShowPaintRects
#'  
#' Requests that backend shows paint rectangles
#'  
#' @param promise An aynchronous result object.
#' @param result A logical. 
#'        True for showing paint rectangles 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.setShowPaintRects <- function(promise, result) {
  method <- 'Overlay.setShowPaintRects'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.setShowScrollBottleneckRects
#'  
#' Requests that backend shows scroll bottleneck rects
#'  
#' @param promise An aynchronous result object.
#' @param show A logical. 
#'        True for showing scroll bottleneck rects 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.setShowScrollBottleneckRects <- function(promise, show) {
  method <- 'Overlay.setShowScrollBottleneckRects'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.setShowHitTestBorders
#'  
#' Requests that backend shows hit-test borders on layers
#'  
#' @param promise An aynchronous result object.
#' @param show A logical. 
#'        True for showing hit-test borders 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.setShowHitTestBorders <- function(promise, show) {
  method <- 'Overlay.setShowHitTestBorders'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.setShowViewportSizeOnResize
#'  
#' Paints viewport size upon main frame resize.
#'  
#' @param promise An aynchronous result object.
#' @param show A logical. 
#'        Whether to paint size or not. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.setShowViewportSizeOnResize <- function(promise, show) {
  method <- 'Overlay.setShowViewportSizeOnResize'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Overlay.setSuspended
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param suspended A logical. 
#'        Whether overlay should be suspended and not consume any resources until resumed. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Overlay.setSuspended <- function(promise, suspended) {
  method <- 'Overlay.setSuspended'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
