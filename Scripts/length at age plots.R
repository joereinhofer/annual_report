# LENGTH AT AGE PLOTS
# Using whole spine ages 
# data was two columns, whole spine final age (wsfage) and length (tl) 

# DECATUR ########
library(ggplot2)
library(tidyverse)
data=age_at_length_figures_for_lakes

ggplot(age_at_length_figures_for_lakes, aes(x=wsfage, y=tl))+
        geom_point()+ geom_smooth(se = FALSE) +
        ggtitle("Lake Decatur")+
        xlab("Age") + ylab("Total Length (mm)")+  # note in report they are WS ages
        theme(plot.title = element_text(hjust = 0.5))+
  scale_x_continuous(breaks =  seq(0, 8, 1))
#############################################




          
          
        