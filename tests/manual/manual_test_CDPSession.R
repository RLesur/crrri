devtools::load_all()

work_dir <- chr_new_data_dir()

chrome <- chr_launch(work_dir = work_dir, headless = TRUE)

ws_endpoint <- chr_get_ws_addr(debug_port = 9222)

page_session <- CDPSession$new(ws_endpoint)

page_session$.__enclos_env__$private$.CDPSession_con$readyState()

# listening event
page_session$once("Runtime.executionContextCreated", function(...) cat("First command passed!"))

page_session$
  once("connect", ~ page_session$sendCommand('Runtime.enable'))$
  once("Runtime.enable", ~ page_session$sendCommand('Page.enable'))$
  once("Page.enable",
       ~ page_session$sendCommand('Runtime.addBinding',
                                  params = list(name = "pagedownListener")
       )
  )$
  once("Runtime.addBinding",
       ~ page_session$sendCommand('Page.navigate',
                                  params = list(url = "https://pagedown.rbind.io")
       )
  )$
  once('Page.domContentEventFired',
       ~ page_session$sendCommand('Runtime.evaluate',
                                  params = list(expression = "!!window.PagedPolyfill")
       )
  )$
  once("Runtime.evaluate",
       function(result) if (!isTRUE(result$result$value)) {
         page_session$sendCommand(
           "Page.printToPDF",
          params = list(printBackground = TRUE, preferCSSPageSize = TRUE)
         )
       }
  )$
  once('Runtime.bindingCalled',
       ~ page_session$sendCommand(
         "Page.printToPDF",
         params = list(printBackground = TRUE, preferCSSPageSize = TRUE)
       )
  )$
  once("Page.printToPDF",
       function(result) writeBin(jsonlite::base64_dec(result$data), "test.pdf")
  )

# connect
page_session$connect()

page_session$.__enclos_env__$private$.CDPSession_con$close()
if(chrome$is_alive()) chrome$kill()
rm(list = ls())
gc()
