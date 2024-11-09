library(stats.summary)
library(tibble)

Salinity_timeseries <- tibble(Site = c("S1", "S1", "S1", "S1", "S2", "S2", "S2", "S2", "S1", "S1", "S1", "S1", "S2", "S2", "S2", "S2"), Season = c("Summer", "Fall", "Winter", "Spring", "Summer", "Fall", "Winter", "Spring", "Summer", "Fall", "Winter", "Spring", "Summer", "Fall", "Winter", "Spring"), Year = c(2020, 2020, 2020, 2020, 2020, 2020, 2020, 2020, 2021, 2021, 2021, 2021, 2021, 2021, 2021, 2021), Salinity = c(28, 25, 19, 26, 27, 10, 17, 16, 19, 26, 23, 15, 31, 25, 20, 25))

stats_summary(Salinity_timeseries, groups = c("Site", "Season"), summaries = "Salinity")

test_that("stats_summary works for Salinity_timeseries", {
  result <- stats_summary(Salinity_timeseries, groups = c("Site", "Year"), summaries = "Salinity")
  expect_equal(nrow(result), 4) # We need to make sure it had 8, 4 seasons for each of 2 sites
  expect_equal(ncol(result), 6) # Is there 2 grouping columns + 4 stats for each summary column?
  expected_colnames <- c("Site", "Year", "Salinity_mean", "Salinity_range", "Salinity_sd", "Salinity_cv")
  expect_equal(colnames(result), expected_colnames)
})
