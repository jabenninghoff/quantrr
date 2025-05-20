# remove quarto build files

unlink(c("_freeze", ".quarto", "html"), recursive = TRUE)
