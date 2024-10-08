# install or update all packages needed by quantrr

writeLines("Installing required R packages from CRAN...\n")
install.packages(
  c("dplyr", "formattable", "ggplot2", "janitor", "plotly", "purrr", "readxl", "tibble", "validate")
)

writeLines("Installing required R packages from GitHub...\n")
install.packages("remotes")
remotes::install_github(c("jabenninghoff/jbplot", "jabenninghoff/quantrr"))

writeLines("Installation complete!")
