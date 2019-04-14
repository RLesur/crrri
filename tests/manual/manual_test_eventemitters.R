myEmitter <- EventEmitter$new()
myEmitter$on("event",
             function() {
               message("an event occured!")
             }
)
myEmitter$emit("event")
# The listener is still called when "event" fires:
myEmitter$emit("event")
# A listener can be registered once:
myEmitter$once("event",
               function() {
                 message("this listener is called only once")
               }
)
# This new listener will be removed when called.
myEmitter$emit("event")
# There is now only one listener:
myEmitter$emit("event")

# An error in a listener will throw an error in R.
myEmitter$on("event", function(...) stop("An error in a listener"))
# Throw an error:
## Not run:
myEmitter$emit("event")
## End(Not run)

# You can catch an error with a special "error" event that is
# always emitted when an error occured in a listener:
myEmitter$on("error", function(e) cat(conditionMessage(e)))
myEmitter$emit("event")

# As in the node.js class, a "newListener" event is emitted
# before each new listener registration.
# The "newListener" event passes two arguments to its listener(s):
# `eventName` and `listener`.
myEmitter <- EventEmitter$new()
# Use once here to avoid infinite recursion:
myEmitter$once("newListener", function(eventName, listener) {
  if(eventName == "event") {
    myEmitter$on("event", function(...) cat("B"))
  }
})
myEmitter$on("event", function(...) cat("A"))
myEmitter$emit("event") # BA
# The listener attached to the "newListener" event has been
# unregistered and is no more called:
myEmitter$on("event", function(...) cat("C"))
myEmitter$emit("event") # BAC

# Get the number of listeners for an event:
myEmitter$listenerCount("event")

# Get the event names which have been registered:
myEmitter$eventNames()


# Once is use for any listener that should be activated only once
myEmitter <- EventEmitter$new()
myEmitter$once("a.listener", rlang::as_function(~ cat(.x)))
myEmitter$emit("a.listener", "A")
myEmitter$emit("a.listener", "B")
