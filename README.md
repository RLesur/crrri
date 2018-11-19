
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

# crrri

The goal of crrri is to provide a native Chrome Remote Interface in R
using the Chrome DevTools Protocol.  
This is a low-level implementation of the protocol. Deprecated commands
are not included.

Even if he DevTools protocol is not user-friendly, **with this package,
you can easily interact with a headless Chrome using R**. The only
system requirement is to have a recent version of Chromium or Chrome (a
standalone version works perfectly well). This package is mainly
intended for developers and provides no helpers for current tasks, like
taking a screenshot or scraping web pages.  
This is your responsibility to correctly use this package: interacting
with a browser is not straightforward.

## Installation

You can install the development version of crrri from GitHub with:

``` r
remotes::install_github('rlesur/crrri')
```

## Example

TBD
