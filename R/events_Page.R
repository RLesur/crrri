# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Await the event Page.domContentEventFired or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param timestamp A Network.MonotonicTime. 
#'         Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"domContentEventFired"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `timestamp`.
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
Page.domContentEventFired <- function(promise, timestamp = NULL, .callback = NULL) {
  method <- 'Page.domContentEventFired'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.frameAttached or create a callback
#' 
#' **Event description**:  
#' Fired when frame has been attached to its parent.
#' 
#' @param promise An asynchronous result object.
#' @param frameId A FrameId. 
#'        Id of the frame that has been attached. Accepted values: `~ .res$frameId` (to refer to the previous result).
#' @param parentFrameId A FrameId. 
#'        Parent frame identifier. Accepted values: `~ .res$parentFrameId` (to refer to the previous result).
#' @param stack A Runtime.StackTrace. 
#'        JavaScript stack trace of when frame was attached, only set if frame initiated from script. Accepted values: `~ .res$stack` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"frameAttached"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `frameId`, `parentFrameId`, `stack` (optional) .
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
Page.frameAttached <- function(promise, frameId = NULL, parentFrameId = NULL, stack = NULL, .callback = NULL) {
  method <- 'Page.frameAttached'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.frameClearedScheduledNavigation or create a callback
#' 
#' **Event description**:  
#' Fired when frame no longer has a scheduled navigation.
#' 
#' @param promise An asynchronous result object.
#' @param frameId A FrameId. 
#'        Id of the frame that has cleared its scheduled navigation. Accepted values: `~ .res$frameId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"frameClearedScheduledNavigation"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `frameId`.
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
Page.frameClearedScheduledNavigation <- function(promise, frameId = NULL, .callback = NULL) {
  method <- 'Page.frameClearedScheduledNavigation'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.frameDetached or create a callback
#' 
#' **Event description**:  
#' Fired when frame has been detached from its parent.
#' 
#' @param promise An asynchronous result object.
#' @param frameId A FrameId. 
#'        Id of the frame that has been detached. Accepted values: `~ .res$frameId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"frameDetached"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `frameId`.
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
Page.frameDetached <- function(promise, frameId = NULL, .callback = NULL) {
  method <- 'Page.frameDetached'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.frameNavigated or create a callback
#' 
#' **Event description**:  
#' Fired once navigation of the frame has completed. Frame is now associated with the new loader.
#' 
#' @param promise An asynchronous result object.
#' @param frame A Frame. 
#'        Frame object. Accepted values: `~ .res$frame` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"frameNavigated"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `frame`.
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
Page.frameNavigated <- function(promise, frame = NULL, .callback = NULL) {
  method <- 'Page.frameNavigated'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.frameResized or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"frameResized"`)
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
Page.frameResized <- function(promise, .callback = NULL) {
  method <- 'Page.frameResized'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.frameScheduledNavigation or create a callback
#' 
#' **Event description**:  
#' Fired when frame schedules a potential navigation.
#' 
#' @param promise An asynchronous result object.
#' @param frameId A FrameId. 
#'        Id of the frame that has scheduled a navigation. Accepted values: `~ .res$frameId` (to refer to the previous result).
#' @param delay A numeric. 
#'        Delay (in seconds) until the navigation is scheduled to begin. The navigation is not
#'        guaranteed to start. Accepted values: `~ .res$delay` (to refer to the previous result).
#' @param reason A character string. 
#'        The reason for the navigation. Accepted values: `~ .res$reason` (to refer to the previous result), formSubmissionGet, formSubmissionPost, httpHeaderRefresh, scriptInitiated, metaTagRefresh, pageBlockInterstitial, reload.
#' @param url A character string. 
#'        The destination URL for the scheduled navigation. Accepted values: `~ .res$url` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"frameScheduledNavigation"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `frameId`, `delay`, `reason`, `url`.
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
Page.frameScheduledNavigation <- function(promise, frameId = NULL, delay = NULL, reason = NULL, url = NULL, .callback = NULL) {
  method <- 'Page.frameScheduledNavigation'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.frameStartedLoading or create a callback
#' 
#' **Event description**:  
#' Fired when frame has started loading.
#' 
#' @param promise An asynchronous result object.
#' @param frameId A FrameId. 
#'        Id of the frame that has started loading. Accepted values: `~ .res$frameId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"frameStartedLoading"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `frameId`.
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
Page.frameStartedLoading <- function(promise, frameId = NULL, .callback = NULL) {
  method <- 'Page.frameStartedLoading'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.frameStoppedLoading or create a callback
#' 
#' **Event description**:  
#' Fired when frame has stopped loading.
#' 
#' @param promise An asynchronous result object.
#' @param frameId A FrameId. 
#'        Id of the frame that has stopped loading. Accepted values: `~ .res$frameId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"frameStoppedLoading"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `frameId`.
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
Page.frameStoppedLoading <- function(promise, frameId = NULL, .callback = NULL) {
  method <- 'Page.frameStoppedLoading'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.interstitialHidden or create a callback
#' 
#' **Event description**:  
#' Fired when interstitial page was hidden
#' 
#' @param promise An asynchronous result object.
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"interstitialHidden"`)
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
Page.interstitialHidden <- function(promise, .callback = NULL) {
  method <- 'Page.interstitialHidden'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.interstitialShown or create a callback
#' 
#' **Event description**:  
#' Fired when interstitial page was shown
#' 
#' @param promise An asynchronous result object.
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"interstitialShown"`)
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
Page.interstitialShown <- function(promise, .callback = NULL) {
  method <- 'Page.interstitialShown'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.javascriptDialogClosed or create a callback
#' 
#' **Event description**:  
#' Fired when a JavaScript initiated dialog (alert, confirm, prompt, or onbeforeunload) has been
#'        closed.
#' 
#' @param promise An asynchronous result object.
#' @param result A logical. 
#'        Whether dialog was confirmed. Accepted values: `~ .res$result` (to refer to the previous result).
#' @param userInput A character string. 
#'        User input in case of prompt. Accepted values: `~ .res$userInput` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"javascriptDialogClosed"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `result`, `userInput`.
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
Page.javascriptDialogClosed <- function(promise, result = NULL, userInput = NULL, .callback = NULL) {
  method <- 'Page.javascriptDialogClosed'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.javascriptDialogOpening or create a callback
#' 
#' **Event description**:  
#' Fired when a JavaScript initiated dialog (alert, confirm, prompt, or onbeforeunload) is about to
#'        open.
#' 
#' @param promise An asynchronous result object.
#' @param url A character string. 
#'        Frame url. Accepted values: `~ .res$url` (to refer to the previous result).
#' @param message A character string. 
#'        Message that will be displayed by the dialog. Accepted values: `~ .res$message` (to refer to the previous result).
#' @param type A DialogType. 
#'        Dialog type. Accepted values: `~ .res$type` (to refer to the previous result).
#' @param hasBrowserHandler A logical. 
#'        True iff browser is capable showing or acting on the given dialog. When browser has no
#'        dialog handler for given target, calling alert while Page domain is engaged will stall
#'        the page execution. Execution can be resumed via calling Page.handleJavaScriptDialog. Accepted values: `~ .res$hasBrowserHandler` (to refer to the previous result).
#' @param defaultPrompt A character string. 
#'        Default dialog prompt. Accepted values: `~ .res$defaultPrompt` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"javascriptDialogOpening"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `url`, `message`, `type`, `hasBrowserHandler`, `defaultPrompt` (optional) .
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
Page.javascriptDialogOpening <- function(promise, url = NULL, message = NULL, type = NULL, hasBrowserHandler = NULL, defaultPrompt = NULL, .callback = NULL) {
  method <- 'Page.javascriptDialogOpening'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.lifecycleEvent or create a callback
#' 
#' **Event description**:  
#' Fired for top level page lifecycle events such as navigation, load, paint, etc.
#' 
#' @param promise An asynchronous result object.
#' @param frameId A FrameId. 
#'        Id of the frame. Accepted values: `~ .res$frameId` (to refer to the previous result).
#' @param loaderId A Network.LoaderId. 
#'        Loader identifier. Empty string if the request is fetched from worker. Accepted values: `~ .res$loaderId` (to refer to the previous result).
#' @param name A character string. 
#'         Accepted values: `~ .res$name` (to refer to the previous result).
#' @param timestamp A Network.MonotonicTime. 
#'         Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"lifecycleEvent"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `frameId`, `loaderId`, `name`, `timestamp`.
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
Page.lifecycleEvent <- function(promise, frameId = NULL, loaderId = NULL, name = NULL, timestamp = NULL, .callback = NULL) {
  method <- 'Page.lifecycleEvent'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.loadEventFired or create a callback
#' 
#' **Event description**:  
#' 
#' 
#' @param promise An asynchronous result object.
#' @param timestamp A Network.MonotonicTime. 
#'         Accepted values: `~ .res$timestamp` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"loadEventFired"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `timestamp`.
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
Page.loadEventFired <- function(promise, timestamp = NULL, .callback = NULL) {
  method <- 'Page.loadEventFired'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.navigatedWithinDocument or create a callback
#' 
#' **Event description**:  
#' Fired when same-document navigation happens, e.g. due to history API usage or anchor navigation.
#' 
#' @param promise An asynchronous result object.
#' @param frameId A FrameId. 
#'        Id of the frame. Accepted values: `~ .res$frameId` (to refer to the previous result).
#' @param url A character string. 
#'        Frame's new url. Accepted values: `~ .res$url` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"navigatedWithinDocument"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `frameId`, `url`.
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
Page.navigatedWithinDocument <- function(promise, frameId = NULL, url = NULL, .callback = NULL) {
  method <- 'Page.navigatedWithinDocument'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.screencastFrame or create a callback
#' 
#' **Event description**:  
#' Compressed image data requested by the `startScreencast`.
#' 
#' @param promise An asynchronous result object.
#' @param data A character string. 
#'        Base64-encoded compressed image. Accepted values: `~ .res$data` (to refer to the previous result).
#' @param metadata A ScreencastFrameMetadata. 
#'        Screencast frame metadata. Accepted values: `~ .res$metadata` (to refer to the previous result).
#' @param sessionId An integer. 
#'        Frame number. Accepted values: `~ .res$sessionId` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"screencastFrame"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `data`, `metadata`, `sessionId`.
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
Page.screencastFrame <- function(promise, data = NULL, metadata = NULL, sessionId = NULL, .callback = NULL) {
  method <- 'Page.screencastFrame'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.screencastVisibilityChanged or create a callback
#' 
#' **Event description**:  
#' Fired when the page with currently enabled screencast was shown or hidden `.
#' 
#' @param promise An asynchronous result object.
#' @param visible A logical. 
#'        True if the page is visible. Accepted values: `~ .res$visible` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"screencastVisibilityChanged"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `visible`.
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
Page.screencastVisibilityChanged <- function(promise, visible = NULL, .callback = NULL) {
  method <- 'Page.screencastVisibilityChanged'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.windowOpen or create a callback
#' 
#' **Event description**:  
#' Fired when a new window is going to be opened, via window.open(), link click, form submission,
#'        etc.
#' 
#' @param promise An asynchronous result object.
#' @param url A character string. 
#'        The URL for the new window. Accepted values: `~ .res$url` (to refer to the previous result).
#' @param windowName A character string. 
#'        Window name. Accepted values: `~ .res$windowName` (to refer to the previous result).
#' @param windowFeatures A list of string. 
#'        An array of enabled window features. Accepted values: `~ .res$windowFeatures` (to refer to the previous result).
#' @param userGesture A logical. 
#'        Whether or not it was triggered by user gesture. Accepted values: `~ .res$userGesture` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"windowOpen"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `url`, `windowName`, `windowFeatures`, `userGesture`.
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
Page.windowOpen <- function(promise, url = NULL, windowName = NULL, windowFeatures = NULL, userGesture = NULL, .callback = NULL) {
  method <- 'Page.windowOpen'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}


#' Await the event Page.compilationCacheProduced or create a callback
#' 
#' **Event description**:  
#' Issued for every compilation cache generated. Is only available
#'        if Page.setGenerateCompilationCache is enabled.
#' 
#' @param promise An asynchronous result object.
#' @param url A character string. 
#'         Accepted values: `~ .res$url` (to refer to the previous result).
#' @param data A character string. 
#'        Base64-encoded data Accepted values: `~ .res$data` (to refer to the previous result).
#' @param .callback A callback function taking one argument. The object passed to
#'        this function is the message received from Chrome: this is a named list
#'        with an element `method` (that is equal to `"compilationCacheProduced"`)
#'        and an element `params` which is a named list.
#'        The `params` list is composed of
#'        the following element(s): `url`, `data`.
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
Page.compilationCacheProduced <- function(promise, url = NULL, data = NULL, .callback = NULL) {
  method <- 'Page.compilationCacheProduced'
  args <- utils::head(rlang::fn_fmls_names(), -1)
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  listen(promise, method, params, .callback)
}
