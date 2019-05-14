test_that("write_base64 only works if data field is present as string", {
  expect_error(write_base64(list(a = "aaaa")), regexp = "name.*data")
  expect_error(write_base64(list(data = 2236)), "not a string")
  expect_error(write_base64(list(data = c("aaa", "bbb"))), "not a string")
  dummy_res <- list(data = jsonlite::base64_enc("test"))
  temp_file <- tempfile()
  expect_invisible(write_base64(dummy_res, temp_file))
  expect_true(file.exists(temp_file))
  expect_identical(readChar(temp_file, 10), "test")
  unlink(temp_file)
})

test_that("write_base64 works with async promise", {
  temp_file <- tempfile()
  res <- promises::promise_resolve(
    list(data = jsonlite::base64_enc("test"))
  ) %...>% {
    write_base64(., temp_file)
  } %...>% {
    expect_true(file.exists(temp_file))
    expect_identical(readChar(temp_file, 10), "test")
  } %>%
    promises::finally(~ unlink(temp_file))
  hold(res)
})
