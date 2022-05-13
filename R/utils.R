#' Get app path by name
#'
#' @importFrom stringr str_remove
#' @export
app_path <- function(app){
  path <- system.file("apps", app, "server.R", package = "shinyServerDemo")
  path <- stringr::str_remove(path, pattern = "/server.R")
  return(path)
}

#' Run app by name
#'
#' @importFrom shiny runApp
#' @importFrom fs path_wd
#' @export
run_app <- function(app, port, launch.browser, host, workerId, quiet, display.mode, test.mode){
  path <- app_path(app)
  shiny::runApp(
    appDir = path,
    port = rlang::maybe_missing(port, default = getOption("shiny.port")),
    launch.browser = rlang::maybe_missing(launch.browser, default = getOption("shiny.launch.browser", interactive())),
    host = rlang::maybe_missing(host, default = getOption("shiny.host", "127.0.0.1")),
    workerId = rlang::maybe_missing(workerId, default = ""),
    quiet = rlang::maybe_missing(quiet, default = FALSE),
    display.mode = rlang::maybe_missing(display.mode, default = c("auto", "normal", "showcase")),
    test.mode = rlang::maybe_missing(test.mode, default = getOption("shiny.testmode", FALSE))
  )
}
