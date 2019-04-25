context("test-wait")

test_that("wait(): both pipes work with a promise as an argument", {
  value <- runif(1)
  pr <- promises::promise_resolve(value)

  with_magrittr_pipe <-
    pr %>% wait(0.1)

  expect_identical(hold(with_magrittr_pipe), value)

  with_promises_pipe <-
    pr %...>% wait(0.1)

  expect_identical(hold(with_promises_pipe), value)
})

test_that("wait() also works with a non-promise object", {
  value <- runif(1)
  pr <- wait(value, 0.1)
  expect_is(pr, "promise")
  expect_identical(hold(pr), value)
})

test_that("timeout() works with a non promise argument", {
  value <- runif(1)
  pr <- timeout(x = value, delay = 0.1)
  expect_is(pr, "promise")
  expect_error(hold(pr), regexp = "0\\.1")
})

test_that("timeout() returns the value of the promise when it is fulfilled before the delay expires", {
  value <- runif(1)
  pr <- timeout(wait(x = value, delay = 0.1), delay = 10)
  expect_is(pr, "promise")
  expect_identical(hold(pr), value)
})

test_that("timeout() returns a promise which is rejected when the delay expires", {
  value <- runif(1)
  pr <- timeout(wait(x = value, delay = 10), delay = 0.1)
  expect_is(pr, "promise")
  expect_error(hold(pr), regexp = "0\\.1")
})

