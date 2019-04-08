#' R6 class to emit some event
#'
#' This is a general purpose class to build on. It is inspired by the node.js EventEmitter class.
#' See <https://nodejs.org/api/events.html>.
#'
#' @name EventEmitter
#' @examples
#' myEmitter <- EventEmitter$new()
#' myEmitter$on("event",
#'     function() {
#'         message("an event occured!")
#'     }
#' )
#' myEmitter$emit("event")
#' # The listener is still called when "event" fires:
#' myEmitter$emit("event")
#' # A listener can be registered once:
#' myEmitter$once("event",
#'     function() {
#'         message("this listener is called only once")
#'     }
#' )
#' # This new listener will be removed when called.
#' myEmitter$emit("event")
#' # There is now only one listener:
#' myEmitter$emit("event")
#'
#' # An error in a listener will throw an error in R.
#' myEmitter$on("event", function(...) stop("An error in a listener"))
#' # Throw an error:
#' \dontrun{
#'   myEmitter$emit("event")}
#'
#' # You can catch an error with a special "error" event that is
#' # always emitted when an error occured in a listener:
#' myEmitter$on("error", function(e) cat(conditionMessage(e)))
#' myEmitter$emit("event")
#'
#' # As in the node.js class, a "newListener" event is emitted
#' # before each new listener registration.
#' # The "newListener" event passes two arguments to its listener(s):
#' # `eventName` and `listener`.
#' myEmitter <- EventEmitter$new()
#' # Use once here to avoid infinite recursion:
#' myEmitter$once("newListener", function(eventName, listener) {
#'    if(eventName == "event") {
#'       myEmitter$on("event", function(...) cat("B"))
#'    }
#' })
#' myEmitter$on("event", function(...) cat("A"))
#' myEmitter$emit("event") # BA
#' # The listener attached to the "newListener" event has been
#' # unregistered and is no more called:
#' myEmitter$on("event", function(...) cat("C"))
#' myEmitter$emit("event") # BAC
#'
#' # Get the number of listeners for an event:
#' myEmitter$listenerCount("event")
#'
#' # Get the event names which have been registered:
#' myEmitter$eventNames()
NULL


#' @rdname EventEmitter
#' @export
EventEmitter <- R6::R6Class(
  "EventEmitter",
  private = list(
    .queues = list()
  ),
  public = list(
    emit = function(eventName, ...) {
      "!DEBUG emit: event '`eventName`'"
      queue <- private$.queues[[eventName]]
      queue_exists <- length(queue) > 0
      if (eventName == "error" && self$listenerCount("error") == 0) {
        # throw error if no listener registered for 'error' event
        stop(...)
      }
      if (queue_exists) {
        tryCatch(queue$invoke(...),
                error = function(e) self$emit("error", e)
        )
      }
      invisible(self)
    },
    on = function(eventName, listener) {
      "!DEBUG on: registering a listener on event '`eventName`'"
      queue <- private$.queues[[eventName]]
      queue_exists <- length(queue) > 0
      # if no event eventName has been registered
      if (!queue_exists) {
        private$.queues[[eventName]] <- Callbacks$new()
      }
      "!DEBUG on: emit 'newListener' event on event '`eventName`'"
      self$emit("newListener", eventName, listener)
      private$.queues[[eventName]]$register(listener)
      invisible(self)
    },
    addListener = function(eventName, listener) {
      self$on(eventName, listener)
    },
    once = function(eventName, listener) {
      "!DEBUG once: registering a listener on event '`eventName`' for once"
      queue <- private$.queues[[eventName]]
      queue_exists <- length(queue) > 0
      if (!queue_exists) {
        private$.queues[[eventName]] <- Callbacks$new()
      }
      remove_listener <- NULL
      new_listener <- once_function(function(...) {
        # unregister callback before calling
        "!DEBUG once: removing listener for event '`eventName`'"
        remove_listener()
        "!DEBUG once: emit removeListener event for '`eventName`'"
        self$emit("removeListener", eventName, listener)
        "!DEBUG once: call listener for event '`eventName`'"
        listener(...)
      })
      attr(new_listener, "listener") <- listener
      remove_listener <- private$.queues[[eventName]]$register(new_listener)
      invisible(self)
    },
    listenerCount = function(eventName) {
      stopifnot(!missing(eventName))
      queue <- private$.queues[[eventName]]
      queue_exists <- length(queue) > 0
      if (queue_exists) {
        queue$count()
      } else {
        0L
      }
    },
    eventNames = function() {
      # TODO remove .queues with length 0
      names(private$.queues)
    },
    rawListeners = function(eventName) {
      stopifnot(!missing(eventName))
      queue <- private$.queues[[eventName]]
      queue_exists <- length(queue) > 0
      if (queue_exists) {
        queue$get()
      } else {
        list()
      }
    },
    listeners = function(eventName) {
      stopifnot(!missing(eventName))
      rawListeners <- self$rawListeners(eventName)
      getListener <- function(rawListener) {
        if(inherits(rawListener, "once_function")) {
          return(attr(rawListener, "listener"))
        }
        rawListener
      }
      lapply(rawListeners, getListener)
    }
  )
)

# from rstudio/websocket
# https://github.com/rstudio/websocket/blob/master/R/websocket.R
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
      callbacks <- self$get()
      "!DEBUG invoke: callback = `length(callbacks)`"
      for (callback in callbacks) {
        callback(...)
      }
    },
    count = function() {
      length(ls(private$.callbacks))
    },
    get = function() {
      # Ensure that calls are invoked in the order that they were registered
      keys <- as.character(sort(as.integer(ls(private$.callbacks)), decreasing = TRUE))
      "!DEBUG get: keys = `keys`"
      mget(keys, private$.callbacks)
    }
  )
)

once_function <- function(fun) {
  done <- FALSE
  res <- function(...) {
    run <- !done
    done <<- TRUE
    if (run) fun(...)
  }
  class(res) <- c("once_function", "function")
  return(res)
}
