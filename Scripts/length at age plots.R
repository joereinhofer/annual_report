# LENGTH AT AGE PLOTS
# Using whole spine ages 


# DECATUR ########
library(ggplot2)
library(tidyverse)

# Load in data
data = readxl::read_excel("Data/JoeMasterData.xlsx")

# Clean data
age_at_length_figures_for_lakes = data %>%
  filter(`Water Body` == "Weldon Springs", Species == "WSH")

ggplot(age_at_length_figures_for_lakes, aes(x=`WS FINAL AGE`, y=`TL (mm)`))+
                      geom_point()+ geom_smooth() +
                      ggtitle("Weldon Springs")+
                      xlab("Whole Spine Age (yrs)") + ylab("Total Length (mm)")+  # note in report they are WS ages
                     scale_x_continuous(breaks =  seq(0, 11, 1))+
                     scale_y_continuous(breaks =  seq(0, 750, 50))+
                     theme_classic()+ 
                     theme(plot.title = element_text(hjust = 0.5))
  
####################################################################



library(ggplot2)
library(tidyverse)
source("functions/plot_age_at_length.R")

# Load in data
data = readxl::read_excel("Data/JoeMasterData.xlsx")

# Clean data
age_at_length_figures_for_lakes = data %>%
<<<<<<< HEAD
  filter(`Water Body` == "Dawson", Species == "WSH")

plot_age_at_length(age_at_length_figures_for_lakes, "Dawson Lake Saugeye") 
=======
  filter(`Water Body` == "Weldon Springs", Species == "WSH")

plot_age_at_length(age_at_length_figures_for_lakes, "Weldon Springs Lake") 
>>>>>>> 79a884f621d5ba7941e004db6b1931bf8ff59ea0




          
        