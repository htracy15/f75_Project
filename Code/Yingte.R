# load packages
library(vcd)
library(here)
library(ggplot2)
library(ggmosaic)

# define path
here::i_am("Code/Yingte.R")
path = here()

# read in data and clean
df = read.csv(paste(path,"/Raw_Data/f75_interim.csv",sep=""))
df$arm = ifelse(df$arm =='Standard F75',"Standard","Intervention")

# create mosaic plot
mosaicplot <- ggplot(data = df) +
  geom_mosaic(aes(x=product(hiv_results, arm), fill = arm)) +
  labs(title='Mosaic Plot')

#interpretation: We stratified the patients based on their gender, hiv-testing results, and treatments they received. 
# Most male and female babies participated in this studies have negative result for hiv-testing
# Standard F75 and intervention are given to both female and male babies in a 50-50 ratio 
#added some context

# save mosaic plot
ggsave(
  here::here("Output/mosaicplot.png"),
  plot = mosaicplot,
  device = "png"
)
