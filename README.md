
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

This package is built on top of the
[`websocket`](https://github.com/rstudio/websocket) and
[`promises`](https://cran.r-project.org/package=promises) packages. The
default design of the `crrri` functions is to use promises. However, you
can also use `crrri` with events/callbacks if you prefer.

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
website](https://www.r-project.org/):

``` r
library(promises)
library(crrri)
library(jsonlite)

chrome <- Chrome$new() 
chrome$connect() %...>% 
  (function(client) {
    Page <- client$Page
  
    Page$enable() %...>% { # await enablement of the Page domain
      Page$navigate(url = "https://www.r-project.org/") 
      Page$loadEventFired() # await the load event
    } %...>% {
      Page$printToPDF() 
    } %...>% { # await PDF reception
      .$data %>% base64_dec() %>% writeBin("r_project.pdf") 
    }
  }) %...!% {
    # handle errors
    cat("An error has occured:", .$message, "\n")
  } %>%
  finally(~ chrome$close())  # disconnect and close Chrome
```

All the functions of the `crrri` package (commands and event listeners)
return promises (as defined in the **promises** package) by default.
When building higher level functions, do not forget that you have to
deal with promises (those will prevent you to fall into the *Callback
Hell*).

For instance, you can write a `save_as_pdf` function with a timeout (the
`crrri::timeout()` function returns a promise that is rejected after a
delay) as follow:

``` r
save_url_as_pdf <- function(client, url, delay = 30) {
  Page <- client$Page
  promise_race(
    timeout(delay),
    Page$enable() %...>% { # await enablement of the Page domain
      Page$navigate(url = url) 
      Page$loadEventFired() # await the load event
    } %...>% {
      Page$printToPDF() 
    } %...>% { # await PDF reception
      .$data %>% 
        base64_dec() %>% 
        writeBin(paste0(httr::parse_url(url)$hostname, ".pdf")) 
    } %...>% {
      client
    }
  )
}
```

Since the above `save_url_as_pdf()` returns the `client` object, we can
chain it and implement a dot argument (PDF will be generated
sequentially):

``` r
save_as_pdf <- function(...) {
  chrome <- Chrome$new()
  client <- chrome$connect()
  promise_reduce(list(...), save_url_as_pdf, .init = client) %...!% {
    cat("An error has occured:", .$message, "\n") 
  } %>%
    finally(~ chrome$close())
}
```

You have created a `save_as_pdf()` function that can handle multiple
URLs:

``` r
save_as_pdf("http://r-project.org", "https://ropensci.org/", "https://rstudio.com")
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

chrome <- Chrome$new()

CDPSession(callback = function(client) {
  Network <- client$Network
  Page <- client$Page
  Runtime <- client$Runtime
  Network$enable() %...>% { 
    Page$enable()
  } %...>% {
    Network$setCacheDisabled(cacheDisabled = TRUE)
  } %...>% {
    Page$navigate(url = 'https://github.com')
  } %...>% {
    Page$loadEventFired()
  } %...>% {
    Runtime$evaluate(
      expression = 'document.documentElement.outerHTML'
    )
  } %...>% (function(result) {
    html <- result$result$value
    cat(html, "\n")
  }) %...!% {
    cat("Error:", .$message, "\n") 
  } %>%
    finally(~ client$disconnect())
})$on("error", function(err) {
  cat(err$message)
})$on("disconnect", function() {
  chrome$close()
})
```

If you want to write a higher level function that dump the DOM, you can
embed the main part of this script in a function. Remind you to handle
infinite pending promise (with a timeout for instance) and rejected
promises:

``` r
dump_DOM <- function(url, delay = 30) {
  chrome <- Chrome$new() 
  chrome$connect() %...>% (
    function(client) {
      Network <- client$Network
      Page <- client$Page
      Runtime <- client$Runtime
      
      promise_race(
        timeout(delay),
        Network$enable() %...>% {
          Page$enable()
        } %...>% {
          Network$setCacheDisabled(cacheDisabled = TRUE)
        } %...>% {
          Page$navigate(url = url)
        } %...>% {
          Page$loadEventFired()
        } %...>% {
          Runtime$evaluate(
            expression = 'document.documentElement.outerHTML'
          )
        } %...>% (function(result) {
          html <- result$result$value
          cat(html, "\n")
        })
      ) %...!% {
        cat("Error:", .$message, "\n") 
      } %>%
        finally(~ chrome$close())
    }
  )
}
```

Now, you can use it for dumping [David
Gohel](https://github.com/davidgohel)’s
[blog](http://www.ardata.fr/blog/):

``` r
dumpDOM(url = "http://www.ardata.fr/blog/")
```

You can find many other examples in the
[wiki](https://github.com/cyrus-and/chrome-remote-interface/wiki) of the
`chrome-remote-interface` module.

## Development

### Logging Messages

In `crrri`, there are two types of messages:

  - Those sent during connection/disconnection (mainly for crrri
    debugging)
  - Those tracking the exchanges between the R websocket client and the
    remote websocket server. These lasts are essential for R devs to
    develop higher levels packages, either during the development
    process and for debugging purposes.

`crrri` uses [`debugme`](https://github.com/r-lib/debugme) for printing
those messages. It is disable by default and you won’t see any messages
- as a user we think it is fine. However, if you are a developer, you
would expect some information on what is going on.

You need to add `"crrri"` to the `DEBUGME` environment variable before
loading the package to activate the messaging feature. Currently in
`crrri` there is only one level of message.Also, `debugme` is a
Suggested dependency and you may need to install it manually if not
already installed.

## Credits

Miles McBain for `chradle`.

Bob Rudis for `decapitated`.
