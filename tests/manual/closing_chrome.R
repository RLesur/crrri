###################################################################################
# To execute on linux becausse ps::ps_kill on windows is just a terminate call.
# this script as-is IS TO BE USED in docker/dockerfile-shinyverse
#
# ---         USE DOCKER             ---
# --- inside crrri project directory ---
#
# => docker build -t test-crrri-shinyverse:3.6.1 -f tests/manual/docker/dockerfile-shinyverse .
# => docker run -it --rm -v `pwd`:`pwd` -w `pwd` test-docker-crrrri R -e 'source("tests/manual/closing_chrome.R")'
# ** Check manually what happens
# Use this to be interactive:
# => docker run -it --rm -v `pwd`:`pwd` -w `pwd` test-docker-crrrri R
###################################################################################

# helper for printing
cat_info <- function(text, ...) {
  cli::cat_bullet(glue::glue(text), bullet_col = "green", bullet = "info")
}

# mark the processes that will be created to find them easily
marker <- ps::ps_mark_tree()

cli::cat_bullet("launch chrome in a new background R session")
rs <- callr::r_session$new(wait = TRUE)
R_pid <- rs$get_pid()
cat_info("R current pid is {Sys.getpid()}")
cat_info("R background pid is {R_pid}")
chrome_pid <- rs$run(function() {
  devtools::load_all(".")
  # remote <- Chrome$new()
  remote <- Chrome$new("google-chrome", extra_args = c("--disable-gpu", "--no-sandbox"))
  remote$.__enclos_env__$private$.process$get_pid()
})
cat_info("Chrome process pid is {chrome_pid}")
# chrome is running
chrome_process <- ps::ps_handle(chrome_pid)
cat_info("Chrome is running: {ps::ps_is_running(chrome_process)}")

# check if supervisor is launched")
processes <- ps::ps_find_tree(marker)
proc_names <- sapply(processes, ps::ps_name)
cat_info("supervisor is running: {any(grepl('supervisor', proc_names))}")
cli::cat_bullet("Programs that are running in the tree")
cat_info("{sapply(processes, ps::ps_name)} is running")

cli::cat_bullet("kill R without closing chrome")
ps::ps_kill(rs$as_ps_handle())
Sys.sleep(5L)
cat_info("R background (pid {R_pid}) is running: {ps::ps_is_running(rs$as_ps_handle())}")
cat_info("Chrome (pid {chrome_pid}) is running: {ps::ps_is_running(chrome_process)}")

processes <- ps::ps_find_tree(marker)
cat_info("There is {length(processes)} remaining process")
cat_info("{sapply(processes, ps::ps_name)} is running")

cli::cat_bullet(glue::glue("{crayon::green(ps$name)} (pid {ps$pid}) is still open as {crayon::red(ps$status)} (ps::ps() result)", ps = ps::ps()))

