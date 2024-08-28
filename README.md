
<!-- README.md is generated from README.Rmd. Please edit that file -->

# quantrr

<!-- badges: start -->

[![R-CMD-check](https://github.com/jabenninghoff/quantrr/workflows/R-CMD-check/badge.svg)](https://github.com/jabenninghoff/quantrr/actions)
[![lint](https://github.com/jabenninghoff/quantrr/workflows/lint/badge.svg)](https://github.com/jabenninghoff/quantrr/actions)
[![Codecov test
coverage](https://codecov.io/gh/jabenninghoff/quantrr/graph/badge.svg)](https://app.codecov.io/gh/jabenninghoff/quantrr)
<!-- badges: end -->

## Overview

**Quantify and Report (Technology) Risk:** A streamlined tool designed
to make it easier to quantify risk using expert estimation. Given expert
estimates for loss frequency and magnitude, generate a report that
forecasts losses by risk and in aggregate.

## Quick Start

1.  Install the latest version of R for your platform from
    <https://cloud.r-project.org/>. Windows users will also need to
    install Rtools.
2.  Download and install the [Quarto
    CLI](https://quarto.org/docs/get-started/).
3.  Download and extract the “standalone” directory from this
    repository.
4.  Run `RScript setup.R` from the standalone directory to install
    required R packages.
5.  Run `quarto preview` from the standalone directory to build and
    display the example analysis.

## Installation

You can install the development version of quantrr from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("jabenninghoff/quantrr")
```

Or using renv:

``` r
# install.packages("renv")
renv::install("jabenninghoff/quantrr")
```

## Development

- Changelog: See “Changelog” or `NEWS.md`.
- Planned: [TODO](TODO.md)
