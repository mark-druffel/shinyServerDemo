#' Convert reactable table column to a bar chart
#'
#' @importFrom htmltools div
#' @export

bar_chart <- function(label, width = "100%", height = "16px", fill = "#3169EB", background = NULL) {
  bar <- htmltools::div(
    class = "reactable-bar",
    title = label,
    style = list(background = fill, width = width, height = height)
  )
  chart <- htmltools::div(style = list(flexGrow = 1, marginLeft = "8px", background = background), bar)
  barchart <- htmltools::div(style = list(display = "flex", alignItems = "center"), chart)
  return(barchart)
}
