devtools::load_all()

work_dir <- chr_new_data_dir()

chrome <- chr_launch(work_dir = work_dir, headless = TRUE)

ws_endpoint <- chr_get_ws_addr(debug_port = 9222)

page_session <- CDPSession$new(ws_endpoint)

page_session$.__enclos_env__$private$.CDPSession_con$readyState()

# listening event
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
                ~ page_session$send("Page.printToPDF",
                                    params = list(printBackground = TRUE, preferCSSPageSize = TRUE)
                ))
page_session$once("Page.printToPDF",
               function(data) writeBin(jsonlite::base64_dec(data$result$data), "test.pdf"))


page_session$sendCommand('Runtime.enable')




page_session$.__enclos_env__$private$.CDPSession_con$close()
if(chrome$is_alive()) chrome$kill()
rm(list = ls())

