# from Rlesur/crrri@feature/build-on-cdp-session
# tested with 59747341


devtools::load_all()

# launch
work_dir <- chr_new_data_dir()
chrome <- chr_launch(work_dir = work_dir, headless = TRUE)

# get ws endpoint
ws_endpoint <- chr_get_ws_addr(debug_port = 9222, type = 'page')

# create the connexion to a page
page_session <- CDPSession$new(ws_endpoint)

# just check if connexion ready - To wrap in a function
repeat {
  if (page_session$is_ready()) break
}

url <- "https://www.r-project.org/"

# Object required for the piped workflow
session <- list(CDPSession = page_session)
res <- NULL
session %>%
  sendToSession("Page.enable", listener = 'run') %>%
  sendToSession("DOM.enable") %>%
  sendToSession("Page.navigate", params = list(url = url)) %>%
  listenTo("Page.loadEventFired") %>%
  sendToSession("DOM.getDocument") %>%
  sendToSession("DOM.getOuterHTML",
                callback = function(data) {
                  nodeId <- data$result$root$nodeId
                  session$CDPSession$sendCommand("DOM.getOuterHTML", params = list(nodeId = nodeId))
                }) %>%
  sendToSession("getres", callback = function(data) {
    res <<- data$result
  })

# run the workflow
page_session$emit("run")

while(is.null(res)) {
  later::run_now()
}
res

# close everything
page_session$close()
if(chrome$is_alive()) chrome$kill()
rm(list = ls())

## With Event Emitters API -----------------

# The previous exemple is a pipe workflow build on top of event emitter.
# Here is how it look with event emitter directly

work_dir <- chr_new_data_dir()
chrome <- chr_launch(work_dir = work_dir, headless = TRUE)

# get ws endpoint
ws_endpoint <- chr_get_ws_addr(debug_port = 9222, type = 'page')

# create the connexion to a page
page_session <- CDPSession$new(ws_endpoint)

# just check if connexion ready - To wrap in a function
repeat {
  if (page_session$is_ready()) break
}

url <- "https://www.r-project.org/"


res <- NULL
page_session$once("run", ~ page_session$sendCommand('Page.enable'))
page_session$once("Page.enable", ~ page_session$sendCommand('DOM.enable'))
page_session$once("DOM.enable", ~ page_session$sendCommand('Page.navigate', list(url = url)))
page_session$once("Page.loadEventFired", ~ page_session$sendCommand('DOM.getDocument'))
page_session$once("DOM.getDocument", function(data) {
  page_session$sendCommand("DOM.getOuterHTML", list(nodeId = data$result$root$nodeId))
})
page_session$once("DOM.getOuterHTML", function(data) {res <<- data$result})

# run the workflow
page_session$emit("run")

while(is.null(res)) {
  later::run_now()
}
res

page_session$close()
if(chrome$is_alive()) chrome$kill()
rm(list = ls())
