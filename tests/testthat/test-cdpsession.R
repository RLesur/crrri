context("test-cdpsession")

void_cb <- function(client){}

test_that("ws_url must be a character scalar", {
  client <- CDPSession(ws_url = 1)
  expect_is(client, "promise")
  expect_error(hold(client), regexp = "scalar")
  expect_error(CDPSession(ws_url = 1, callback = void_cb), regexp = "scalar")
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
