# DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command Page.addScriptToEvaluateOnNewDocument
#'  
#' Evaluates given script in every frame upon creation (before loading frame's scripts).
#'  
#' @param promise An aynchronous result object.
#' @param source A character string. 
#' @param worldName Experimental. Optional. A character string. 
#'        If specified, creates an isolated world with the given name and evaluates given script in it.
#'        This world name will be used as the ExecutionContextDescription::name when the corresponding
#'        event is emitted. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Page.addScriptToEvaluateOnNewDocument <- function(promise, source, worldName = NULL) {
  method <- 'Page.addScriptToEvaluateOnNewDocument'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.bringToFront
#'  
#' Brings page to front (activates tab).
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.bringToFront <- function(promise) {
  method <- 'Page.bringToFront'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.captureScreenshot
#'  
#' Capture page screenshot.
#'  
#' @param promise An aynchronous result object.
#' @param format Optional. A character string. 
#'        Image compression format (defaults to png). Accepted values: jpeg, png.
#' @param quality Optional. An integer. 
#'        Compression quality from range [0..100] (jpeg only). 
#' @param clip Optional. A Viewport. 
#'        Capture the screenshot of a given region only. 
#' @param fromSurface Experimental. Optional. A logical. 
#'        Capture the screenshot from the surface, rather than the view. Defaults to true. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Page.captureScreenshot <- function(promise, format = NULL, quality = NULL, clip = NULL, fromSurface = NULL) {
  method <- 'Page.captureScreenshot'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.captureSnapshot
#'  
#' Returns a snapshot of the page as a string. For MHTML format, the serialization includes
#'        iframes, shadow DOM, external resources, and element-inline styles.
#'  
#' @param promise An aynchronous result object.
#' @param format Optional. A character string. 
#'        Format (defaults to mhtml). Accepted values: mhtml.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Page.captureSnapshot <- function(promise, format = NULL) {
  method <- 'Page.captureSnapshot'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.createIsolatedWorld
#'  
#' Creates an isolated world for the given frame.
#'  
#' @param promise An aynchronous result object.
#' @param frameId A FrameId. 
#'        Id of the frame in which the isolated world should be created. 
#' @param worldName Optional. A character string. 
#'        An optional name which is reported in the Execution Context. 
#' @param grantUniveralAccess Optional. A logical. 
#'        Whether or not universal access should be granted to the isolated world. This is a powerful
#'        option, use with caution. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Page.createIsolatedWorld <- function(promise, frameId, worldName = NULL, grantUniveralAccess = NULL) {
  method <- 'Page.createIsolatedWorld'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.disable
#'  
#' Disables page domain notifications.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.disable <- function(promise) {
  method <- 'Page.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.enable
#'  
#' Enables page domain notifications.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.enable <- function(promise) {
  method <- 'Page.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.getAppManifest
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 3.
#' @export
Page.getAppManifest <- function(promise) {
  method <- 'Page.getAppManifest'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.getFrameTree
#'  
#' Returns present frame tree structure.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Page.getFrameTree <- function(promise) {
  method <- 'Page.getFrameTree'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.getLayoutMetrics
#'  
#' Returns metrics relating to the layouting of the page, such as viewport bounds/scale.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 3.
#' @export
Page.getLayoutMetrics <- function(promise) {
  method <- 'Page.getLayoutMetrics'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.getNavigationHistory
#'  
#' Returns navigation history for the current page.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
Page.getNavigationHistory <- function(promise) {
  method <- 'Page.getNavigationHistory'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.getResourceContent
#'  
#' Returns content of the given resource.
#'  
#' @param promise An aynchronous result object.
#' @param frameId A FrameId. 
#'        Frame id to get resource for. 
#' @param url A character string. 
#'        URL of the resource to get content for. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
Page.getResourceContent <- function(promise, frameId, url) {
  method <- 'Page.getResourceContent'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.getResourceTree
#'  
#' Returns present frame / resource tree structure.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Page.getResourceTree <- function(promise) {
  method <- 'Page.getResourceTree'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.handleJavaScriptDialog
#'  
#' Accepts or dismisses a JavaScript initiated dialog (alert, confirm, prompt, or onbeforeunload).
#'  
#' @param promise An aynchronous result object.
#' @param accept A logical. 
#'        Whether to accept or dismiss the dialog. 
#' @param promptText Optional. A character string. 
#'        The text to enter into the dialog prompt before accepting. Used only if this is a prompt
#'        dialog. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.handleJavaScriptDialog <- function(promise, accept, promptText = NULL) {
  method <- 'Page.handleJavaScriptDialog'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.navigate
#'  
#' Navigates current page to the given URL.
#'  
#' @param promise An aynchronous result object.
#' @param url A character string. 
#'        URL to navigate the page to. 
#' @param referrer Optional. A character string. 
#'        Referrer URL. 
#' @param transitionType Optional. A TransitionType. 
#'        Intended transition type. 
#' @param frameId Optional. A FrameId. 
#'        Frame id to navigate, if not specified navigates the top frame. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 3.
#' @export
Page.navigate <- function(promise, url, referrer = NULL, transitionType = NULL, frameId = NULL) {
  method <- 'Page.navigate'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.navigateToHistoryEntry
#'  
#' Navigates current page to the given history entry.
#'  
#' @param promise An aynchronous result object.
#' @param entryId An integer. 
#'        Unique id of the entry to navigate to. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.navigateToHistoryEntry <- function(promise, entryId) {
  method <- 'Page.navigateToHistoryEntry'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.printToPDF
#'  
#' Print page as PDF.
#'  
#' @param promise An aynchronous result object.
#' @param landscape Optional. A logical. 
#'        Paper orientation. Defaults to false. 
#' @param displayHeaderFooter Optional. A logical. 
#'        Display header and footer. Defaults to false. 
#' @param printBackground Optional. A logical. 
#'        Print background graphics. Defaults to false. 
#' @param scale Optional. A numeric. 
#'        Scale of the webpage rendering. Defaults to 1. 
#' @param paperWidth Optional. A numeric. 
#'        Paper width in inches. Defaults to 8.5 inches. 
#' @param paperHeight Optional. A numeric. 
#'        Paper height in inches. Defaults to 11 inches. 
#' @param marginTop Optional. A numeric. 
#'        Top margin in inches. Defaults to 1cm (~0.4 inches). 
#' @param marginBottom Optional. A numeric. 
#'        Bottom margin in inches. Defaults to 1cm (~0.4 inches). 
#' @param marginLeft Optional. A numeric. 
#'        Left margin in inches. Defaults to 1cm (~0.4 inches). 
#' @param marginRight Optional. A numeric. 
#'        Right margin in inches. Defaults to 1cm (~0.4 inches). 
#' @param pageRanges Optional. A character string. 
#'        Paper ranges to print, e.g., '1-5, 8, 11-13'. Defaults to the empty string, which means
#'        print all pages. 
#' @param ignoreInvalidPageRanges Optional. A logical. 
#'        Whether to silently ignore invalid but successfully parsed page ranges, such as '3-2'.
#'        Defaults to false. 
#' @param headerTemplate Optional. A character string. 
#'        HTML template for the print header. Should be valid HTML markup with following
#'        classes used to inject printing values into them:
#'        - `date`: formatted print date
#'        - `title`: document title
#'        - `url`: document location
#'        - `pageNumber`: current page number
#'        - `totalPages`: total pages in the document
#'        
#'        For example, `<span class=title></span>` would generate span containing the title. 
#' @param footerTemplate Optional. A character string. 
#'        HTML template for the print footer. Should use the same format as the `headerTemplate`. 
#' @param preferCSSPageSize Optional. A logical. 
#'        Whether or not to prefer page size as defined by css. Defaults to false,
#'        in which case the content will be scaled to fit the paper size. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Page.printToPDF <- function(promise, landscape = NULL, displayHeaderFooter = NULL, printBackground = NULL, scale = NULL, paperWidth = NULL, paperHeight = NULL, marginTop = NULL, marginBottom = NULL, marginLeft = NULL, marginRight = NULL, pageRanges = NULL, ignoreInvalidPageRanges = NULL, headerTemplate = NULL, footerTemplate = NULL, preferCSSPageSize = NULL) {
  method <- 'Page.printToPDF'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.reload
#'  
#' Reloads given page optionally ignoring the cache.
#'  
#' @param promise An aynchronous result object.
#' @param ignoreCache Optional. A logical. 
#'        If true, browser cache is ignored (as if the user pressed Shift+refresh). 
#' @param scriptToEvaluateOnLoad Optional. A character string. 
#'        If set, the script will be injected into all frames of the inspected page after reload.
#'        Argument will be ignored if reloading dataURL origin. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.reload <- function(promise, ignoreCache = NULL, scriptToEvaluateOnLoad = NULL) {
  method <- 'Page.reload'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.removeScriptToEvaluateOnNewDocument
#'  
#' Removes given script from the list.
#'  
#' @param promise An aynchronous result object.
#' @param identifier A ScriptIdentifier. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.removeScriptToEvaluateOnNewDocument <- function(promise, identifier) {
  method <- 'Page.removeScriptToEvaluateOnNewDocument'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.requestAppBanner
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.requestAppBanner <- function(promise) {
  method <- 'Page.requestAppBanner'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.screencastFrameAck
#'  
#' Acknowledges that a screencast frame has been received by the frontend.
#'  
#' @param promise An aynchronous result object.
#' @param sessionId An integer. 
#'        Frame number. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.screencastFrameAck <- function(promise, sessionId) {
  method <- 'Page.screencastFrameAck'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.searchInResource
#'  
#' Searches for given string in resource content.
#'  
#' @param promise An aynchronous result object.
#' @param frameId A FrameId. 
#'        Frame id for resource to search in. 
#' @param url A character string. 
#'        URL of the resource to search in. 
#' @param query A character string. 
#'        String to search for. 
#' @param caseSensitive Optional. A logical. 
#'        If true, search is case sensitive. 
#' @param isRegex Optional. A logical. 
#'        If true, treats string parameter as regex. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
Page.searchInResource <- function(promise, frameId, url, query, caseSensitive = NULL, isRegex = NULL) {
  method <- 'Page.searchInResource'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.setAdBlockingEnabled
#'  
#' Enable Chrome's experimental ad filter on all sites.
#'  
#' @param promise An aynchronous result object.
#' @param enabled A logical. 
#'        Whether to block ads. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.setAdBlockingEnabled <- function(promise, enabled) {
  method <- 'Page.setAdBlockingEnabled'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.setBypassCSP
#'  
#' Enable page Content Security Policy by-passing.
#'  
#' @param promise An aynchronous result object.
#' @param enabled A logical. 
#'        Whether to bypass page CSP. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.setBypassCSP <- function(promise, enabled) {
  method <- 'Page.setBypassCSP'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.setFontFamilies
#'  
#' Set generic font families.
#'  
#' @param promise An aynchronous result object.
#' @param fontFamilies A FontFamilies. 
#'        Specifies font families to set. If a font family is not specified, it won't be changed. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.setFontFamilies <- function(promise, fontFamilies) {
  method <- 'Page.setFontFamilies'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.setFontSizes
#'  
#' Set default font sizes.
#'  
#' @param promise An aynchronous result object.
#' @param fontSizes A FontSizes. 
#'        Specifies font sizes to set. If a font size is not specified, it won't be changed. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.setFontSizes <- function(promise, fontSizes) {
  method <- 'Page.setFontSizes'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.setDocumentContent
#'  
#' Sets given markup as the document's HTML.
#'  
#' @param promise An aynchronous result object.
#' @param frameId A FrameId. 
#'        Frame id to set HTML for. 
#' @param html A character string. 
#'        HTML content to set. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.setDocumentContent <- function(promise, frameId, html) {
  method <- 'Page.setDocumentContent'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.setDownloadBehavior
#'  
#' Set the behavior when downloading a file.
#'  
#' @param promise An aynchronous result object.
#' @param behavior A character string. 
#'        Whether to allow all or deny all download requests, or use default Chrome behavior if
#'        available (otherwise deny). Accepted values: deny, allow, default.
#' @param downloadPath Optional. A character string. 
#'        The default path to save downloaded files to. This is requred if behavior is set to 'allow' 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.setDownloadBehavior <- function(promise, behavior, downloadPath = NULL) {
  method <- 'Page.setDownloadBehavior'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.setLifecycleEventsEnabled
#'  
#' Controls whether page will emit lifecycle events.
#'  
#' @param promise An aynchronous result object.
#' @param enabled A logical. 
#'        If true, starts emitting lifecycle events. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.setLifecycleEventsEnabled <- function(promise, enabled) {
  method <- 'Page.setLifecycleEventsEnabled'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.startScreencast
#'  
#' Starts sending each frame using the `screencastFrame` event.
#'  
#' @param promise An aynchronous result object.
#' @param format Optional. A character string. 
#'        Image compression format. Accepted values: jpeg, png.
#' @param quality Optional. An integer. 
#'        Compression quality from range [0..100]. 
#' @param maxWidth Optional. An integer. 
#'        Maximum screenshot width. 
#' @param maxHeight Optional. An integer. 
#'        Maximum screenshot height. 
#' @param everyNthFrame Optional. An integer. 
#'        Send every n-th frame. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.startScreencast <- function(promise, format = NULL, quality = NULL, maxWidth = NULL, maxHeight = NULL, everyNthFrame = NULL) {
  method <- 'Page.startScreencast'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.stopLoading
#'  
#' Force the page stop all navigations and pending resource fetches.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.stopLoading <- function(promise) {
  method <- 'Page.stopLoading'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.crash
#'  
#' Crashes renderer on the IO thread, generates minidumps.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.crash <- function(promise) {
  method <- 'Page.crash'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.close
#'  
#' Tries to close page, running its beforeunload hooks, if any.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.close <- function(promise) {
  method <- 'Page.close'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.setWebLifecycleState
#'  
#' Tries to update the web lifecycle state of the page.
#'        It will transition the page to the given state according to:
#'        https://github.com/WICG/web-lifecycle/
#'  
#' @param promise An aynchronous result object.
#' @param state A character string. 
#'        Target lifecycle state Accepted values: frozen, active.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.setWebLifecycleState <- function(promise, state) {
  method <- 'Page.setWebLifecycleState'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.stopScreencast
#'  
#' Stops sending each frame in the `screencastFrame`.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.stopScreencast <- function(promise) {
  method <- 'Page.stopScreencast'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.setProduceCompilationCache
#'  
#' Forces compilation cache to be generated for every subresource script.
#'  
#' @param promise An aynchronous result object.
#' @param enabled A logical. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.setProduceCompilationCache <- function(promise, enabled) {
  method <- 'Page.setProduceCompilationCache'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.addCompilationCache
#'  
#' Seeds compilation cache for given url. Compilation cache does not survive
#'        cross-process navigation.
#'  
#' @param promise An aynchronous result object.
#' @param url A character string. 
#' @param data A character string. 
#'        Base64-encoded data 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.addCompilationCache <- function(promise, url, data) {
  method <- 'Page.addCompilationCache'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.clearCompilationCache
#'  
#' Clears seeded compilation cache.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.clearCompilationCache <- function(promise) {
  method <- 'Page.clearCompilationCache'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command Page.generateTestReport
#'  
#' Generates a report for testing.
#'  
#' @param promise An aynchronous result object.
#' @param message A character string. 
#'        Message to be displayed in the report. 
#' @param group Optional. A character string. 
#'        Specifies the endpoint group to deliver the report to. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
Page.generateTestReport <- function(promise, message, group = NULL) {
  method <- 'Page.generateTestReport'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
