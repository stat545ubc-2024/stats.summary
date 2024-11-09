
<!-- README.md is generated from README.Rmd. Please edit that file -->

# stats.summary

<!-- badges: start -->
<!-- badges: end -->

The goal of stats.summary is calculate the mean, range, standard
deviation, and coefficient of variation for specific numeric data
columns that are grouped by at least one column (but could be grouped by
more than one column)

## Installation

You can install the development version of stats.summary like so:

``` r
devtools::install_github("stat545ubc-2024/stats.summary")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(stats.summary)
library(tibble)

#Example data frame of a sample of zooplankton, category is the type of zooplankton observed in the sample, size is the size of that zooplankton, and count is the number of individuals that are in that category and are that size.
Zooplankton_sample <- tibble(category = c("Copepod", "Euphausid", "Copepod", "Euphausid"), size = c(1.1, 2.4, 1.5, 2.2), count = c(10, 15, 12, 17))

#Lets say we want to find out the range of sizes for all copepods in the sample

# Now we will run the function to find out this information
stats_summary(Zooplankton_sample, groups = "category", summaries = c("size", "count"))
#> # A tibble: 2 × 9
#>   category  size_mean size_range size_sd size_cv count_mean count_range count_sd
#>   <chr>         <dbl>      <dbl>   <dbl>   <dbl>      <dbl>       <dbl>    <dbl>
#> 1 Copepod         1.3      0.4     0.283   21.8          11           2     1.41
#> 2 Euphausid       2.3      0.200   0.141    6.15         16           2     1.41
#> # ℹ 1 more variable: count_cv <dbl>
```
