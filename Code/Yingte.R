# load packages
library(vcd)
library(here)

# define path
here::i_am("Code/Yingte.R")
path = here()

# read in data and clean
df = read.csv(paste(path,"/Raw_Data/f75_interim.csv",sep=""))
df$treatment = ifelse(df$arm=='Standard F75',"standard","intervention")

# create mosaic plot
mosaic_plot = mosaic( ~  treatment + hiv_results + sex, highlighting = "treatment", highlighting_fill = c("lightblue", "pink"),data = df)

#interpretation: We stratified the patients based on their gender, hiv-testing results, and treatments they received. 
# Most male and female babies participated in this studies have negative result for hiv-testing
# Standard F75 and intervention are given to both female and male babies in a 50-50 ratio 
#added some context

# save mosaic plot
saveRDS(
  mosaic_plot,
  file = here::here("output", "mosaic_plot.rds")
)
