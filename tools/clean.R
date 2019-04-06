
clean_generated_R <- function(dry_run = FALSE) {
  generated_files <- list.files(here::here("R"), pattern = "^(events|commands)_", full.names = TRUE)
  if (dry_run) {
    generated_files
  } else {
    purrr::walk(
      generated_files,
      unlink
    )
  }
}

clean_generated_R(TRUE)
clean_generated_R()
