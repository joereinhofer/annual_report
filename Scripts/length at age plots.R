# LENGTH AT AGE PLOTS
# Using whole spine ages 


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
                      ggtitle("Lake Decatur Walleye")+
                      xlab("Age (Whole Spine)") + ylab("Total Length (mm)")+  # note in report they are WS ages
                     scale_x_continuous(breaks =  seq(0, 8, 1))+
                     scale_y_continuous(breaks =  seq(0, 750, 50))+
                     theme_classic()+ 
                     theme(plot.title = element_text(hjust = 0.5))
  
#############################################



library(ggplot2)
library(tidyverse)
source("functions/plot_age_at_length.R")

# Load in data
data = readxl::read_excel("Data/JoeMasterData.xlsx")

# Clean data
age_at_length_figures_for_lakes = data %>%
  filter(`Water Body` == "Decatur", Species == "WAE")

plot_age_at_length(age_at_length_figures_for_lakes, "Lake Decatur Walleye") 

          
          
        