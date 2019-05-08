context("test-cdpsession")

void_cb <- function(client){}

test_that("ws_url must be a character scalar", {
  client <- CDPSession(ws_url = 1)
  expect_is(client, "promise")
  expect_error(hold(client), regexp = "scalar")
})

test_that("a malformed ws_url throws an error or rejects the promise", {
  client <- CDPSession(ws_url = "localhost")
  expect_is(client, "promise")
  expect_error(hold(client))
  expect_error(CDPSession(ws_url = "localhost", callback = void_cb))
})

test_that("host must be a character scalar", {
  client <- CDPSession(host = 1)
  expect_is(client, "promise")
  expect_error(hold(client))
  expect_error(CDPSession(host = c("localhost", "localhost"), callback = void_cb))
})

test_that("port must be a numeric or a character scalar", {
  client <- CDPSession(port = TRUE)
  expect_is(client, "promise")
  expect_error(hold(client))
  expect_error(CDPSession(port = list(1, 2), callback = void_cb))
})

setup_chrome_test()

test_that("ws url can be retrieved correctly", {
  expect_match(chr_get_ws_addr(), "ws[s]?://localhost:9222/devtools/page/[A-Z0-9]+")
  expect_match(chr_get_ws_addr(port = 9222), "ws[s]?://localhost:9222/devtools/page/[A-Z0-9]+")
  expect_error(chr_get_ws_addr(secure = TRUE),
               "https://localhost")
})

test_that("connect and disconnect methods return promises", {
  client_pr <- CDPSession()
  expect_is(client_pr, "promise")
  client <- hold(client_pr)
  expect_is(client, "CDPSession")
  closed_pr <- client$disconnect()
  expect_is(closed_pr, "promise")
  closed_client <- hold(closed_pr)
  expect_is(closed_client, "CDPSession")
  expect_reference(closed_client, client)
  # re-run the last expectations with a closed connection
  expect_equivalent(client$readyState(), 3L)
  closed_pr <- client$disconnect()
  expect_is(closed_pr, "promise")
  closed_client <- hold(closed_pr)
  expect_is(closed_client, "CDPSession")
  expect_reference(closed_client, client)
})

test_that("when callback, async is FALSE and not return a promise", {
  client <- CDPSession(callback = function(client) message("ok"))
  expect_false(promises::is.promise(client))
})

test_that("in disconnect() when using a callback, the argument passed to the callback is the connection object and disconnect() returns self", {
  client <- hold(CDPSession())
  arg <- NULL
  res <- client$disconnect(callback = function(x) {arg <<- x})
  hold(client$disconnect())
  expect_reference(arg, client)
  expect_reference(res, client)
  # re-run the last expectations with a closed connection
  arg <- NULL
  expect_equivalent(client$readyState(), 3L)
  res <- client$disconnect(callback = function(x) {arg <<- x})
  expect_reference(arg, client)
  expect_reference(res, client)
})

test_that("inspect method returns NULL", {
  skip_if_not(interactive())
  client <- hold(CDPSession())
  expect_identical(client$inspect(), NULL)
  client$disconnect()
})

test_that("CDPSession is disconnected when removed", {
  client <- hold(CDPSession())
  expect_message(client$.__enclos_env__$private$finalize())
})

test_that("activateTab method returns a promise which fulfills to TRUE when connected and rejects when disconnected", {
  client <- hold(CDPSession())
  activated <- client$activateTab()
  expect_is(activated, "promise")
  expect_identical(hold(activated), TRUE)
  client$disconnect()
  activated <- client$activateTab()
  expect_is(activated, "promise")
  expect_error(hold(activated))
})

test_that("closeTab method disconnects and closes target silently", {
  targets <- length(list_targets())
  client <- hold(CDPSession())
  closed_pr <- client$closeTab()
  expect_is(closed_pr, "promise")
  expect_silent(hold(closed_pr))
  expect_true(hold(closed_pr))
  expect_equivalent(client$readyState(), 3L)
  expect_equal(length(list_targets()), targets - 1L)
})

test_that("connect() raises an error (or return a rejected promise) when there is no target available", {
  expect_length(list_targets(), 0L)
  client_pr <- CDPSession()
  expect_is(client_pr, "promise")
  expect_error(hold(client_pr))
})

test_that("when printed, the connection object returns informations about domains", {
  client <- hold(chrome$connect())
  expect_output(print(client), "<DOMAINS>")
})

test_that("Command-A command without a callback returns a promise whose value is a named list", {
  client <- hold(chrome$connect())
  pr <- client$Page$enable()
  res <- hold(pr)
  expect_type(res, "list")
  expect_named(res)
  hold(client$disconnect())
})

test_that("Command-The object passed to the callback function is identical to the value of the fulfilled promise", {
  client <- hold(chrome$connect())
  res_callback <- NULL
  client$Page$getFrameTree(callback = function(res) {res_callback <<- res})
  later::run_now(0.1)
  res_pr <- hold(client$Page$getFrameTree())
  expect_identical(res_callback, res_pr)
  hold(client$disconnect())
})

test_that("Command-rlang lambda functions can be used in callbacks", {
  client <- hold(chrome$connect())
  res_native_fun <- NULL
  res_rlang_fun <- NULL
  client$Browser$getVersion(callback = function(res) {res_native_fun <<- res})
  client$Browser$getVersion(callback = ~ {res_rlang_fun <<- .x})
  hold(client$Browser$getVersion())
  expect_identical(res_native_fun, res_rlang_fun)
  hold(client$disconnect())
})

test_that("Event listener-When a callback is used, the returned function dismisses the listener", {
  client <- hold(chrome$connect())
  hold(client$Page$enable())
  witness <- client$Page$loadEventFired()
  expect_s3_class(witness, "promise")
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

test_that("Event listener-With a predicate and a callback, the return object is a function that is used to remove the callback and returns the original callback function", {
  client <- hold(chrome$connect())
  hold(client$Page$enable())
  frame_id <- hold(client$Page$getFrameTree())$frameTree$frame$id
  result <- NULL
  witness <- client$Page$frameStoppedLoading(frameId = ~ .x == frame_id) %...>% {
    result <<- .
  }
  expect_identical(client$listenerCount("Page.frameStoppedLoading"), 1L)
  callback <- function(...) stop("this error should never fires")
  rm_callback <- client$Page$frameStoppedLoading(frameId = ~ .x == frame_id, callback = callback)
  expect_identical(client$listenerCount("Page.frameStoppedLoading"), 2L)
  returned_callback <- rm_callback()
  expect_identical(client$listenerCount("Page.frameStoppedLoading"), 1L)
  expect_identical(returned_callback, callback)
  client$Page$navigate(url = "http://httpbin.org/status/200")
  expect_silent(hold(witness))
  expect_identical(result$frameId, frame_id)
  hold(client$disconnect())
})

test_that("Event listener-With a value as predicate, without callback, a promise is returned which is fulfilled when the predicate matches", {
  client <- hold(chrome$connect())
  hold(client$Page$enable())
  frame_id <- hold(client$Page$getFrameTree())$frameTree$frame$id
  pr <- client$Page$frameStoppedLoading(frameId = frame_id)
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

test_that("Event listener-With a value as predicate and a callback, the return object is a function that is used to remove the callback and returns the original callback function", {
  client <- hold(chrome$connect())
  hold(client$Page$enable())
  frame_id <- hold(client$Page$getFrameTree())$frameTree$frame$id
  result <- NULL
  witness <- client$Page$frameStoppedLoading(frameId = frame_id) %...>% {
    result <<- .
  }
  expect_identical(client$listenerCount("Page.frameStoppedLoading"), 1L)
  callback <- function(...) stop("this error should never fires")
  rm_callback <- client$Page$frameStoppedLoading(frameId = frame_id, callback = callback)
  expect_identical(client$listenerCount("Page.frameStoppedLoading"), 2L)
  returned_callback <- rm_callback()
  expect_identical(client$listenerCount("Page.frameStoppedLoading"), 1L)
  expect_identical(returned_callback, callback)
  client$Page$navigate(url = "http://httpbin.org/status/200")
  expect_silent(hold(witness))
  expect_identical(result$frameId, frame_id)
  hold(client$disconnect())
})
