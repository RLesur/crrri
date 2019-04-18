devtools::load_all()

work_dir <- chr_new_data_dir()

chrome <- chr_launch(work_dir = work_dir, headless = TRUE)

#ws_endpoint <- chr_get_ws_addr(port = 9222)

# client <- CDPSession$new(ws_endpoint)
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

# closing the session and chrome
client$close()
if(chrome$is_alive()) chrome$kill()
rm(list = ls())
gc()


# using promises ----------------------------------------------------------
devtools::load_all()

work_dir <- chr_new_data_dir()

chrome <- chr_launch(work_dir = work_dir, headless = TRUE)

ws_endpoint <- chr_get_ws_addr(port = 9222)

client <- CDPSession$new(ws_endpoint)

# client is in pre-connecting test until connection is explicitely launch
client$readyState()

# listening event
client$once("Runtime.executionContextCreated", function(...) cat("First command passed!"))

connected = client$once("connect")

connected %...>% {
  client$send('Runtime.enable')
}

client$once("Runtime.enable") %...>% {client$send('Page.enable')}

client$once("Page.enable") %...>% {
  client$send(
    'Runtime.addBinding',
    params = list(name = "pagedownListener")
  )
}
client$once("Runtime.addBinding") %...>% {
  client$send(
    'Page.navigate',
    params = list(url = "https://pagedown.rbind.io")
  )
}
client$once('Page.domContentEventFired') %...>% {
  client$send(
    'Runtime.evaluate',
    params = list(expression = "!!window.PagedPolyfill")
  )
}
client$once("Runtime.evaluate",
       function(result) if (!isTRUE(result$result$value)) {
         client$send(
           "Page.printToPDF",
           params = list(printBackground = TRUE, preferCSSPageSize = TRUE)
         )
       }
  )
client$once('Runtime.bindingCalled') %...>% {
  client$send(
    "Page.printToPDF",
    params = list(printBackground = TRUE, preferCSSPageSize = TRUE)
  )
}
client$once("Page.printToPDF",
       function(result) writeBin(jsonlite::base64_dec(result$data), "test.pdf")
)

# Lauching connection and starting the chain of event
client$connect()

# closing the session and chrome
client$close()
if(chrome$is_alive()) chrome$kill()
rm(list = ls())
gc()


# Using promises: moving forward --------------------------------------
devtools::load_all()

work_dir <- chr_new_data_dir()

chrome <- chr_launch(work_dir = work_dir, headless = TRUE)

ws_endpoint <- chr_get_ws_addr(port = 9222)

client <- CDPSession$new(ws_endpoint)

# client is in pre-connecting test until connection is explicitely launch
client$readyState()

# listening event
client$once("Runtime.executionContextCreated", function(...) cat("First command passed!"))

client$once("connect") %...>% {
  client$send('Runtime.enable')
} %...>% {
  client$send('Page.enable')
} %...>% {
  client$send(
    'Runtime.addBinding',
    params = list(name = "pagedownListener")
  )
} %...>% {
  client$send(
    'Page.navigate',
    params = list(url = "https://pagedown.rbind.io")
  )
} %...>% {
  client$send(
    'Runtime.evaluate',
    params = list(expression = "!!window.PagedPolyfill")
  )
} %...>% (
  function(result) if (!isTRUE(result$result$value)) {
    client$send(
      "Page.printToPDF",
      params = list(printBackground = TRUE, preferCSSPageSize = TRUE)
    )
  }
)

client$once('Runtime.bindingCalled') %...>% {
  client$send(
    "Page.printToPDF",
    params = list(printBackground = TRUE, preferCSSPageSize = TRUE)
  )
}

client$once("Page.printToPDF") %...>% (
  function(result) writeBin(jsonlite::base64_dec(result$data), "test.pdf")
)


# Lauching connection and starting the chain of event
client$connect()

# closing the session and chrome
client$close()
if(chrome$is_alive()) chrome$kill()
rm(list = ls())
gc()

# New API with promises --------------------------------------
devtools::load_all()

work_dir <- chr_new_data_dir()
chrome <- chr_launch(work_dir = work_dir, headless = TRUE)

client <- CDP()

# client is in pre-connecting test until connection is explicitely launch
client$readyState()

Runtime <- client$Runtime
Page <- client$Page

# listening event
Runtime$executionContextCreated(function(...) cat("First command passed!"))

print_pdf <- function() {
  Page$printToPDF(
    list(printBackground = TRUE, preferCSSPageSize = TRUE),
    function(result) writeBin(jsonlite::base64_dec(result$data), "test.pdf")
  )
}

client$once("connect") %...>% {
  Runtime$enable()
} %...>% {
  Page$enable()
} %...>% {
  Runtime$addBinding(list(name = "pagedownListener"))
} %...>% {
  Page$navigate(list(url = "https://pagedown.rbind.io"))
} %...>% {
  Runtime$evaluate(list(expression = "!!window.PagedPolyfill"))
} %...>% (
  function(result) if (!isTRUE(result$result$value)) print_pdf()
)

Runtime$bindingCalled() %...>% {
  print_pdf()
}


# Lauching connection and starting the chain of event
client$connect()

# closing the session and chrome
client$close()
if(chrome$is_alive()) chrome$kill()
rm(list = ls())
gc()




