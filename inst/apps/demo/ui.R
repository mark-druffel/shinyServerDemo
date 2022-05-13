ui <- shiny::fluidPage(
  tags$head(
    shiny::tags$title("Table Demo"),
    #includeCSS("/Users/mark.druffel/Documents/GitHub/reactableDemo/inst/apps/css/demo.css"),
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
