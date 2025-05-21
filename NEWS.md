# quantrr 1.1.5

* Removed dependency on Lato font family

* Added cross-platform scripts for standalone site

* Simplified standalone installation instructions

# quantrr 1.1.4

* Reduce number of simulations in `calc_risk()` to resolve `code-link` issue and improve performance

# quantrr 1.1.3

* Updated for R 4.5.0

* Updated for Quarto 1.7

* Added code folding to template and example

# quantrr 1.1.2

* Minor updates

# quantrr 1.1.1

* Improved test coverage

* Added quantrr hex sticker logo

* Updated installation instructions including Quick Start

# quantrr 1.1.0

Updated Standalone Quarto site example:

* Replaced `stopifnot()` in import data validation check with warnings to review validation results

* Added 'typical' losses in Forecast section using the [geometric mean](https://en.wikipedia.org/wiki/Geometric_mean)

* Added percentage of years with no losses to the Forecast section

* Loss Exceedance Curves now use a `log10` scale to improve readability

Added new functions:

* `gmean()`: calculate the geometric mean

* `check_validation()`: raise warnings if there were issues with data validation

Other updates:

* Updated Template to match Standalone site example

* Add rendered standalone report sample to online documentation

# quantrr 1.0.1

* Updated with links to original demo and talk

# quantrr 1.0.0

First full release. Includes the following features:

* "Risk Analysis Report" R Markdown Template for RStudio

* "Standalone" Quarto site that implements the template and includes the "Widget Management System" example

* Full documentation at <https://jabenninghoff.github.io/quantrr/> and a Quick Start Guide in the README

Planned, not yet implemented:

* Logo/Icon

* "Risk Modeling with quantrr" vignette

# quantrr 0.1.0

Initial release. Implements basic package structure and two core functions:

* `lnorm_param()`: calculate the parameters of a log normal distribution from the 0.05 and 0.95 quantiles

* `calc_risk()`: quantify risk using a Poisson distribution for loss event frequency, and a log-normal distribution for loss event magnitude
