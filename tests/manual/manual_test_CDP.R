devtools::load_all()

remote <- Chrome$new()
client <- CDP()
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
if(remote$is_alive) remote$close()
rm(list = ls())
gc()

# New API with promises --------------------------------------
devtools::load_all()

remote <- Chrome$new()
client <- remote$connect()

# client is connected and ready to receive commands
client$readyState()

Runtime <- client$Runtime
Page <- client$Page

# listening event
Runtime$executionContextCreated(function(...) cat("First command passed!"))

print_pdf <- function() {
  Page$printToPDF(
    printBackground = TRUE,
    preferCSSPageSize = TRUE,
    callback = function(result) {
      writeBin(jsonlite::base64_dec(result$data), "test.pdf")
      remote$close()
    }
  )
}

Runtime$bindingCalled() %...>% {
  print_pdf()
}

Runtime$enable() %...>% {
  Page$enable()
} %...>% {
  Runtime$addBinding(name = "pagedownListener")
} %...>% {
  Page$navigate(url = "https://pagedown.rbind.io")
} %...>% {
  Runtime$evaluate(expression = "!!window.PagedPolyfill")
} %...>% (
  function(result) if(!isTRUE(result$result$value)) print_pdf()
)


# closing the session and chrome
if(remote$is_alive) remote$close()
rm(list = ls())
gc()
