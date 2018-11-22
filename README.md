
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

You need to set an environment variable named `HEADLESS_CHROME` (same
variable as in `hrbrmstr/decapitated`) that contains the path to the
Chrome (or Chromium) executable.

``` r
library(crrri)
library(promises)
library(jsonlite)

chrome <- chr_connect()
```

``` r
#> Chrome succesfully launched in headless mode 
#> R succesfully connected to headless Chrome through DevTools Protocol.
```

Since all the operations that we can do with the DevTools Protocol are
asynchronous, all the functions return Promises (in the sense of the
promises package). For instance:

``` r
chrome
```

``` r
#> <Promise [fulfilled: list]>
```

Chrome DevTools commands are built on top of the `promises::then()`
function. So, you can use the single magrittr pipe operator `%>%` to
chain operations:

``` r
r_project <- 
  chrome %>% 
  Page.enable() %>%
  Page.navigate(url = "https://www.r-project.org/")

# event listeners have to be developed
# For now, you have to wait that the frame is loaded
```

The value of the fulfilled promise is a list of 2 objects:

  - `cnx`: information about the connexion. It is used internally, so do
    not use it.
  - `result`: a list composed of the objects received from Chrome.

For instance, if you want to print a PDF of the R Project website:

``` r
r_project %>%
  Page.printToPDF() %...>% {
    .$result$data %>% base64_dec() %>% writeBin("r-project.pdf")
  } %...!% {
    cat(c("An error has occured:", as.character(.)), sep = "\n")
  } %>%
  finally(~ chr_disconnect(chrome))
```

## Credits

Miles McBain for `chradle`.

Bob Rudis for `decapitated`.