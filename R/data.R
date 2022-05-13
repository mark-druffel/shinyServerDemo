#' Get a sales data frame for demo
#'
#' @references
#' \href{https://www.kaggle.com/datasets/surajjha101/stores-area-and-sales-data?resource=download}{Supermarket store branches sales analysis data set}
#'
#' @importFrom dplyr mutate
#' @importFrom dplyr case_when
#' @importFrom janitor clean_names
#' @export
get_sales_df <- function(){
  sales <- readRDS(system.file("data", "sales.rds", package = "shinyServerDemo")) |>
    janitor::clean_names("snake") |>
    dplyr::mutate(brand = dplyr::case_when(
      store_id <= 50 ~ "Kroger",
      store_id <= 55 ~ "Food 4 Less",
      store_id <= 68 ~ "Marianos",
      store_id <= 90 ~ "Fred Meyer",
      store_id <= 175 ~ "WalMart",
      store_id <= 200 ~ "HyVee",
      store_id <= 450 ~ "CVS",
      store_id <= 495 ~ "Rite-Aid",
      store_id <= 900 ~ "Walgreens",
      T ~ "Error"
      )) |>
    dplyr::mutate(org = dplyr::case_when(
      brand %in% c("Kroger", "Food 4 Less", "Marianos", "Fred Meyer") ~ "Kroger",
      brand %in% c("CVS", "Rite-Aid") ~ "CVS",
      T ~ brand
    ))
  return(sales)
}

#' @rdname get_sales_df
#' @export
get_org_names <- function(){
  org_names <- get_sales_df() |>
    dplyr::select(org) |>
    dplyr::distinct() |>
    dplyr::pull(org)
  return(org_names)
}
