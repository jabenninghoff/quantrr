# load example data from Excel
library(readxl)

widget_risks <- read_xlsx("data-raw/widget.xlsx", sheet = "Risks")
widget_estimates <- read_xlsx("data-raw/widget.xlsx", sheet = "Estimates")

usethis::use_data(widget_risks, widget_estimates, overwrite = TRUE, version = 3)
