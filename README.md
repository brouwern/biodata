
# biodata

<!-- badges: start -->
<!-- badges: end -->

The goal of biodata is provide example datasets from througout the biology and the life sciences, and to provide worked analyses.


## Installation

The developement version of biodata is on GitHub.  If you don't already have it, you will need to install the devtools package

``` r
install.packages("devtools")
```

You can then install the `r biodata` from GitHub with:

``` r
devtools::install_github("brouwern/biodata")
```


## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(biodata)
hist(human_gene_lengths)
```

