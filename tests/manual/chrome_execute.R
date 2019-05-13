devtools::load_all(".")
pdf_rproject <- function(client) {
  Page <- client$Page

  Page$enable() %...>% { # await enablement of the Page domain
    Page$navigate(url = "https://www.r-project.org/")
    Page$loadEventFired() # await the load event
  } %...>% {
    Page$printToPDF()
  } %...>% { # await PDF reception
    write_base64(., "r_project.pdf")
  }
}

pdf_rstudio <- function(client) {
  Page <- client$Page

  Page$enable() %...>% { # await enablement of the Page domain
    Page$navigate(url = "https://rstudio.com/")
    Page$loadEventFired() # await the load event
  } %...>% {
    Page$printToPDF()
  } %...>% { # await PDF reception
    write_base64(., "rstudio.pdf")
  }
}

perform_with_chrome(pdf_rproject)

perform_with_chrome(pdf_rproject, pdf_rstudio)

async_save_as_pdf <- function(url) {
  function(client) {
    Page <- client$Page

    Page$enable() %...>% {
      Page$navigate(url = url)
      Page$loadEventFired()
    } %...>% {
      Page$printToPDF()
    } %...>%
      write_base64(paste0(httr::parse_url(url)$hostname, ".pdf"))
  }
}

save_as_pdf <- function(...) {
  list(...) %>%
    purrr::map(async_save_as_pdf) %>%
    perform_with_chrome(.list = .)
}

save_as_pdf("https://www.r-project.org/", "https://rstudio.com/")

maf = function(client) {1}

a= perform_with_chrome(maf)
