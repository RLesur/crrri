context("test-hold")

test_that("hold returns the async value", {
  value <- runif(1)
  expect_identical(hold(promises::promise_resolve(value)), value)
})

test_that("hold throws an error when the promise is rejected", {
  expect_error(hold(promises::promise_reject("message")), regexp = "^message$")
})

test_that("hold throws an error if the promise is pending when timeout expires", {
  pr <- promises::promise(function(resolve, reject) {
    ~ later::later(~ resolve(1), 10)
  })
  expect_error(hold(pr, 0.1))
})
