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

test_that("CDPSession is disconnected when removed", {
  client <- hold(CDPSession())
  expect_message(client$.__enclos_env__$private$finalize())
})
