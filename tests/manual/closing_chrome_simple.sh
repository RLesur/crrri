#!/bin/bash

# To run inside docker to crash an rsession and check for remaining process
# docker build -t test-crrri-shinyverse:3.6.1 -f tests/manual/docker/dockerfile-shinyverse .
# docker run -it --rm -v `pwd`:`pwd` -w `pwd` test-crrri-shinyverse:3.6.1 bash tests/manual/closing_chrome_simple.sh

Rscript -e 'devtools::load_all()' \
    -e 'remote <- Chrome$new("google-chrome", extra_args = c("--disable-gpu", "--no-sandbox"))' \
    -e 'ps::ps()' \
    -e 'ps::ps_kill(ps::ps_handle(Sys.getpid()))'
Rscript -e "ps::ps()"
