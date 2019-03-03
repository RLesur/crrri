devtools::load_all()

work_dir <- chr_new_data_dir()

chrome <- chr_launch(work_dir = work_dir, headless = TRUE)

ws_endpoint <- chr_get_ws_addr(debug_port = 9222, type = 'page')

page_session <- CDPSession$new(ws_endpoint)

repeat {
  if (page_session$is_ready()) break
}

# piped workflow
session <- list(CDPSession = page_session)

session  %>%
  sendToSession('Runtime.enable', listener = 'run') %>%
  sendToSession('Page.enable') %>%
  sendToSession('Runtime.addBinding', params = list(name = "pagedownListener")) %>%
  sendToSession('Page.navigate', params = list(url = "file:///C:/Users/chris/Documents/test.nb.html")) %>%
  listenTo('Page.domContentEventFired') %>%
  sendToSession('Runtime.evaluate', params = list(expression = "!!window.PagedPolyfill")) %>%
  sendToSession('notpolyfill',
                callback = function(data) {
                  if (!isTRUE(data$result$result$value)) {
                    # Continue next pipe workflow only on condition
                    session$CDPSession$emit('notpolyfill')}
                }) %>%
  sendToSession("Page.printToPDF", params = list(printBackground = TRUE, preferCSSPageSize = TRUE)) %>%
  listenTo("Runtime.bindingCalled") %>%
  sendToSession("Page.printToPDF", params = list(printBackground = TRUE, preferCSSPageSize = TRUE)) %>%
  sendToSession("writetopdf",
                callback = function(data) {
                  cat("printing pdf...\n")
                  writeBin(jsonlite::base64_dec(data$result$data), "test.pdf")
                  cat("pdf printed.")
                })

# will launch all the registered events in sequence
page_session$emit('run')

page_session$close()
if(chrome$is_alive()) chrome$kill()
rm(list = ls())


# eventEmitter workflow -------------
work_dir <- chr_new_data_dir()

chrome <- chr_launch(work_dir = work_dir, headless = TRUE)

ws_endpoint <- chr_get_ws_addr(debug_port = 9222, type = 'page')

page_session <- CDPSession$new(ws_endpoint)

repeat {
  if (page_session$is_ready()) break
}


page_session$once("Runtime.executionContextCreated", function(...) cat("First command passed!"))
page_session$once("Runtime.enable",
                ~ page_session$sendCommand('Page.enable'))
page_session$once("Page.enable",
                ~ page_session$sendCommand('Runtime.addBinding', params = list(name = "pagedownListener")))
page_session$once("Runtime.addBinding",
                ~ page_session$sendCommand('Page.navigate',
                                         params = list(url = "file:///C:/Users/chris/Documents/test.nb.html")))
page_session$once('Page.domContentEventFired',
                ~ page_session$sendCommand('Runtime.evaluate',
                                           params = list(expression = "!!window.PagedPolyfill")
                ))
page_session$once("Runtime.evaluate",
                function(data) if (!isTRUE(data$result$result$value)) {
                    page_session$sendCommand("Page.printToPDF",
                                    params = list(printBackground = TRUE, preferCSSPageSize = TRUE))
})
page_session$once('Runtime.bindingCalled',
                ~ page_session$sendCommand("Page.printToPDF",
                                    params = list(printBackground = TRUE, preferCSSPageSize = TRUE)
                ))
page_session$once("Page.printToPDF",
               function(data) writeBin(jsonlite::base64_dec(data$result$data), "test.pdf"))

# will launch all the registered events in sequence
page_session$sendCommand('Runtime.enable')

page_session$close()
if(chrome$is_alive()) chrome$kill()
rm(list = ls())

