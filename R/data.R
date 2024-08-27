#' Widget System Risks
#'
#' Data from the "Risks" tab of the Widget System example spreadsheet, imported with
#'   [readxl::read_xlsx()]. Contains 3 risks.
#'
#' @format
#' A data frame with 3 rows and 2 columns:
#' \describe{
#'   \item{Risk}{Risk short name}
#'   \item{Description}{Risk long description}
#' }
"widget_risks"

#' Widget System Estimates
#'
#' Data from the "Estimates" tab of the Widget System example spreadsheet, imported with
#'   [readxl::read_xlsx()]. Contains estimates on each of 3 risks from 7 different experts,
#'   including blanks (`NA`) for estimates not provided by an expert.
#'
#' @format
#' A data frame with 21 rows and 6 columns:
#' \describe{
#'   \item{Risk}{Risk short name from "Risks" tab}
#'   \item{Expert}{Name of Subject Matter Expert (SME) who provided the estimate}
#'   \item{Frequency (per yer)}{Loss Event Frequency estimate}
#'   \item{Low (5%)}{5th percentile estimate of Loss Event Magnitude}
#'   \item{High (95%)}{95th percentile estimate of Loss Event Magnitude}
#'   \item{Most Likely}{50th percentile estimate of Loss Event Magnitude (median)}
#' }
"widget_estimates"
