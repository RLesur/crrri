# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event DOM.attributeModified or create a callback
#' 
#' **Event description**:  
#' Fired when `Element`'s attribute is modified.
#' 
#' @param promise An asynchronous result object.
#' @param nodeId A NodeId. 
#'        Id of the node that has changed. Accepted values: `~ .res$nodeId` (to refer to the previous result).
#' @param name A character string. 
#'        Attribute name. Accepted values: `~ .res$name` (to refer to the previous result).
#' @param value A character string. 
#'        Attribute value. Accepted values: `~ .res$value` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"attributeModified"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `nodeId`, `name`, `value`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
DOM.attributeModified <- function(promise, nodeId = NULL, name = NULL, value = NULL, .callback = NULL) {
  method <- 'DOM.attributeModified'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOM.attributeRemoved or create a callback
#' 
#' **Event description**:  
#' Fired when `Element`'s attribute is removed.
#' 
#' @param promise An asynchronous result object.
#' @param nodeId A NodeId. 
#'        Id of the node that has changed. Accepted values: `~ .res$nodeId` (to refer to the previous result).
#' @param name A character string. 
#'        A ttribute name. Accepted values: `~ .res$name` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"attributeRemoved"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `nodeId`, `name`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
DOM.attributeRemoved <- function(promise, nodeId = NULL, name = NULL, .callback = NULL) {
  method <- 'DOM.attributeRemoved'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOM.characterDataModified or create a callback
#' 
#' **Event description**:  
#' Mirrors `DOMCharacterDataModified` event.
#' 
#' @param promise An asynchronous result object.
#' @param nodeId A NodeId. 
#'        Id of the node that has changed. Accepted values: `~ .res$nodeId` (to refer to the previous result).
#' @param characterData A character string. 
#'        New text value. Accepted values: `~ .res$characterData` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"characterDataModified"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `nodeId`, `characterData`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
DOM.characterDataModified <- function(promise, nodeId = NULL, characterData = NULL, .callback = NULL) {
  method <- 'DOM.characterDataModified'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOM.childNodeCountUpdated or create a callback
#' 
#' **Event description**:  
#' Fired when `Container`'s child node count has changed.
#' 
#' @param promise An asynchronous result object.
#' @param nodeId A NodeId. 
#'        Id of the node that has changed. Accepted values: `~ .res$nodeId` (to refer to the previous result).
#' @param childNodeCount An integer. 
#'        New node count. Accepted values: `~ .res$childNodeCount` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"childNodeCountUpdated"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `nodeId`, `childNodeCount`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
DOM.childNodeCountUpdated <- function(promise, nodeId = NULL, childNodeCount = NULL, .callback = NULL) {
  method <- 'DOM.childNodeCountUpdated'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOM.childNodeInserted or create a callback
#' 
#' **Event description**:  
#' Mirrors `DOMNodeInserted` event.
#' 
#' @param promise An asynchronous result object.
#' @param parentNodeId A NodeId. 
#'        Id of the node that has changed. Accepted values: `~ .res$parentNodeId` (to refer to the previous result).
#' @param previousNodeId A NodeId. 
#'        If of the previous siblint. Accepted values: `~ .res$previousNodeId` (to refer to the previous result).
#' @param node A Node. 
#'        Inserted node data. Accepted values: `~ .res$node` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"childNodeInserted"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `parentNodeId`, `previousNodeId`, `node`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
DOM.childNodeInserted <- function(promise, parentNodeId = NULL, previousNodeId = NULL, node = NULL, .callback = NULL) {
  method <- 'DOM.childNodeInserted'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOM.childNodeRemoved or create a callback
#' 
#' **Event description**:  
#' Mirrors `DOMNodeRemoved` event.
#' 
#' @param promise An asynchronous result object.
#' @param parentNodeId A NodeId. 
#'        Parent id. Accepted values: `~ .res$parentNodeId` (to refer to the previous result).
#' @param nodeId A NodeId. 
#'        Id of the node that has been removed. Accepted values: `~ .res$nodeId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"childNodeRemoved"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `parentNodeId`, `nodeId`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
DOM.childNodeRemoved <- function(promise, parentNodeId = NULL, nodeId = NULL, .callback = NULL) {
  method <- 'DOM.childNodeRemoved'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOM.distributedNodesUpdated or create a callback
#' 
#' **Event description**:  
#' Called when distrubution is changed.
#' 
#' @param promise An asynchronous result object.
#' @param insertionPointId A NodeId. 
#'        Insertion point where distrubuted nodes were updated. Accepted values: `~ .res$insertionPointId` (to refer to the previous result).
#' @param distributedNodes A list of BackendNode. 
#'        Distributed nodes for given insertion point. Accepted values: `~ .res$distributedNodes` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"distributedNodesUpdated"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `insertionPointId`, `distributedNodes`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
DOM.distributedNodesUpdated <- function(promise, insertionPointId = NULL, distributedNodes = NULL, .callback = NULL) {
  method <- 'DOM.distributedNodesUpdated'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOM.documentUpdated or create a callback
#' 
#' **Event description**:  
#' Fired when `Document` has been totally updated. Node ids are no longer valid.
#' 
#' @param promise An asynchronous result object.
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"documentUpdated"`)
#'        and an element `params` which is a named list.
#'        For this event, `params` is void.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
DOM.documentUpdated <- function(promise, .callback = NULL) {
  method <- 'DOM.documentUpdated'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOM.inlineStyleInvalidated or create a callback
#' 
#' **Event description**:  
#' Fired when `Element`'s inline style is modified via a CSS property modification.
#' 
#' @param promise An asynchronous result object.
#' @param nodeIds A list of NodeId. 
#'        Ids of the nodes for which the inline styles have been invalidated. Accepted values: `~ .res$nodeIds` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"inlineStyleInvalidated"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `nodeIds`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
DOM.inlineStyleInvalidated <- function(promise, nodeIds = NULL, .callback = NULL) {
  method <- 'DOM.inlineStyleInvalidated'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOM.pseudoElementAdded or create a callback
#' 
#' **Event description**:  
#' Called when a pseudo element is added to an element.
#' 
#' @param promise An asynchronous result object.
#' @param parentId A NodeId. 
#'        Pseudo element's parent element id. Accepted values: `~ .res$parentId` (to refer to the previous result).
#' @param pseudoElement A Node. 
#'        The added pseudo element. Accepted values: `~ .res$pseudoElement` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"pseudoElementAdded"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `parentId`, `pseudoElement`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
DOM.pseudoElementAdded <- function(promise, parentId = NULL, pseudoElement = NULL, .callback = NULL) {
  method <- 'DOM.pseudoElementAdded'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOM.pseudoElementRemoved or create a callback
#' 
#' **Event description**:  
#' Called when a pseudo element is removed from an element.
#' 
#' @param promise An asynchronous result object.
#' @param parentId A NodeId. 
#'        Pseudo element's parent element id. Accepted values: `~ .res$parentId` (to refer to the previous result).
#' @param pseudoElementId A NodeId. 
#'        The removed pseudo element id. Accepted values: `~ .res$pseudoElementId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"pseudoElementRemoved"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `parentId`, `pseudoElementId`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
DOM.pseudoElementRemoved <- function(promise, parentId = NULL, pseudoElementId = NULL, .callback = NULL) {
  method <- 'DOM.pseudoElementRemoved'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOM.setChildNodes or create a callback
#' 
#' **Event description**:  
#' Fired when backend wants to provide client with the missing DOM structure. This happens upon
#'        most of the calls requesting node ids.
#' 
#' @param promise An asynchronous result object.
#' @param parentId A NodeId. 
#'        Parent node id to populate with children. Accepted values: `~ .res$parentId` (to refer to the previous result).
#' @param nodes A list of Node. 
#'        Child nodes array. Accepted values: `~ .res$nodes` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"setChildNodes"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `parentId`, `nodes`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
DOM.setChildNodes <- function(promise, parentId = NULL, nodes = NULL, .callback = NULL) {
  method <- 'DOM.setChildNodes'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOM.shadowRootPopped or create a callback
#' 
#' **Event description**:  
#' Called when shadow root is popped from the element.
#' 
#' @param promise An asynchronous result object.
#' @param hostId A NodeId. 
#'        Host element id. Accepted values: `~ .res$hostId` (to refer to the previous result).
#' @param rootId A NodeId. 
#'        Shadow root id. Accepted values: `~ .res$rootId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"shadowRootPopped"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `hostId`, `rootId`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
DOM.shadowRootPopped <- function(promise, hostId = NULL, rootId = NULL, .callback = NULL) {
  method <- 'DOM.shadowRootPopped'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event DOM.shadowRootPushed or create a callback
#' 
#' **Event description**:  
#' Called when shadow root is pushed into the element.
#' 
#' @param promise An asynchronous result object.
#' @param hostId A NodeId. 
#'        Host element id. Accepted values: `~ .res$hostId` (to refer to the previous result).
#' @param root A Node. 
#'        Shadow root. Accepted values: `~ .res$root` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"shadowRootPushed"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `hostId`, `root`.
#' 
#' @return An async value of class `promise`.
#'         The value and the completion of the promise differ according to the use of a callback function.
#'         When `.callback` is `NULL`, the promise is fulfilled when the event is received.
#'         Its value is a named list of two elements: `ws` (the websocket connexion) and `result`.
#'         `result` is a named list: its elements are the parameters sended by Chrome. 
#'         You can chain this promise with another command or event listener.
#'         When `.callback` is not `NULL`, the promise is fulfilled as soon as the callback is created; the value
#'         is a function without any argument that can be called to cancel the callback. When you use the
#'         `.callback` argument, you cannot send the result to any other command or event listener.
#' @export
DOM.shadowRootPushed <- function(promise, hostId = NULL, root = NULL, .callback = NULL) {
  method <- 'DOM.shadowRootPushed'
  args <- head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
