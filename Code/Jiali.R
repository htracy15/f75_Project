here::i_am("Code/Jiali.R")
path = here()

# read in data and clean
df <- read.csv(paste(path, "/Raw_Data/f75_interim.csv", sep=""))
df$treatment <- ifelse(df$arm == "Standard F75", "standard", "intervention")


library(gtsummary)
library(table1)

label(df$agemons) <- "Age in months"
label(df$sex) <- "Sex"
label(df$weight) <- "Weight in Kgs"
label(df$height) <- "Heigh/Length in Cms"
label(df$bfeeding) <- "Is the child still breastfeeding at all?"
label(df$diarrhoea) <- "Diarrhoea (3 or more loose stools in 24hrs)"
label(df$iconsciousness) <- "Impaired consciousness (AVPU=V,P or U)"
label(df$treatment) <- "Randomisation arm"

table_one <- table1( ~ agemons + sex + weight + height + bfeeding + diarrhoea + iconsciousness | treatment, data = df)

saveRDS(
  table_one,
  file = here::here("Output/table_one.rds")
)