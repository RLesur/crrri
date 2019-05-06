
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/RLesur/crrri.svg?branch=master)](https://travis-ci.org/RLesur/crrri)
[![Coverage
status](https://codecov.io/gh/RLesur/crrri/branch/master/graph/badge.svg)](https://codecov.io/github/RLesur/crrri?branch=master)

# crrri

**Work in progress**

The goal of `crrri` is to provide a native Chrome Remote Interface in R
using the [Chrome Debugging
Protocol](https://chromedevtools.github.io/devtools-protocol/). This is
a low-level implementation of the protocol heavily inspired by the
[`chrome-remote-interface`](https://github.com/cyrus-and/chrome-remote-interface)
JavaScript library written by [Andrea
Cardaci](https://github.com/cyrus-and).

This package is intended to R packages developers who need to
orchestrate Chromium/Chrome: **with `crrri`, you can easily interact
with (headless) Chromium/Chrome using R**. We worked a lot to provide
the most simple API. However, you will have the bulk of the work and
learn how the Chrome DevTools Protocol works. Interacting with
Chromium/Chrome using the DevTools Protocol is a highly technical task
and prone to errors: you will be close to the metal and have full power
(be cautious\!).

This package is built on top of the
[`websocket`](https://github.com/rstudio/websocket) and
[`promises`](https://cran.r-project.org/package=promises) packages. The
default design of the `crrri` functions is asynchronous: they return
promises. You can also use `crrri` with callbacks if you prefer.

We are highly indebted to [Miles McBain](https://github.com/milesmcbain)
for his seminal work on
[`chradle`](https://github.com/milesmcbain/chradle) that inspired us.
Many thanks\!

## System requirements

First of all, you **do not need a `node.js` configuration** because
**`crrri` is fully written in R**.

You only need a recent version of Chromium or Chrome. A standalone
version works perfectly well on Windows. It is recommended to set the
value of the `HEADLESS_CHROME` environment variable to the path of
Chromium or Chrome (this is the same environment variable that is used
in [`decapitated`](https://github.com/hrbrmstr/decapitated)). Otherwise,
you can use the `bin` argument of the `Chrome` class `connect()` method.

## Installation

You can install the development version of `crrri` from GitHub with:

``` r
remotes::install_github('rlesur/crrri')
```

## Using `crrri` interactively

The `crrri` package is a low-level interface and **is not intended to be
used interactively**: the goal of `crrri` is to provide to R developers
a set of classes and helper functions to build higher levels functions.

**However, you can discover headless Chrome automation interactively in
your R session using `crrri`**. This will help you to learn the [Chrome
DevTools Protocol](https://chromedevtools.github.io/devtools-protocol),
the `crrri` design and develop higher level functions.

### A short-tour

Assuming that you have configured the `HEADLESS_CHROME` environment
variable (see before), you can start headless Chrome:

``` r
library(crrri)
chrome <- Chrome$new()
```

The `Chrome` class constructor is a **synchronous function**. That means
the R session is on hold until the command terminates.

The `$connect()` method of the `Chrome` class will connect the R session
to headless Chrome. As the connection process can take some time, the R
session does not hold\[1\]: this is an **asynchronous function**. This
function returns a promise which is fulfilled when R is connected to
Chrome.

However, you can pass a callback function to the `$connect()` method
using its `callback` argument. In this case, the returned object will be
a connection object:

``` r
client <- chrome$connect(callback = function(client) {
  client$inspect()
})
```

The `$inspect()` method of the connection object opens the Chrome
DevTools Inspector in RStudio (≥ 1.2.1335) or in your default web
browser (you can have some trouble if the inspector is not opened in
Chromium/Chrome). It is convenient if you need to inspect the content of
a web page because all that you need is in RStudio.

![DevTools Inspector in RStudio
viewer](https://user-images.githubusercontent.com/19177171/56867255-861c3900-69e3-11e9-88cd-2ef29075070f.png)

In order to discover the [Chrome DevTools
Protocol](https://chromedevtools.github.io/devtools-protocol) commands
and events listeners, it is recommended to extract one of the
domains\[2\] from the connection object:

``` r
Page <- client$Page
```

The `Page` object represents the [`Page`
domain](https://chromedevtools.github.io/devtools-protocol/tot/Page). It
possesses methods to send commands or listen to specific events.

For instance, you can send to Chromium/Chrome the
[`Page.navigate`](https://chromedevtools.github.io/devtools-protocol/tot/Page#method-navigate)
command as follows:

``` r
Page$navigate(url = "http://r-project.org")
```

Once the page is loaded by headless Chrome, RStudio looks like this:

![R Project website in headless
Chrome](https://user-images.githubusercontent.com/19177171/56867262-8f0d0a80-69e3-11e9-828f-4dddb0bcd492.png)

You will see in the R console:

    <Promise [pending]>

This is a promise object that is fulfilled when Chromium/Chrome sends
back to R a message telling that the command was well-received. This
comes from the fact that the `Page$navigate()` function is also
asynchronous. All the asynchronous methods possess a `callback`
argument. When the R session receives the result of the command from
Chrome, R executes this callback function passing the result object to
this function. For instance, you can execute:

``` r
Page$navigate(url = "https://ropensci.org/", callback = function(result) {
  cat("The R session has received this result from Chrome!\n")
  print(result)
})
```

Once the page is loaded, you will see both the web page and the result
object object in RStudio:

![rOpenSci website in headless
Chrome](https://user-images.githubusercontent.com/19177171/56867269-9cc29000-69e3-11e9-8fa4-ca238d3b3566.png)

To inspect the result of a command you can pass the `print` function to
the `callback` argument:

``` r
Page$navigate(url = "https://ropensci.org/", callback = print)
```

    #> $frameId
    #> [1] "3BB38B10082F28A946332100964486EC"
    #> 
    #> $loaderId
    #> [1] "9DCF07625678433563CB03FFF1E8A6AB"

The result object sent back from Chrome is also the value of the
promises once fulfilled. Recall that if you do not use a callback
function, you get a promise:

``` r
async_result <- Page$navigate(url = "http://r-project.org")
```

You can print the value of this promise once fulfilled with:

``` r
async_result %...>% print()
```

    #> $frameId
    #> [1] "3BB38B10082F28A946332100964486EC"
    #> 
    #> $loaderId
    #> [1] "7B2383E8F2F39273E18E4D918F1852A0"

As you can see, this leads to the same result as with a callback
function.

To sum up, these two forms perform the same actions:

``` r
Page$navigate(url = "http://r-project.org", callback = print)
Page$navigate(url = "http://r-project.org") %...>% print()
```

If you interact with headless Chrome in the R console using `crrri`,
these two forms are equivalent.  
**However, if you want to use `crrri` to develop higher level functions,
the most reliable way is to use promises.**

Do not forget to close headless Chrome with:

``` r
chrome$close()
```

Since the RStudio viewer has lost the connection, you will see this
screen in RStudio:

![headless Chrome
closed](https://user-images.githubusercontent.com/19177171/56867276-a4823480-69e3-11e9-8530-831ac4dd144e.png)

Now, you can take some time to discover all the commands and events of
the [Chrome DevTools
Protocol](https://chromedevtools.github.io/devtools-protocol/). The
following examples will introduce some of them.

### Domains, commands and events listeners

While working interactively, you can obtain the list of available
domains in your version of Chromium/Chrome.  
First, launch Chromium/Chrome and connect the R session to headless
Chromium/Chrome:

``` r
chrome <- Chrome$new()
client <- chrome$connect(~ .x$inspect())
```

Once connected, you just have to print the connection object to get
informations about the connection and availables domains:

``` r
client
```

    #> <CDP CONNECTION>
    #> connected to: http://localhost:9222/
    #>  target type: "page"
    #>    target ID: "9A576420CADEA9A514C5F027D30B410D"
    #> <DOMAINS>
    #> 
    #> Accessibility (experimental)
    #> 
    #> Animation (experimental)
    #> 
    #> ApplicationCache (experimental)
    #> 
    #> Audits (experimental): Audits domain allows investigation of page violations and possible improvements.
    #> 
    #> Browser: The Browser domain defines methods and events for browser managing.
    #> 
    #> CacheStorage (experimental)
    #> 
    #> Cast (experimental): A domain for interacting with Cast, Presentation API, and Remote Playback API functionalities.
    ...

These informations are directly retrieved from Chromium/Chrome: you may
obtain different informations depending on the Chromium/Chrome version.

In the most recent versions of the Chrome DevTools Protocol, more than
40 domains are available. A domain is a set of commands and events
listeners.

In order to work with a domain, it is recommended to extract it from the
connection object. For instance, if you want to access to the `Runtime`
domain, execute:

``` r
Runtime <- client$Runtime
```

If you print this object, this will open the online documentation about
this domain in your browser:

``` r
Runtime # opens the online documentation in a browser
```

## Examples

### Generate a PDF

Here is an example that produces a PDF of the [R Project
website](https://www.r-project.org/):

``` r
library(promises)
library(crrri)
library(jsonlite)

perform_with_chrome(function(client) {
  Page <- client$Page

  Page$enable() %...>% { # await enablement of the Page domain
    Page$navigate(url = "https://www.r-project.org/") 
    Page$loadEventFired() # await the load event
  } %...>% {
    Page$printToPDF() 
  } %...>% { # await PDF reception
    .$data %>% base64_dec() %>% writeBin("r_project.pdf") 
  }
})
```

All the functions of the `crrri` package (commands and event listeners)
return promises (as defined in the **promises** package) by default.
When building higher level functions, do not forget that you have to
deal with promises (those will prevent you to fall into the *Callback
Hell*).

For instance, you can write a `save_as_pdf` function as follow:

``` r
save_url_as_pdf <- function(url) {
  function(client) {
    Page <- client$Page

    Page$enable() %...>% {
      Page$navigate(url = url)
      Page$loadEventFired()
    } %...>% {
      Page$printToPDF()
    } %...>% {
      .$data %>%
        jsonlite::base64_dec() %>%
        writeBin(paste0(httr::parse_url(url)$hostname, ".pdf"))
    }
  }
}
```

You can pass several pass several functions to `perform_with_chrome()`:

``` r
save_as_pdf <- function(...) {
  list(...) %>%
    purrr::map(save_url_as_pdf) %>%
    perform_with_chrome(.list = .)
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

async_dump_DOM <- function(client) {
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
  }) 
}

perform_with_chrome(async_dump_DOM)
```

If you want to write a higher level function that dump the DOM, you can
embed the main part of this script in a function:

``` r
dump_DOM <- function(url) {
  perform_with_chrome(function(client) {
    Network <- client$Network
    Page <- client$Page
    Runtime <- client$Runtime
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
  })
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

Andrea Cardaci for `chrome-remote-interface`.

Miles McBain for `chradle`.

Bob Rudis for `decapitated`.

1.  most of R users should think that this behavior is weird but it is
    extremely powerful\!

2.  a domain is a set of commands, events listeners and types.
