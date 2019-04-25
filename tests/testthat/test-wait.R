context("test-wait")

test_that("both pipes work with a promise as an argument", {
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
