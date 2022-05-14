server <- function(input, output, session) {
  output$table <- reactable::renderReactable({
    #with_tooltip <- function(value, tooltip) {
    #  tags$abbr(style = "text-decoration: underline; text-decoration-style: dotted;",
    #            title = tooltip, value)
    #}
    agg_sales_df <- get_sales_df() |>
      dplyr::filter(org %in% input$selected_orgs) |>
      dplyr::group_by(org) |>
      dplyr::summarise(
        locations = dplyr::n(),
        total_daily_customers = sum(daily_customer_count, na.rm = T),
        avg_items_available = mean(items_available,  na.rm = T))
    agg_sales_df |>
      reactable::reactable(
        columns = list(
          org = reactable::colDef(
            name = "Managing Organzation",
            sortable = T,
            minWidth = 150
          ),
          locations = reactable::colDef(
            name = "Locations",
            sortable = T,
            align = "left",
            cell = function(value) {
              width <- paste0(value / max(agg_sales_df$locations) * 100, "%")
              bar_chart(value, width = width)
            }
          ),
          total_daily_customers = reactable::colDef(
            name = "Daily Customers",
            sortable = T,
            align = "left",
            # style = reactable::JS(),
            cell = function(value) {
              width <- paste0(value / max(agg_sales_df$total_daily_customers) * 100, "%")
              label <- scales::label_number(scale = 0.001, suffix = "K", big.mark = ",", accuracy = .1)(value)
              bar_chart(label, width = width)
            }
          ),
          avg_items_available = reactable::colDef(
            name = "Items Available (avg)",
            sortable = T,
            align = "left",
            cell = function(value) {
              width <- paste0(value / max(agg_sales_df$avg_items_available) * 100, "%")
              bar_chart(value, width = width)
            }
          )
        ),
        defaultSorted = "locations",
        defaultSortOrder = "desc",
        class = "reactable-table",
        rowClass = "reactable-row"
      )
  })
}
