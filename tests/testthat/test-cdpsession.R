context("test-cdpsession")

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
