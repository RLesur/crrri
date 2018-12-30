myEmitter <- EventEmitter$new()
myEmitter$on('event',
    function() {
        message("an event occured")
    }
)
myEmitter$emit('event')
# Listener is still listening
myEmitter$emit('event')
myEmitter$once('uniqueevent',
    function() {
        message("an event occured - only once")
    }
)
# the listerner will be removed after first emission of the event
myEmitter$emit('uniqueevent')
# nothing happens as there is no more listener
myEmitter$emit('uniqueevent')

# an error in one listener will throws an error in R
myEmitter$on("eventwitherror", function(...) stop("An error in an event"))
# throws an error
myEmitter$emit("eventwitherror")
# you can catch an error with a special "error" event that always
# be emits when an error occured inside an eventEmitters
myEmitter$on("error", function(e) cat(conditionMessage(e)))
myEmitter$emit("eventwitherror")

# As in node.js class, a newListener event is emitted before each new event registration.
# newListener expect a function with eventName and callback argument
myEmitter <- EventEmitter$new()
# use once here to avoir infinite recursion
myEmitter$once("newListener", function(eventName, callback) {
   if(eventName == "event") {
      myEmitter$on("event", function(...) cat("B"))
   }
})
myEmitter$on("event", function(...) cat("A"))
myEmitter$emit("event") # BA
# newListener has been unregistered and is no more called
myEmitter$on("event", function(...) cat("C"))
myEmitter$emit("event") # BAC

# get the number of listeners for an event
myEmitter$listenerCount('event')

# get the event names which have been registered
myEmitter$eventNames()


# Once is use for any listener that should be activated only once
myEmitter <- EventEmitter$new()
myEmitter$once("a.listener", ~ cat(.x))
myEmitter$emit("a.listener", "A")
myEmitter$emit("a.listener", "B")
