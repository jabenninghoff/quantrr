
<!-- README.md is generated from README.Rmd. Please edit that file -->

# quantrr <img src="man/figures/logo.png" align="right" alt="logo" width="120" />

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

First presented as a
[demo](https://jabenninghoff.github.io/security/analysis/rq-demo.html)
in my 2024 [SIRAcon](https://societyinforisk.org) talk, “[UnFAIR:
Simplifying and Expanding Technology Risk
Quantification](https://www.information-safety.org/2024/08/29/siracon-2024/).”

A rendered version of the standalone sample report is available
[here](https://jabenninghoff.github.io/quantrr/sample/).

## Quick Start

Detailed instructions are available in the [Introduction to
quantrr](https://jabenninghoff.github.io/quantrr/articles/quantrr.html)
vignette.

1.  Install the latest version of [R](https://cloud.r-project.org/) for
    your platform. Windows users will also need to install Rtools.
2.  Download and install the [Quarto
    CLI](https://quarto.org/docs/get-started/).
3.  Download and install the
    [Lato](https://www.latofonts.com/lato-free-fonts/) font family.
4.  Download and extract the “standalone” directory from this
    repository.
5.  Run `Rscript setup.R` from the command line in the standalone
    directory to install required R packages.
6.  Run `quarto preview` from the command line in the standalone
    directory to build and display the example analysis.

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
