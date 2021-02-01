
<!-- README.md is generated from README.Rmd. Please edit that file -->

# zSocial <img src="man/figures/logo.png" align="right" height="139" />

<!-- badges: start -->
<!-- badges: end -->

The goal of zSocial is to provide users with a one-stop shop to pull and
query social media data ( + visualize) from multiple API endpoints in R.
There are many great R packages which pull API data from RESTful (and
other) endpoints, this package works on top of them to simplify common
user flows and aggregate package loading + functions.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ctzn-pub/zSocial")
```

## Example

This is a basic example which shows you how to use the `searchUS`
function, which returns an excel workbook with data from Google Trends
in the USA.

``` r
library(zSocial)

searchUS(c("Donald Trump", "Joe Biden"), "politics" )
```

``` r
##See the data 
data<- rio::import("politics_US.xlsx", sheet ="interest_over_time")
knitr::kable(head(data))
```

| date       | hits | keyword      | geo | time | gprop | category |
|:-----------|:-----|:-------------|:----|:-----|:------|---------:|
| 2004-01-01 | 3    | Donald Trump | US  | all  | web   |        0 |
| 2004-02-01 | 2    | Donald Trump | US  | all  | web   |        0 |
| 2004-03-01 | 2    | Donald Trump | US  | all  | web   |        0 |
| 2004-04-01 | 4    | Donald Trump | US  | all  | web   |        0 |
| 2004-05-01 | 1    | Donald Trump | US  | all  | web   |        0 |
| 2004-06-01 | 1    | Donald Trump | US  | all  | web   |        0 |
