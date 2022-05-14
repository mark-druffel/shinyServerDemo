#' Get a sales data frame for demo
#'
#' @inheritParams shiny::selectInput
#'
#' @importFrom shiny selectInput
#' @importFrom rlang maybe_missing
#' @export
select_org <- function(label, selectize, multiple, selected, width, size){
  org_names <- readRDS(system.file("data", "org_names.rds", package = "shinyServerDemo"))
  dropdown <- shiny::selectInput(
    inputId = "selected_orgs",
    label = rlang::maybe_missing(label, default = "Managing Organization"),
    choices = org_names,
    selectize = rlang::maybe_missing(selectize, default = T),
    multiple = rlang::maybe_missing(multiple, default = T),
    selected = rlang::maybe_missing(selected, default = org_names),
    width = rlang::maybe_missing(selected, default =  400),
    size = rlang::maybe_missing(selected, NULL)
  )
  return(dropdown)
}
