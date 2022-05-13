server <- function(input, output, session) {
  output$table <- reactable::renderReactable({
    get_sales_df() |>
      dplyr::filter(org %in% input$selected_orgs) |>
      reactable::reactable()
  })
}
