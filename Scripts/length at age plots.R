# LENGTH AT AGE PLOTS
# Using whole spine ages 
# data was two columns, whole spine final age (wsfage) and length (tl) 

# DECATUR ########
library(ggplot2)
library(tidyverse)

# Load in data
data = readxl::read_excel("Data/JoeMasterData.xlsx")

# Clean data
age_at_length_figures_for_lakes = data %>%
  filter(`Water Body` == "Decatur", Species == "WAE")

ggplot(age_at_length_figures_for_lakes, aes(x=`WS FINAL AGE`, y=`TL (mm)`))+
        geom_point()+ geom_smooth(se = FALSE) +
        ggtitle("Lake Decatur")+
        xlab("Age") + ylab("Total Length (mm)")+  # note in report they are WS ages
        theme(plot.title = element_text(hjust = 0.5))+
  scale_x_continuous(breaks =  seq(0, 8, 1))
#############################################




          
          
        