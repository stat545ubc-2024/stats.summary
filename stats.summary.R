#' Summary of Grouped Statistics (stats_summary)
#'
#' The function calculates the mean, range, standard deviation, and coefficient of variation for specific data
#' columns that are grouped by at least one column (but could be grouped by more than one column).
#'
#' @param data This is for your data table and will be the data that the function calculates from.
#' @param groups This should be a character vector of column names that the function will group the rest of the
#' calculations by. It is named `groups`.
#' @param summaries This is a character vector of column names that the function will summarize. It is named `summaries`.
#'
#' @return A tibble data set that shows the summary statistics (mean, range, standard deviation, and coefficient of
#' variation) for all columns described in `summaries`. Each of the summary statistics will be grouped by the columns
#' described in `groups`
#'
#' @import dplyr
#' @import tibble
#' @importFrom stats sd
#'
#' @examples
#'library(tibble)
#' Salinity_timeseries <- tibble(Site = c("S1", "S1", "S1", "S1", "S2", "S2", "S2", "S2",
#'   "S1", "S1", "S1", "S1", "S2", "S2", "S2", "S2"), Season = c("Summer", "Fall", "Winter",
#'   "Spring", "Summer", "Fall", "Winter", "Spring", "Summer", "Fall", "Winter", "Spring",
#'   "Summer", "Fall", "Winter", "Spring"), Year = c(2020, 2020, 2020, 2020, 2020, 2020,
#' 2020, 2020, 2021, 2021, 2021, 2021, 2021, 2021, 2021, 2021), Salinity = c(28, 25, 19,
#'   26, 27, 10, 17, 16, 19, 26, 23, 15, 31, 25, 20, 25))
#'
#' stats_summary(Salinity_timeseries, groups = c("Site", "Season"), summaries = "Salinity")
#'
#' @export
stats_summary <- function(data, groups, summaries) {
  data %>%
    group_by(across(all_of(groups))) %>%
    summarise(
      across(
        all_of(summaries),
        list(
          mean = mean,
          range = ~ max(.x, na.rm = TRUE) - min(.x, na.rm = TRUE),
          sd = sd,
          cv = ~ sd(.x, na.rm = TRUE) / mean(.x, na.rm = TRUE) * 100),
        .names = "{.col}_{.fn}"),
      .groups = "drop")}
