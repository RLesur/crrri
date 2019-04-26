context("test-cdpsession")

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
