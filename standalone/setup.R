# install or update all packages needed by quantrr

writeLines("Installing required R packages from CRAN...\n")
install.packages(
  c(
    "downlit", "dplyr", "formattable", "ggplot2", "janitor", "plotly",
    "purrr", "quarto", "readxl", "tibble", "validate", "xml2"
  )
)

writeLines("Installing required R packages from GitHub...\n")
install.packages("remotes")
remotes::install_github("jabenninghoff/quantrr")

writeLines("Installation complete!")
