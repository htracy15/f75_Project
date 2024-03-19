here::i_am("Code/render_report.R")

library(rmarkdown)

report <- render("report.Rmd", output_dir = here::here(""))