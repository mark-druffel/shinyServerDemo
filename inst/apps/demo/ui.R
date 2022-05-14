ui <- shiny::fluidPage(
  tags$head(
    shiny::tags$title("Table Demo"),
    shiny::includeCSS(system.file("assets", "css", "reactable.css", package = "shinyServerDemo")),
    #prismDependencies
  ),
  shiny::div(
    class = "main",
    shiny::div(
      class = "filter_bar",
      shiny::h5("Filters", class = "title"),
      select_org()
    ),
    reactable::reactableOutput("table")
  )
)

