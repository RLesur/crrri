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
    .queues = list(),
    .queue_exists = function(eventName) {
      queue <- private$.queues[[eventName]]
      length(queue) > 0
    },
    .has_listeners = function(eventName) {
      self$listenerCount(eventName) > 0
    },
    .check_queue = function(eventName) {
      if (!private$.queue_exists(eventName)) {
        private$.queues[[eventName]] <- CallbacksQueue$new()
      }
    }
  ),
  public = list(
    emit = function(eventName, ...) {
      "!DEBUG emit: event '`eventName`'"
      if (private$.has_listeners(eventName)) {
        private$.queues[[eventName]]$invoke(
          ...,
          onError = function(e) self$emit("error", e)
        )
      } else {
        # throw error if no listener registered for 'error' event
        if (eventName == "error") {
          stop(...)
        }
      }
      invisible(self)
    },
    on = function(eventName, listener) {
      listener <- rlang::as_function(listener)
      "!DEBUG on: registering a listener on event '`eventName`'"
      private$.check_queue(eventName)
      "!DEBUG on: emit 'newListener' event on event '`eventName`'"
      self$emit("newListener", eventName, listener)
      private$.queues[[eventName]]$append(listener)
      invisible(self)
    },
    addListener = function(eventName, listener) {
      self$on(eventName, listener)
    },
    once = function(eventName, listener) {
      listener <- rlang::as_function(listener)
      "!DEBUG once: registering a listener on event '`eventName`' for once"
      private$.check_queue(eventName)
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
      self$emit("newListener", eventName, listener)
      remove_listener <- private$.queues[[eventName]]$append(new_listener)
      invisible(self)
    },
    listenerCount = function(eventName) {
      stopifnot(!missing(eventName))
      if (private$.queue_exists(eventName)) {
        private$.queues[[eventName]]$count()
      } else {
        0L
      }
    },
    eventNames = function() {
      queues_names <- names(private$.queues)
      Filter(private$.has_listeners, queues_names)
    },
    rawListeners = function(eventName) {
      stopifnot(!missing(eventName))
      if (private$.queue_exists(eventName)) {
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

# CallbacksQueue ----------------------------------------------------------
CallbacksQueue <- R6::R6Class(
  "CallbacksQueue",
  inherit = Queue,
  public = list(
    invoke = function(..., onError = stop) {
      callbacks <- super$get()
      for(callback in callbacks) {
        tryCatch(callback(...), error = function(e) onError(e))
      }
    }
  )
)

# Queue class -------------------------------------------------------------
Queue <- R6::R6Class(
  "Queue",
  private = list(
    .queue = list(),
    .wrap = function(element) {
      wrapper <- new.env(parent = emptyenv(), size = 1L)
      wrapper$element <- element
      wrapper
    },
    .rm_wrapper = function(wrapper) {
      element <- wrapper$element
      queue <- private$.queue
      # Since wrappers are environments, identical() will always send back at most one element.
      # This is the main trick.
      pos <- Position(function(x) identical(x, wrapper), queue)
      queue[pos] <- NULL
      private$.queue <- queue
      element
    }
  ),
  public = list(
    append = function(element) {
      wrapper <- private$.wrap(element)
      private$.queue <- c(private$.queue, list(wrapper))
      function() {private$.rm_wrapper(wrapper)}
    },
    prepend = function(element) {
      wrapper <- private$.wrap(element)
      private$.queue <- c(list(wrapper), private$.queue)
      function() {private$.rm_wrapper(wrapper)}
    },
    get = function() {
      lapply(private$.queue, function(w) get("element", pos = w))
    },
    remove_element = function(element, right = TRUE) {
      queue <- private$.queue
      pos <- Position(function(x) identical(x$element, element), queue, right = right)
      queue[pos] <- NULL
      private$.queue <- queue
      element
    },
    count = function() {
      length(private$.queue)
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
