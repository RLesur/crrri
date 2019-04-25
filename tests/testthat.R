library(testthat)
library(crrri)

not_chrome <- !nzchar(Sys.getenv("HEADLESS_CHROME"))
filter <- if(not_chrome) "^((?!needs-chrome).)*$"

test_check("crrri", filter = filter, perl = TRUE)
