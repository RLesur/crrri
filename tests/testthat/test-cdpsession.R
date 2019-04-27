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

skip_if_not_chrome()

setup({
  rlang::env_bind(rlang::global_env(), chrome = Chrome$new())
})
teardown({
  if (chrome$is_alive()) {
    message("closing chrome")
    chrome$close()
  }
  rlang::env_unbind(rlang::global_env(), nms = "chrome")
})

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
