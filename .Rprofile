options(
  warnPartialMatchArgs = TRUE,
  warnPartialMatchAttr = TRUE,
  warnPartialMatchDollar = TRUE,
  renv.config.crandb.enabled = TRUE,
  styler.cache_root = "styler-perm"
)

source("renv/activate.R")

# attach devtools and set options per https://r-pkgs.org/setup.html
if (interactive()) {
  suppressMessages(require(devtools))
  suppressMessages(require(rdev))
  if (!suppressMessages(suppressWarnings(require(pkgload::pkg_name("."), character.only = TRUE)))) {
    devtools::load_all(".")
  }
  # install pre-commit git hook when cloning repository
  if (!fs::file_exists(".git/hooks/pre-commit")) {
    cat("git hook pre-commit missing, installing...\n")
    usethis::use_git_hook(
      "pre-commit", readLines(fs::path_package("rdev", "templates", "pre-commit"))
    )
  }
  # warn if pandoc not found in PATH
  if (Sys.which("pandoc") == "") warning("pandoc not found, run `open /Applications/RStudio.app`")
}
