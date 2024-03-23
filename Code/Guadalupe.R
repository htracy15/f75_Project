#load packages
library(here)
library(ggplot2)

# define path
here::i_am("Code/Guadalupe.R")
path = here()

# read in data and clean
df = read.csv(paste(path,"/Raw_Data/f75_interim.csv",sep=""))
df$arm = ifelse(df$arm =='Standard F75',"standard","intervention")

#set x and y variables
# y = arm circumference (muac)
# x = milk formula group (receive_f751)

#create boxplot at baseline
box_plot1 <- ggplot(df, aes(x= arm, y = muac)) +
  geom_boxplot(fill = "lightblue", alpha = 0.2) + 
  xlab("Received F75 milk feed") + 
  ylab("Middle-Upper Arm Circumference at Baseline")

#create boxplot at discharge
box_plot2 <- ggplot(df, aes(x= arm, y = muac2)) +
  geom_boxplot(fill = "lightblue", alpha = 0.2) + 
  xlab("Received F75 milk feed") + 
  ylab("Middle-Upper Arm Circumference at Discharge")

# save box plots
ggsave(
  filename = here::here("Output", "box_plot1.png"),
  plot = box_plot1, 
  device = "png"
)

ggsave(
  filename = here::here("Output", "box_plot2.png"), 
  plot = box_plot2,
  device = "png"
)