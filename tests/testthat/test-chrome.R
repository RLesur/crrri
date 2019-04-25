context("test-chrome")

chrome <- Chrome$new()

test_that("Chrome$new() returns a Chrome class object", {
  expect_is(chrome, "Chrome")
  expect_is(chrome, "CDPRemote")
  expect_is(chrome, "R6")
})

test_that("connect() returns a CDPSession object that is closed with closeConnections()", {
  client_pr <- chrome$connect()
  expect_is(client_pr, "promise")
  client <- hold(client_pr)
  expect_is(client, "CDPSession")
  closed_pr <- chrome$closeConnections()
  expect_is(closed_pr, "promise")
  closed_pr_value <- hold(closed_pr)
  expect_reference(closed_pr_value, chrome)
  expect_equivalent(client$readyState(), 3L)
})

chrome$close()
