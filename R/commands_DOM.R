# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command DOM.collectClassNamesFromSubtree
#' 
#' Collects class names for the node with given id and all of it's child nodes.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        Id of the node to collect class names. 
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
DOM.collectClassNamesFromSubtree <- function(promise, nodeId, awaitResult = TRUE) {
  method <- 'DOM.collectClassNamesFromSubtree'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.copyTo
#' 
#' Creates a deep copy of the specified node and places it into the target container before the
#'        given anchor.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        Id of the node to copy. 
#' @param targetNodeId A NodeId. 
#'        Id of the element to drop the copy into. 
#' @param insertBeforeNodeId Optional. A NodeId. 
#'        Drop the copy before this node (if absent, the copy becomes the last child of
#'        `targetNodeId`). 
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
DOM.copyTo <- function(promise, nodeId, targetNodeId, insertBeforeNodeId = NULL, awaitResult = TRUE) {
  method <- 'DOM.copyTo'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.describeNode
#' 
#' Describes node given its id, does not require domain to be enabled. Does not start tracking any
#'        objects, can be used for automation.
#' 
#' @param promise An asynchronous result.
#' @param nodeId Optional. A NodeId. 
#'        Identifier of the node. 
#' @param backendNodeId Optional. A BackendNodeId. 
#'        Identifier of the backend node. 
#' @param objectId Optional. A Runtime.RemoteObjectId. 
#'        JavaScript object id of the node wrapper. 
#' @param depth Optional. An integer. 
#'        The maximum depth at which children should be retrieved, defaults to 1. Use -1 for the
#'        entire subtree or provide an integer larger than 0. 
#' @param pierce Optional. A logical. 
#'        Whether or not iframes and shadow roots should be traversed when returning the subtree
#'        (default is false). 
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
DOM.describeNode <- function(promise, nodeId = NULL, backendNodeId = NULL, objectId = NULL, depth = NULL, pierce = NULL, awaitResult = TRUE) {
  method <- 'DOM.describeNode'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.disable
#' 
#' Disables DOM agent for the given page.
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
DOM.disable <- function(promise, awaitResult = TRUE) {
  method <- 'DOM.disable'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.discardSearchResults
#' 
#' Discards search results from the session with the given id. `getSearchResults` should no longer
#'        be called for that search.
#' 
#' @param promise An asynchronous result.
#' @param searchId A character string. 
#'        Unique search session identifier. 
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
DOM.discardSearchResults <- function(promise, searchId, awaitResult = TRUE) {
  method <- 'DOM.discardSearchResults'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.enable
#' 
#' Enables DOM agent for the given page.
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
DOM.enable <- function(promise, awaitResult = TRUE) {
  method <- 'DOM.enable'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.focus
#' 
#' Focuses the given element.
#' 
#' @param promise An asynchronous result.
#' @param nodeId Optional. A NodeId. 
#'        Identifier of the node. 
#' @param backendNodeId Optional. A BackendNodeId. 
#'        Identifier of the backend node. 
#' @param objectId Optional. A Runtime.RemoteObjectId. 
#'        JavaScript object id of the node wrapper. 
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
DOM.focus <- function(promise, nodeId = NULL, backendNodeId = NULL, objectId = NULL, awaitResult = TRUE) {
  method <- 'DOM.focus'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.getAttributes
#' 
#' Returns attributes for the specified node.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        Id of the node to retrieve attibutes for. 
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
DOM.getAttributes <- function(promise, nodeId, awaitResult = TRUE) {
  method <- 'DOM.getAttributes'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.getBoxModel
#' 
#' Returns boxes for the given node.
#' 
#' @param promise An asynchronous result.
#' @param nodeId Optional. A NodeId. 
#'        Identifier of the node. 
#' @param backendNodeId Optional. A BackendNodeId. 
#'        Identifier of the backend node. 
#' @param objectId Optional. A Runtime.RemoteObjectId. 
#'        JavaScript object id of the node wrapper. 
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
DOM.getBoxModel <- function(promise, nodeId = NULL, backendNodeId = NULL, objectId = NULL, awaitResult = TRUE) {
  method <- 'DOM.getBoxModel'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.getContentQuads
#' 
#' Returns quads that describe node position on the page. This method
#'        might return multiple quads for inline nodes.
#' 
#' @param promise An asynchronous result.
#' @param nodeId Optional. A NodeId. 
#'        Identifier of the node. 
#' @param backendNodeId Optional. A BackendNodeId. 
#'        Identifier of the backend node. 
#' @param objectId Optional. A Runtime.RemoteObjectId. 
#'        JavaScript object id of the node wrapper. 
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
DOM.getContentQuads <- function(promise, nodeId = NULL, backendNodeId = NULL, objectId = NULL, awaitResult = TRUE) {
  method <- 'DOM.getContentQuads'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.getDocument
#' 
#' Returns the root DOM node (and optionally the subtree) to the caller.
#' 
#' @param promise An asynchronous result.
#' @param depth Optional. An integer. 
#'        The maximum depth at which children should be retrieved, defaults to 1. Use -1 for the
#'        entire subtree or provide an integer larger than 0. 
#' @param pierce Optional. A logical. 
#'        Whether or not iframes and shadow roots should be traversed when returning the subtree
#'        (default is false). 
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
DOM.getDocument <- function(promise, depth = NULL, pierce = NULL, awaitResult = TRUE) {
  method <- 'DOM.getDocument'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.getFlattenedDocument
#' 
#' Returns the root DOM node (and optionally the subtree) to the caller.
#' 
#' @param promise An asynchronous result.
#' @param depth Optional. An integer. 
#'        The maximum depth at which children should be retrieved, defaults to 1. Use -1 for the
#'        entire subtree or provide an integer larger than 0. 
#' @param pierce Optional. A logical. 
#'        Whether or not iframes and shadow roots should be traversed when returning the subtree
#'        (default is false). 
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
DOM.getFlattenedDocument <- function(promise, depth = NULL, pierce = NULL, awaitResult = TRUE) {
  method <- 'DOM.getFlattenedDocument'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.getNodeForLocation
#' 
#' Returns node id at given location. Depending on whether DOM domain is enabled, nodeId is
#'        either returned or not.
#' 
#' @param promise An asynchronous result.
#' @param x An integer. 
#'        X coordinate. 
#' @param y An integer. 
#'        Y coordinate. 
#' @param includeUserAgentShadowDOM Optional. A logical. 
#'        False to skip to the nearest non-UA shadow root ancestor (default: false). 
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
DOM.getNodeForLocation <- function(promise, x, y, includeUserAgentShadowDOM = NULL, awaitResult = TRUE) {
  method <- 'DOM.getNodeForLocation'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.getOuterHTML
#' 
#' Returns node's HTML markup.
#' 
#' @param promise An asynchronous result.
#' @param nodeId Optional. A NodeId. 
#'        Identifier of the node. 
#' @param backendNodeId Optional. A BackendNodeId. 
#'        Identifier of the backend node. 
#' @param objectId Optional. A Runtime.RemoteObjectId. 
#'        JavaScript object id of the node wrapper. 
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
DOM.getOuterHTML <- function(promise, nodeId = NULL, backendNodeId = NULL, objectId = NULL, awaitResult = TRUE) {
  method <- 'DOM.getOuterHTML'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.getRelayoutBoundary
#' 
#' Returns the id of the nearest ancestor that is a relayout boundary.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        Id of the node. 
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
DOM.getRelayoutBoundary <- function(promise, nodeId, awaitResult = TRUE) {
  method <- 'DOM.getRelayoutBoundary'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.getSearchResults
#' 
#' Returns search results from given `fromIndex` to given `toIndex` from the search with the given
#'        identifier.
#' 
#' @param promise An asynchronous result.
#' @param searchId A character string. 
#'        Unique search session identifier. 
#' @param fromIndex An integer. 
#'        Start index of the search result to be returned. 
#' @param toIndex An integer. 
#'        End index of the search result to be returned. 
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
DOM.getSearchResults <- function(promise, searchId, fromIndex, toIndex, awaitResult = TRUE) {
  method <- 'DOM.getSearchResults'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.hideHighlight
#' 
#' Hides any highlight.
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
DOM.hideHighlight <- function(promise, awaitResult = TRUE) {
  method <- 'DOM.hideHighlight'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.highlightNode
#' 
#' Highlights DOM node.
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
DOM.highlightNode <- function(promise, awaitResult = TRUE) {
  method <- 'DOM.highlightNode'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.highlightRect
#' 
#' Highlights given rectangle.
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
DOM.highlightRect <- function(promise, awaitResult = TRUE) {
  method <- 'DOM.highlightRect'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.markUndoableState
#' 
#' Marks last undoable state.
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
DOM.markUndoableState <- function(promise, awaitResult = TRUE) {
  method <- 'DOM.markUndoableState'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.moveTo
#' 
#' Moves node into the new container, places it before the given anchor.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        Id of the node to move. 
#' @param targetNodeId A NodeId. 
#'        Id of the element to drop the moved node into. 
#' @param insertBeforeNodeId Optional. A NodeId. 
#'        Drop node before this one (if absent, the moved node becomes the last child of
#'        `targetNodeId`). 
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
DOM.moveTo <- function(promise, nodeId, targetNodeId, insertBeforeNodeId = NULL, awaitResult = TRUE) {
  method <- 'DOM.moveTo'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.performSearch
#' 
#' Searches for a given string in the DOM tree. Use `getSearchResults` to access search results or
#'        `cancelSearch` to end this search session.
#' 
#' @param promise An asynchronous result.
#' @param query A character string. 
#'        Plain text or query selector or XPath search query. 
#' @param includeUserAgentShadowDOM Optional. A logical. 
#'        True to search in user agent shadow DOM. 
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
DOM.performSearch <- function(promise, query, includeUserAgentShadowDOM = NULL, awaitResult = TRUE) {
  method <- 'DOM.performSearch'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.pushNodeByPathToFrontend
#' 
#' Requests that the node is sent to the caller given its path. // FIXME, use XPath
#' 
#' @param promise An asynchronous result.
#' @param path A character string. 
#'        Path to node in the proprietary format. 
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
DOM.pushNodeByPathToFrontend <- function(promise, path, awaitResult = TRUE) {
  method <- 'DOM.pushNodeByPathToFrontend'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.pushNodesByBackendIdsToFrontend
#' 
#' Requests that a batch of nodes is sent to the caller given their backend node ids.
#' 
#' @param promise An asynchronous result.
#' @param backendNodeIds A list of BackendNodeId. 
#'        The array of backend node ids. 
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
DOM.pushNodesByBackendIdsToFrontend <- function(promise, backendNodeIds, awaitResult = TRUE) {
  method <- 'DOM.pushNodesByBackendIdsToFrontend'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.querySelector
#' 
#' Executes `querySelector` on a given node.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        Id of the node to query upon. 
#' @param selector A character string. 
#'        Selector string. 
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
DOM.querySelector <- function(promise, nodeId, selector, awaitResult = TRUE) {
  method <- 'DOM.querySelector'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.querySelectorAll
#' 
#' Executes `querySelectorAll` on a given node.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        Id of the node to query upon. 
#' @param selector A character string. 
#'        Selector string. 
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
DOM.querySelectorAll <- function(promise, nodeId, selector, awaitResult = TRUE) {
  method <- 'DOM.querySelectorAll'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.redo
#' 
#' Re-does the last undone action.
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
DOM.redo <- function(promise, awaitResult = TRUE) {
  method <- 'DOM.redo'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.removeAttribute
#' 
#' Removes attribute with given name from an element with given id.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        Id of the element to remove attribute from. 
#' @param name A character string. 
#'        Name of the attribute to remove. 
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
DOM.removeAttribute <- function(promise, nodeId, name, awaitResult = TRUE) {
  method <- 'DOM.removeAttribute'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.removeNode
#' 
#' Removes node with given id.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        Id of the node to remove. 
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
DOM.removeNode <- function(promise, nodeId, awaitResult = TRUE) {
  method <- 'DOM.removeNode'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.requestChildNodes
#' 
#' Requests that children of the node with given id are returned to the caller in form of
#'        `setChildNodes` events where not only immediate children are retrieved, but all children down to
#'        the specified depth.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        Id of the node to get children for. 
#' @param depth Optional. An integer. 
#'        The maximum depth at which children should be retrieved, defaults to 1. Use -1 for the
#'        entire subtree or provide an integer larger than 0. 
#' @param pierce Optional. A logical. 
#'        Whether or not iframes and shadow roots should be traversed when returning the sub-tree
#'        (default is false). 
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
DOM.requestChildNodes <- function(promise, nodeId, depth = NULL, pierce = NULL, awaitResult = TRUE) {
  method <- 'DOM.requestChildNodes'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.requestNode
#' 
#' Requests that the node is sent to the caller given the JavaScript node object reference. All
#'        nodes that form the path from the node to the root are also sent to the client as a series of
#'        `setChildNodes` notifications.
#' 
#' @param promise An asynchronous result.
#' @param objectId A Runtime.RemoteObjectId. 
#'        JavaScript object id to convert into node. 
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
DOM.requestNode <- function(promise, objectId, awaitResult = TRUE) {
  method <- 'DOM.requestNode'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.resolveNode
#' 
#' Resolves the JavaScript node object for a given NodeId or BackendNodeId.
#' 
#' @param promise An asynchronous result.
#' @param nodeId Optional. A NodeId. 
#'        Id of the node to resolve. 
#' @param backendNodeId Optional. A DOM.BackendNodeId. 
#'        Backend identifier of the node to resolve. 
#' @param objectGroup Optional. A character string. 
#'        Symbolic group name that can be used to release multiple objects. 
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
DOM.resolveNode <- function(promise, nodeId = NULL, backendNodeId = NULL, objectGroup = NULL, awaitResult = TRUE) {
  method <- 'DOM.resolveNode'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.setAttributeValue
#' 
#' Sets attribute for an element with given id.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        Id of the element to set attribute for. 
#' @param name A character string. 
#'        Attribute name. 
#' @param value A character string. 
#'        Attribute value. 
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
DOM.setAttributeValue <- function(promise, nodeId, name, value, awaitResult = TRUE) {
  method <- 'DOM.setAttributeValue'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.setAttributesAsText
#' 
#' Sets attributes on element with given id. This method is useful when user edits some existing
#'        attribute value and types in several attribute name/value pairs.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        Id of the element to set attributes for. 
#' @param text A character string. 
#'        Text with a number of attributes. Will parse this text using HTML parser. 
#' @param name Optional. A character string. 
#'        Attribute name to replace with new attributes derived from text in case text parsed
#'        successfully. 
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
DOM.setAttributesAsText <- function(promise, nodeId, text, name = NULL, awaitResult = TRUE) {
  method <- 'DOM.setAttributesAsText'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.setFileInputFiles
#' 
#' Sets files for the given file input element.
#' 
#' @param promise An asynchronous result.
#' @param files A list of string. 
#'        Array of file paths to set. 
#' @param nodeId Optional. A NodeId. 
#'        Identifier of the node. 
#' @param backendNodeId Optional. A BackendNodeId. 
#'        Identifier of the backend node. 
#' @param objectId Optional. A Runtime.RemoteObjectId. 
#'        JavaScript object id of the node wrapper. 
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
DOM.setFileInputFiles <- function(promise, files, nodeId = NULL, backendNodeId = NULL, objectId = NULL, awaitResult = TRUE) {
  method <- 'DOM.setFileInputFiles'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.setInspectedNode
#' 
#' Enables console to refer to the node with given id via $x (see Command Line API for more details
#'        $x functions).
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        DOM node id to be accessible by means of $x command line API. 
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
DOM.setInspectedNode <- function(promise, nodeId, awaitResult = TRUE) {
  method <- 'DOM.setInspectedNode'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.setNodeName
#' 
#' Sets node name for a node with given id.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        Id of the node to set name for. 
#' @param name A character string. 
#'        New node's name. 
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
DOM.setNodeName <- function(promise, nodeId, name, awaitResult = TRUE) {
  method <- 'DOM.setNodeName'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.setNodeValue
#' 
#' Sets node value for a node with given id.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        Id of the node to set value for. 
#' @param value A character string. 
#'        New node's value. 
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
DOM.setNodeValue <- function(promise, nodeId, value, awaitResult = TRUE) {
  method <- 'DOM.setNodeValue'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.setOuterHTML
#' 
#' Sets node HTML markup, returns new node id.
#' 
#' @param promise An asynchronous result.
#' @param nodeId A NodeId. 
#'        Id of the node to set markup for. 
#' @param outerHTML A character string. 
#'        Outer HTML markup to set. 
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
DOM.setOuterHTML <- function(promise, nodeId, outerHTML, awaitResult = TRUE) {
  method <- 'DOM.setOuterHTML'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.undo
#' 
#' Undoes the last performed action.
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
DOM.undo <- function(promise, awaitResult = TRUE) {
  method <- 'DOM.undo'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}


#' Send the command DOM.getFrameOwner
#' 
#' Returns iframe node that owns iframe with the given domain.
#' 
#' @param promise An asynchronous result.
#' @param frameId A Page.FrameId. 
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
DOM.getFrameOwner <- function(promise, frameId, awaitResult = TRUE) {
  method <- 'DOM.getFrameOwner'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params, awaitResult)
}
