context("test-cdpsession")

setup_chrome_test()

test_that("connect and disconnect methods return promises", {
  client_pr <- CDPSession()
  expect_is(client_pr, "promise")
  client <- hold(client_pr)
  expect_is(client, "CDPSession")
  closed_pr <- client$disconnect()
  expect_is(closed_pr, "promise")
  hold(closed_pr)
})


test_that("CDPSession is disconnected when removed", {
  client <- hold(CDPSession())
  expect_message(client$.__enclos_env__$private$finalize())
})

test_that("Command-A command without a callback returns a promise whose value is a named list", {
  client <- hold(chrome$connect())
  pr <- client$Page$enable()
  res <- hold(pr)
  expect_is(res, "list")
  expect_true(rlang::is_named(res))
  hold(client$disconnect())
})

test_that("Command-The object passed to the callback function is identical to the value of the fulfilled promise", {
  client <- hold(chrome$connect())
  res_callback <- NULL
  client$Page$getFrameTree(callback = function(res) {res_callback <<- res})
  later::run_now()
  res_pr <- hold(client$Page$getFrameTree())
  expect_identical(res_callback, res_pr)
  hold(client$disconnect())
})

test_that("Command-rlang lambda functions can be used in callbacks", {
  client <- hold(chrome$connect())
  res_native_fun <- NULL
  res_rlang_fun <- NULL
  client$Browser$getVersion(callback = function(res) {res_native_fun <<- res})
  later::run_now()
  client$Browser$getVersion(callback = ~ {res_rlang_fun <<- .x})
  later::run_now()
  expect_identical(res_native_fun, res_rlang_fun)
  hold(client$disconnect())
})

test_that("Event listener-When a callback is used, the returned function dismisses the listener", {
  client <- hold(chrome$connect())
  hold(client$Page$enable())
  witness <- client$Page$loadEventFired()
  expect_is(witness, "promise")
  callback <- function(...) stop("this error should never fires")
  rm_callback <- client$Page$loadEventFired(callback = callback)
  expect_is(rm_callback, "function")
  # now remove the second listener
  returned_callback <- rm_callback()
  # when we remove the listener, the original callback is returned
  expect_identical(callback, returned_callback)
  # now navigate to a page
  f <- function() {
    client$Page$navigate(url = "http://httpbin.org/status/200")
    hold(witness)
  }
  expect_silent(f())
  hold(client$disconnect())
})

test_that("Event listener-With a predicate, without callback, a promise is returned which is fulfilled when the predicate matches", {
  client <- hold(chrome$connect())
  hold(client$Page$enable())
  frame_id <- hold(client$Page$getFrameTree())$frameTree$frame$id
  pr <- client$Page$frameStoppedLoading(frameId = ~ .x == frame_id)
  # we expect that a listener is attached to Page.frameStoppedLoading event
  expect_identical(client$listenerCount("Page.frameStoppedLoading"), 1L)
  expect_is(pr, "promise")
  hold(client$Page$navigate(url = "http://httpbin.org/status/200"))
  res <- hold(pr)
  expect_identical(res$frameId, frame_id)
  # we expect that the listener to the Page.frameStoppedLoading event is removed
  expect_identical(client$listenerCount("Page.frameStoppedLoading"), 0L)
  hold(client$disconnect())
})

# The following test fails: it seems that we have a bug

test_that("Event listener-With a predicate and a callback, the return object is a function that is used to remove the callback and returns the original callback function", {
  client <- hold(chrome$connect())
  hold(client$Page$enable())
  frame_id <- hold(client$Page$getFrameTree())$frameTree$frame$id
  witness <- NULL
  client$Page$frameStoppedLoading(frameId = ~ .x == frame_id, callback = ~ {witness <<- .x})
  expect_identical(client$listenerCount("Page.frameStoppedLoading"), 1L)
  callback <- function(...) stop("this error should never fires")
  rm_callback <- client$Page$frameStoppedLoading(frameId = ~ .x == frame_id, callback = callback)
  expect_identical(client$listenerCount("Page.frameStoppedLoading"), 2L)
  returned_callback <- rm_callback()
  expect_identical(client$listenerCount("Page.frameStoppedLoading"), 1L)
  expect_identical(returned_callback, callback)
  hold(client$Page$navigate(url = "http://httpbin.org/status/200"))
  later::run_now()
  expect_identical(witness$frameId, frame_id)
  hold(client$disconnect())
})
