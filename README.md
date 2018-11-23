
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

# crrri

**Work in progress**

The goal of `crrri` is to provide a native Chrome Remote Interface in R
using the [Chrome DevTools
Protocol](https://chromedevtools.github.io/devtools-protocol/).  
This is a low-level implementation of the protocol. Deprecated commands
are not included.

This package is intended to R packages developers who need to
orchestrate Chrome: **with `crrri`, you can easily interact with a
(headless) Chrome using R**. We worked a lot to provide the most simple
API. However, you will have the bulk of the work. Interacting with
Chrome using the DevTools Protocol is a highly technical task and prone
to errors: you will be close to the metal and have full power (be
cautious\!). It is highly recommended to know how the DevTools Protocol
works.

This package is built on top of the packages
[`websocket`](https://github.com/rstudio/websocket) and
[`promises`](https://cran.r-project.org/package=promises). The default
design of the `crrri` functions is to use promises. However, you can
also use `crrri` with callbacks if you prefer.

We are highly indebted to [Miles McBain](https://github.com/milesmcbain)
for his seminal work on
[`chradle`](https://github.com/milesmcbain/chradle) that inspired us.
Many thanks\!

## System requirements

First of all, you **do not need a `node.js` configuration** because
**`crrri` is fully written in R**.

You only need a recent version of Chromium or Chrome: a standalone
version works perfectly well on Windows. It is recommended to set the
value of the `HEADLESS_CHROME` environment variable to the path of
Chromium or Chrome (this is the same variable that is used in
[`decapitated`](https://github.com/hrbrmstr/decapitated)). Otherwise,
you can use the `bin` argument of the `chr_connect()` function.

## Installation

You can install the development version of `crrri` from GitHub with:

``` r
remotes::install_github('rlesur/crrri')
```

## Examples

### Generate a PDF

Assuming that you have configured the `HEADLESS_CHROME` environment (see
before), here is an example that produces a PDF of the [R Project
website](https://www.r-project.org/) (please, do not re-use this example
in production because it is absolutely not reliable):

``` r
library(promises)
library(crrri)
library(jsonlite)

chrome <- chr_connect() 

chrome %>% # await R connexion to headless Chrome
  Page.enable() %>% # await enablement of the Page domain
  Page.navigate(url = "https://www.r-project.org/") %>% # await navigation starts
  Page.frameStoppedLoading(frameId = ~ .res$frameId) %>% # await the event "Page.frameStoppedLoading" 
  Page.printToPDF() %...T>% { # await PDF reception
    .$result$data %>% base64_dec() %>% writeBin("r_project.pdf") 
  } %>%
  finally(~ chr_disconnect(chrome)) %...!% { # disconnect and close Chrome
    cat(c("An error has occured:\n", .$message, "\n")) # handle errors
  }
```

All the functions of the `crrri` package (commands and event listeners)
are built on top of the `promises::then()` function. So, you can pass
arguments to these functions and use the `%>%` `magrittr`’s pipe.
However, when building higher level functions, don’t forget that you
have to deal with promises (those will prevent you to fall into the
Callback Hell).

For instance, you can write a `saveAsPDF` function with a timeout (the
`crrri::timeout()` function returns a promise that is rejected after a
delay) as
follow:

``` r
saveAsPDF <- function(chrome, url = c(r_project = "https://www.r-project.org/"), delay = 30) {
  promise_race(
    timeout(delay),
    chrome %>% 
      Page.enable() %>%
      Page.navigate(url = url) %>% 
      Page.frameStoppedLoading(frameId = ~ .res$frameId) %>%  
      Page.printToPDF() %...T>% { 
        .$result$data %>% base64_dec() %>% writeBin(paste0(names(url), ".pdf")) 
      }
  )
}
```

Now, you can use it multiple times:

``` r
chrome <- chr_connect()

chrome %>% 
  saveAsPDF(c(r_project = "https://www.r-project.org/")) %>%
  saveAsPDF(c(rstudio = "https://rstudio.com/")) %>%
  saveAsPDF(c(ropensci = "https://ropensci.org/")) %>%
  finally(~ chr_disconnect(chrome)) %...!% {
    cat(.$message)
  }
```

### Transpose `chrome-remote-interface` JS scripts: dump the DOM

With `crrri`, you should be able to transpose with minimal efforts some
JS scripts written with the
[`chrome-remote-interface`](https://github.com/cyrus-and/chrome-remote-interface)
node.js module.

For instance, take [this JS
script](https://github.com/cyrus-and/chrome-remote-interface/wiki/Dump-HTML-after-page-load)
that dumps the DOM:

``` js
const CDP = require('chrome-remote-interface');

CDP(async(client) => {
    const {Network, Page, Runtime} = client;
    try {
        await Network.enable();
        await Page.enable();
        await Network.setCacheDisabled({cacheDisabled: true});
        await Page.navigate({url: 'https://github.com'});
        await Page.loadEventFired();
        const result = await Runtime.evaluate({
            expression: 'document.documentElement.outerHTML'
        });
        const html = result.result.value;
        console.log(html);
    } catch (err) {
        console.error(err);
    } finally {
        client.close();
    }
}).on('error', (err) => {
    console.error(err);
});
```

Using `crrri`, you can write:

``` r
library(promises)
library(crrri)

chrome <- chr_connect()

chrome %>%
  Network.enable() %>%
  Page.enable() %>%
  Network.setCacheDisabled(cacheDisabled = TRUE) %>%
  Page.navigate(url = "https://github.com", awaitResult = FALSE) %>% # because the following event listener does not use this result, it is safer to use awaitResult = FALSE
  Page.loadEventFired() %>%
  Runtime.evaluate(expression = 'document.documentElement.outerHTML') %...>% {
   cat(.$result$result$value, "\n") 
  } %>%
  finally(~ chr_disconnect(chrome)) %...!% {
    cat(.$message)
  }
```

If you want to write a higher level function that dump the DOM, you can
embed this script in a function. **Remind you to handle infinite pending
promise** (with a timeout for instance) and rejected promises:

``` r
dumpDOM <- function(url, delay = 30) {
  chrome <- chr_connect()
  promise_race(
    timeout(delay),
    chrome %>%
      Network.enable() %>%
      Page.enable() %>%
      Network.setCacheDisabled(cacheDisabled = TRUE) %>%
      Page.navigate(url, awaitResult = FALSE) %>%
      Page.loadEventFired() %>%
      Runtime.evaluate(expression = "document.documentElement.outerHTML") %...T>% {
        cat(.$result$result$value, "\n") 
      }
  ) %>%
  finally(~ chr_disconnect(chrome)) %...!% {
    cat(.$message)
  }
}
```

Now, you can use it for dumping [David
Gohel](https://github.com/davidgohel)’s
[blog](http://www.ardata.fr/blog/):

``` r
dumpDOM(url = "http://www.ardata.fr/blog/")
```

## Credits

Miles McBain for `chradle`.

Bob Rudis for `decapitated`.
