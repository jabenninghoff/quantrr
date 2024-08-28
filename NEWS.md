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
