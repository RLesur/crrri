context("test-EventEmitter")

test_that("register with on() and emit an event", {
  myEmitter <- EventEmitter$new()
  myEmitter$on("event",
               function() {
                 message("an event occured!")
               }
  )
  expect_message(myEmitter$emit("event"), "an event occured!")
})

test_that("register with on() and emit an events twice", {
  myEmitter <- EventEmitter$new()
  myEmitter$on("event",
               function() {
                 message("an event occured!")
               }
  )
  expect_message(myEmitter$emit("event"), "an event occured!")
  expect_message(myEmitter$emit("event"), "an event occured!")
})

test_that("register with once() and emit an event only once", {
  myEmitter <- EventEmitter$new()
  myEmitter$once("event",
               function() {
                 message("an event occured!")
               }
  )
  expect_message(myEmitter$emit("event"), "an event occured!")
  expect_silent(myEmitter$emit("event"))
  myEmitter$once("a.listener", rlang::as_function(~ cat(.x)))
  expect_output(myEmitter$emit("a.listener", "A"), "A")
  expect_silent(myEmitter$emit("a.listener", "B"))
})

test_that("An error in a listener will throw an error in R", {
  myEmitter <- EventEmitter$new()
  myEmitter$on("event", function(...) stop("An error in a listener"))
  expect_error(myEmitter$emit("event"), regexp = "An error in a listener")
})

test_that("An error event catches error", {
  myEmitter <- EventEmitter$new()
  myEmitter$on("event", function(...) stop("An error in a listener"))
  myEmitter$on("error", function(e) message(conditionMessage(e)))
  expect_message(myEmitter$emit("event"), regexp = "^An error in a listener\n$")
})


test_that("A newListener is emitted before registration", {
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
  expect_output(myEmitter$emit("event"), "^BA$")
  # The listener attached to the "newListener" event has been
  # unregistered and is no more called:
  myEmitter$on("event", function(...) cat("C"))
  expect_output(myEmitter$emit("event"), "^BAC$")
})

test_that("countListner get the number of listener", {
  myEmitter <- EventEmitter$new()
  myEmitter$on("event", function(...) cat("A"))
  myEmitter$on("event", function(...) cat("B"))
  myEmitter$on("event", function(...) cat("C"))
  expect_identical(myEmitter$listenerCount("event"), 3L)
})

test_that("countListner get the number of listener", {
  myEmitter <- EventEmitter$new()
  myEmitter$on("event", function(...) cat("A"))
  expect_identical(myEmitter$eventNames(), c("event"))
  myEmitter$on("anotherevent", function(...) cat("A"))
  expect_identical(myEmitter$eventNames(), c("event", "anotherevent"))
})






