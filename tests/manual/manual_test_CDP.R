devtools::load_all()

remote <- Chrome$new()
client <- CDPSession()
# client is in pre-connecting test until connection is explicitely launch
client$readyState()

# listening event
client$once("Runtime.executionContextCreated", function(...) cat("First command passed!"))

client$
  once("connect", ~ client$send('Runtime.enable'))$
  once("Runtime.enable", ~ client$send('Page.enable'))$
  once("Page.enable",
       ~ client$send('Runtime.addBinding',
                     params = list(name = "pagedownListener")
       )
  )$
  once("Runtime.addBinding",
       ~ client$send('Page.navigate',
                     params = list(url = "https://pagedown.rbind.io")
       )
  )$
  once('Page.domContentEventFired',
       ~ client$send('Runtime.evaluate',
                     params = list(expression = "!!window.PagedPolyfill")
       )
  )$
  once("Runtime.evaluate",
       function(result) if (!isTRUE(result$result$value)) {
         client$send(
           "Page.printToPDF",
           params = list(printBackground = TRUE, preferCSSPageSize = TRUE)
         )
       }
  )$
  once('Runtime.bindingCalled',
       ~ client$send(
         "Page.printToPDF",
         params = list(printBackground = TRUE, preferCSSPageSize = TRUE)
       )
  )$
  once("Page.printToPDF",
       function(result) writeBin(jsonlite::base64_dec(result$data), "test.pdf")
  )

# Lauching connection and starting the chain of event
client$connect()

# disconnect the client and close chrome
client$disconnect()
if(remote$is_alive()) remote$close()
rm(list = ls())
gc()

# New API with promises --------------------------------------
devtools::load_all()

chrome <- Chrome$new()
client <- hold(chrome$connect())

# client is connected and ready to receive commands
client$readyState()

Runtime <- client$Runtime
Page <- client$Page

print_pdf <- function(file = "test.pdf") {
  Page$printToPDF(
    printBackground = TRUE,
    preferCSSPageSize = TRUE
  ) %...>% (
    function(result) {
      writeBin(jsonlite::base64_dec(result$data), file)
      file
    }
  )
}

page_loaded <- Page$loadEventFired()

print_standard_document <- function() {
  page_loaded %...>% {
    print_pdf()
  }
}

ready_to_navigate <-
  Runtime$enable() %...>% {
    Page$enable()
  } %...>% {
    Runtime$addBinding(name = "pagedownListener")
  }

pagedjs_documents_printed <-
  Runtime$bindingCalled() %...>% {
    print_pdf()
  }

printed <-
  ready_to_navigate %...>% {
  Page$navigate(url = "https://pagedown.rbind.io")
} %...>% {
  Page$domContentEventFired()
} %...>% {
  Runtime$evaluate(expression = "!!window.PagedPolyfill")
} %...>% (
  function(result) if(isTRUE(result$result$value)) {
    pagedjs_documents_printed
  } else {
    print_standard_document()
  }
)


# closing the session and chrome
if(remote$is_alive()) remote$close()
rm(list = ls())
gc()
