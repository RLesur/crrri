# from a question https://community.rstudio.com/t/webscarping-rvest-output-list-of-0/29625

# Using CRRRI

devtools::load_all()

# does not dump the correct DOM
# keeping just for example
dump_DOM2 <- function(url) {
  # require for crrri to be configured to find chrom
  chrome <- Chrome$new()
  on.exit(chrome$close())
  client <- hold(chrome$connect())
  Page <- client$Page
  DOM <- client$DOM
  Page$enable() %...>% {
    DOM$enable()
  } %...>% {
    Page$navigate(url)
    Page$loadEventFired()
  } %...>% {
    DOM$getDocument()
  } %...>% {
    DOM$getOuterHTML(nodeId = .$root$nodeId)
  } %>% {
    hold(.)$outerHTML
  }
}

dump_DOM <- function(url) {
  # require for crrri to be configured to find chrom
  chrome <- Chrome$new()
  on.exit(chrome$close())
  client <- hold(chrome$connect())
  Network <- client$Network
  Page <- client$Page
  Runtime <- client$Runtime
  Page$enable() %...>% {
    Network$enable()
  } %...>% {
    Network$setCacheDisabled(cacheDisabled = TRUE)
  } %...>% {
    Page$navigate(url)
  } %...>% {
    Page$loadEventFired()
  } %...>% {
    Runtime$evaluate(
      expression = 'document.documentElement.outerHTML'
    )
  } %>% {
    hold(.)$result$value
  }
}

dom <- dump_DOM(url = "https://sofifa.com/player/230621")
library(rvest)
html <- read_html(dom)
nb_nodes <- html %>%
  html_nodes("#version-jump > option") %>%
  length()
testthat::expect_gt(nb_nodes, 1)

html %>% html_node("#version-jump > option:nth-child(1)") %>% html_text()
html %>% html_node("#version-jump > option:nth-child(2)") %>% html_text()
