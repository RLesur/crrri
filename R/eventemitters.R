#' R6 class to emit some event
#'
#' This is a general purpose class to build on. It is inspired by node.js EventEmitter class.
#' See https://nodejs.org/api/events.html
#'
#' @name EventEmitter
#' @example
#' \dontrun{
#' myEmitter <- EventEmitter$new()
#' myEmitter$on('event',
#'     function() {
#'         message("an event occured")
#'     }
#' )
#' myEmitter$emit('event')
#' # Listener is still listening
#' myEmitter$emit('event')
#' myEmitter$once('uniqueevent',
#'     function() {
#'         message("an event occured - only once")
#'     }
#' )
#' # the listerner will be removed after first emission of the event
#' myEmitter$emit('uniqueevent')
#' # nothing happens as there is no more listener
#' myEmitter$emit('uniqueevent')
#' }
#'
#' # an error in one listener will throws an error in R
#' myEmitter$on("eventwitherror", function(...) stop("An error in an event"))
#' # throws an error
#' myEmitter$emit("eventwitherror")
#' # you can catch an error with a special "error" event that always
#' # be emits when an error occured inside an eventEmitters
#' myEmitter$on("error", function(e) cat("an error occured:\n", e, "\n"))
#' myEmitter$emit("eventwitherror")
#'
#' # As in node.js class, a newListener event is emitted before each new event registration.
#' # newListener expect a function with eventName and callback argument
#' myEmitter <- EventEmitter$new()
#' # use once here to avoir infinite recursion#'
#' myEmitter$once("newListener", function(eventName, callback) {
#'    if(eventName == "event") {
#'       myEmitter$on("event", function(...) cat("B"))
#'    }
#' })
#' myEmitter$on("event", function(...) cat("A"))
#' myEmitter$emit("event") # BA
#' # newListener has been unregistered and is no more called
#' myEmitter$on("event", function(...) cat("C"))
#' myEmitter$emit("event") # BAC
NULL


#' @rdname EventEmitter
#' @export
EventEmitter <- R6::R6Class(
  "EventEmitter",
  private = list(
    callbacks = list()
  ),
  public = list(
    emit = function(eventName, ...) {
      "!DEBUG emit: emits event `eventName`"
      callbacks <- private$callbacks[[eventName]]
      "!DEBUG emit: number of callbacks : `length(callbacks)`"
      if (eventName == "error" && length(callbacks) == 0) {
        stop(...)
      }
      if (length(callbacks) > 0) {
        tryCatch(callbacks$invoke(...),
          error = function(e) self$emit("error", e)
        )
      } else {
        invisible(NULL)
      }
    },
    on = function(eventName, callback) {
      "!DEBUG on: register event `eventName`"
      callbacks <- private$callbacks[[eventName]]
      if (length(callbacks) == 0) {
        private$callbacks[[eventName]] <- Callbacks$new()
      }
      "!DEBUG on: emit newListener for event `eventName`"
      self$emit("newListener", eventName, callback)
      private$callbacks[[eventName]]$register(callback)
      invisible(self)
    },
    once = function(eventName, callback) {
      "!DEBUG once: register event `eventName` for one emission only "
      callbacks <- private$callbacks[[eventName]]
      if (length(callbacks) == 0) {
        private$callbacks[[eventName]] <- Callbacks$new()
      }
      remove_callback <- NULL
      new_callback <- function(...) {
        # unregister callback before calling
        "!DEBUG once: unregister callback for event `eventName`"
        remove_callback()
        "!DEBUG once: emits removeListener for `eventName`"
        self$emit("removeListener", eventName, callback)
        "!DEBUG once: call listener for event `eventName`"
        callback(...)
      }
      remove_callback <- private$callbacks[[eventName]]$register(new_callback)
    },
    listenerCount = function(eventName) {
      length(private$callbacks[[eventName]])
    }
  )
)

# from rstudio/websocket
# https://github.com/rstudio/websocket/blame/master/R/websocket.R
Callbacks <- R6::R6Class(
  "Callbacks",
  private = list(
    .nextId = integer(0),
    .callbacks = "environment"
  ),
  public = list(
    initialize = function() {
      # NOTE: we avoid using '.Machine$integer.max' directly
      # as R 3.3.0's 'radixsort' could segfault when sorting
      # an integer vector containing this value
      private$.nextId <- as.integer(.Machine$integer.max - 1L)
      private$.callbacks <- new.env(parent = emptyenv())
    },
    register = function(callback) {
      if (!is.function(callback)) {
        stop("callback must be a function")
      }
      id <- as.character(private$.nextId)
      private$.nextId <- private$.nextId - 1L
      private$.callbacks[[id]] <- callback
      return(function() {
        rm(list = id, pos = private$.callbacks)
      })
    },
    invoke = function(...) {
      # Ensure that calls are invoked in the order that they were registered
      keys <- as.character(sort(as.integer(ls(private$.callbacks)), decreasing = TRUE))
      callbacks <- mget(keys, private$.callbacks)

      for (callback in callbacks) {
        callback(...)
      }
    },
    count = function() {
      length(ls(private$.callbacks))
    }
  )
)
