context("test-cdpsession")

void_cb <- function(client){}

test_that("ws_url must be a character scalar", {
  client <- CDPSession(ws_url = 1)
  expect_is(client, "promise")
  expect_error(hold(client), regexp = "scalar")
  expect_error(CDPSession(ws_url = 1, callback = void_cb), regexp = "scalar")
})

test_that("a wrong scheme in ws_url stops", {
  client <- CDPSession(ws_url = "localhost")
  expect_is(client, "promise")
  expect_error(hold(client))
  expect_error(CDPSession(ws_url = "localhost", callback = void_cb))
})

test_that("ws_url overrides host and port", {
  expect_error(
    CDPSession(
      host = "google.com",
      ws_url = "ws://localhost:1234",
      callback = void_cb
    ),
    regexp = "localhost:1234"
  )
})

skip_if_not_chrome()

chrome <- Chrome$new()

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

chrome$close()
