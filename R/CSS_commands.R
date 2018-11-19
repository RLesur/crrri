#' DO NOT EDIT BY HAND
#' @include send.R
NULL

#' Send the command CSS.addRule
#'  
#' Inserts a new rule with the given `ruleText` in a stylesheet with given `styleSheetId`, at the
#'        position specified by `location`.
#'  
#' @param promise An aynchronous result object.
#' @param styleSheetId A StyleSheetId. 
#'        The css style sheet identifier where a new rule should be inserted. 
#' @param ruleText A character string. 
#'        The text of a new rule. 
#' @param location A SourceRange. 
#'        Text position of a new rule in the target style sheet. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CSS.addRule <- function(promise, styleSheetId, ruleText, location) {
  method <- 'CSS.addRule'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.collectClassNames
#'  
#' Returns all class names from specified stylesheet.
#'  
#' @param promise An aynchronous result object.
#' @param styleSheetId A StyleSheetId. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CSS.collectClassNames <- function(promise, styleSheetId) {
  method <- 'CSS.collectClassNames'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.createStyleSheet
#'  
#' Creates a new special "via-inspector" stylesheet in the frame with given `frameId`.
#'  
#' @param promise An aynchronous result object.
#' @param frameId A Page.FrameId. 
#'        Identifier of the frame where "via-inspector" stylesheet should be created. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CSS.createStyleSheet <- function(promise, frameId) {
  method <- 'CSS.createStyleSheet'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.disable
#'  
#' Disables the CSS agent for the given page.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
CSS.disable <- function(promise) {
  method <- 'CSS.disable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.enable
#'  
#' Enables the CSS agent for the given page. Clients should not assume that the CSS agent has been
#'        enabled until the result of this command is received.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
CSS.enable <- function(promise) {
  method <- 'CSS.enable'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.forcePseudoState
#'  
#' Ensures that the given node will have specified pseudo-classes whenever its style is computed by
#'        the browser.
#'  
#' @param promise An aynchronous result object.
#' @param nodeId A DOM.NodeId. 
#'        The element id for which to force the pseudo state. 
#' @param forcedPseudoClasses A list of string. 
#'        Element pseudo classes to force when computing the element's style. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
CSS.forcePseudoState <- function(promise, nodeId, forcedPseudoClasses) {
  method <- 'CSS.forcePseudoState'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.getBackgroundColors
#'  
#' 
#'  
#' @param promise An aynchronous result object.
#' @param nodeId A DOM.NodeId. 
#'        Id of the node to get background colors for. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 4.
#' @export
CSS.getBackgroundColors <- function(promise, nodeId) {
  method <- 'CSS.getBackgroundColors'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.getComputedStyleForNode
#'  
#' Returns the computed style for a DOM node identified by `nodeId`.
#'  
#' @param promise An aynchronous result object.
#' @param nodeId A DOM.NodeId. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CSS.getComputedStyleForNode <- function(promise, nodeId) {
  method <- 'CSS.getComputedStyleForNode'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.getInlineStylesForNode
#'  
#' Returns the styles defined inline (explicitly in the "style" attribute and implicitly, using DOM
#'        attributes) for a DOM node identified by `nodeId`.
#'  
#' @param promise An aynchronous result object.
#' @param nodeId A DOM.NodeId. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 2.
#' @export
CSS.getInlineStylesForNode <- function(promise, nodeId) {
  method <- 'CSS.getInlineStylesForNode'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.getMatchedStylesForNode
#'  
#' Returns requested styles for a DOM node identified by `nodeId`.
#'  
#' @param promise An aynchronous result object.
#' @param nodeId A DOM.NodeId. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 6.
#' @export
CSS.getMatchedStylesForNode <- function(promise, nodeId) {
  method <- 'CSS.getMatchedStylesForNode'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.getMediaQueries
#'  
#' Returns all media queries parsed by the rendering engine.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CSS.getMediaQueries <- function(promise) {
  method <- 'CSS.getMediaQueries'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.getPlatformFontsForNode
#'  
#' Requests information about platform fonts which we used to render child TextNodes in the given
#'        node.
#'  
#' @param promise An aynchronous result object.
#' @param nodeId A DOM.NodeId. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CSS.getPlatformFontsForNode <- function(promise, nodeId) {
  method <- 'CSS.getPlatformFontsForNode'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.getStyleSheetText
#'  
#' Returns the current textual content for a stylesheet.
#'  
#' @param promise An aynchronous result object.
#' @param styleSheetId A StyleSheetId. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CSS.getStyleSheetText <- function(promise, styleSheetId) {
  method <- 'CSS.getStyleSheetText'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.setEffectivePropertyValueForNode
#'  
#' Find a rule with the given active property for the given node and set the new value for this
#'        property
#'  
#' @param promise An aynchronous result object.
#' @param nodeId A DOM.NodeId. 
#'        The element id for which to set property. 
#' @param propertyName A character string. 
#' @param value A character string. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
CSS.setEffectivePropertyValueForNode <- function(promise, nodeId, propertyName, value) {
  method <- 'CSS.setEffectivePropertyValueForNode'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.setKeyframeKey
#'  
#' Modifies the keyframe rule key text.
#'  
#' @param promise An aynchronous result object.
#' @param styleSheetId A StyleSheetId. 
#' @param range A SourceRange. 
#' @param keyText A character string. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CSS.setKeyframeKey <- function(promise, styleSheetId, range, keyText) {
  method <- 'CSS.setKeyframeKey'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.setMediaText
#'  
#' Modifies the rule selector.
#'  
#' @param promise An aynchronous result object.
#' @param styleSheetId A StyleSheetId. 
#' @param range A SourceRange. 
#' @param text A character string. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CSS.setMediaText <- function(promise, styleSheetId, range, text) {
  method <- 'CSS.setMediaText'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.setRuleSelector
#'  
#' Modifies the rule selector.
#'  
#' @param promise An aynchronous result object.
#' @param styleSheetId A StyleSheetId. 
#' @param range A SourceRange. 
#' @param selector A character string. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CSS.setRuleSelector <- function(promise, styleSheetId, range, selector) {
  method <- 'CSS.setRuleSelector'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.setStyleSheetText
#'  
#' Sets the new stylesheet text.
#'  
#' @param promise An aynchronous result object.
#' @param styleSheetId A StyleSheetId. 
#' @param text A character string. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CSS.setStyleSheetText <- function(promise, styleSheetId, text) {
  method <- 'CSS.setStyleSheetText'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.setStyleTexts
#'  
#' Applies specified style edits one after another in the given order.
#'  
#' @param promise An aynchronous result object.
#' @param edits A list of StyleDeclarationEdit. 
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CSS.setStyleTexts <- function(promise, edits) {
  method <- 'CSS.setStyleTexts'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.startRuleUsageTracking
#'  
#' Enables the selector recording.
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 0.
#' @export
CSS.startRuleUsageTracking <- function(promise) {
  method <- 'CSS.startRuleUsageTracking'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.stopRuleUsageTracking
#'  
#' Stop tracking rule usage and return the list of rules that were used since last call to
#'        `takeCoverageDelta` (or since start of coverage instrumentation)
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CSS.stopRuleUsageTracking <- function(promise) {
  method <- 'CSS.stopRuleUsageTracking'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}


#' Send the command CSS.takeCoverageDelta
#'  
#' Obtain list of rules that became used since last call to this method (or since start of coverage
#'        instrumentation)
#'  
#' @param promise An aynchronous result object.
#'  
#' @return A promise (following the definition of the promises package).
#'         The value of the fulfilled promise is a named list of length 1.
#' @export
CSS.takeCoverageDelta <- function(promise) {
  method <- 'CSS.takeCoverageDelta'
  args <- rlang::fn_fmls_names()
  args <- args[!sapply(mget(args), is.null)]
  params <- mget(args)
  names(params) <- args
  params <- if (length(params) > 1) params[2:length(params)] else NULL
  send(promise, method, params)
}
