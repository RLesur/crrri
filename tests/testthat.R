library(testthat)
library(crrri)

# do no print command from chrome launching
options(crrri.verbose = FALSE)
test_check("crrri")
