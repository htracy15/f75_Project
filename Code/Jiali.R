library(here)
library(labelled)
library(gtsummary)

here::i_am("Code/Jiali.R")
path = here()

# read in data and clean
df <- read.csv(paste(path, "/Raw_Data/f75_interim.csv", sep=""))


var_label(df) <- list(
  agemons = "Age in months",
  sex = "Sex",
  weight = "Weight in Kgs",
  height = "Heigh/Length in Cms",
  bfeeding = "Is the child still breastfeeding at all?",
  diarrhoea = "Diarrhoea (3 or more loose stools in 24hrs)",
  iconsciousness = "Impaired consciousness (AVPU=V,P or U)"
)

df$treatment <- ifelse(
  df$arm == "Standard F75", 
  "Standard", 
  "Intervention"
)

table_one <- df |>
  select("treatment", "sex", "agemons", "weight", "height", 
         "bfeeding", "diarrhoea", "iconsciousness") |>
  tbl_summary(by = treatment) |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Treatment Group**") |>
  add_overall() |>
  add_p()

saveRDS(
  table_one,
  file = here::here("Output/table_one.rds")
)
