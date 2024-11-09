library(stats.summary)
library(tibble)

Zooplankton_sample <- tibble(category = c("Copepod", "Euphausid", "Copepod", "Euphausid"), size = c(1.1, 2.4, 1.5, 2.2), count = c(10, 15, 12, 17))

stats_summary(Zooplankton_sample, groups = "category", summaries = c("size", "count"))

test_that("stats_summary returns correct summary statistics", {
  result <- stats_summary(Zooplankton_sample, groups = "category", summaries = c("size", "count"))
  expect_equal(nrow(result), 2) # We need to make sure it had 2 unique groups: "Copepod" and "Euphausid"
  expect_equal(ncol(result), 9) # Is there 2 grouping columns + 4 stats for each summary column?
  expected_colnames <- c("category", "size_mean", "size_range", "size_sd", "size_cv",
                         "count_mean", "count_range", "count_sd", "count_cv")
  expect_equal(colnames(result), expected_colnames) #are the column names as expected?
  expect_equal(result$size_mean[result$category == "Copepod"], mean(Zooplankton_sample$size[Zooplankton_sample$category == "Copepod"]))
  expect_equal(result$count_mean[result$category == "Euphausid"], mean(Zooplankton_sample$count[Zooplankton_sample$category == "Euphausid"])) #are the mean values correct for each group?
  cv_size_a <- sd(Zooplankton_sample$size[Zooplankton_sample$category == "Copepod"]) / mean(Zooplankton_sample$size[Zooplankton_sample$category == "Copepod"]) * 100
  expect_equal(result$size_cv[result$category == "Copepod"], cv_size_a) #does the cv fall within an expected range?
})
