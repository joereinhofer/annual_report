# AGE DISTRIBUTION HISTOGRAMS

# WS Ages 

library(dplyr)
library(ggplot2)
library(plotrix)

readxl::read_excel("Data/JoeMasterData.xlsx")

data = readxl::read_excel("Data/JoeMasterData.xlsx", 
                          col_types = c("numeric", "numeric", "text", 
                                        "text", "text", "text", "text", "text", 
                                        "numeric", "numeric", "text", "text", 
                                        "numeric", "text", "numeric", "text", 
                                        "text", "numeric", "numeric", "text", 
                                        "numeric", "numeric", "text", "text", 
                                        "numeric", "text", "text", "numeric", 
                                        "numeric", "numeric", "numeric", 
                                        "numeric", "numeric", "numeric", 
                                        "text", "numeric", "text", "text", 
                                        "numeric", "text", "numeric", "numeric", 
                                        "numeric", "numeric", "numeric", 
                                        "numeric", "numeric", "numeric", 
                                        "numeric", "numeric", "numeric", 
                                        "numeric", "numeric", "numeric", 
                                        "numeric", "numeric", "numeric", 
                                        "numeric", "numeric", "numeric", 
                                        "numeric", "numeric", "numeric", 
                                        "numeric", "numeric", "text", "numeric", 
                                        "numeric"))

# Clean data
ages = data %>%
   filter(Species == "WSH", `Water Body` == "Dawson")%>%
   select('WS FINAL AGE')%>%
   remove_missing()

summary(ages)
std.error(ages)
nrow(ages)
# Mean = 
# Range = 
# SE = 

# ages = mutate(ages, grouped_ages = cut('WS FINAL AGE', breaks = seq(0,8,1)))


ggplot(ages, aes(x=`WS FINAL AGE`))+
      geom_bar() +
      labs(title = "Dawson Lake", caption = "Mean = 3.5 ± 0.1 yrs, Range = 1-11 yrs")+
      theme_classic()+
      theme(plot.title = element_text(hjust = 0.5))+
      scale_x_continuous(labels = seq(0, 11, 1), breaks=seq(0,11,1))+
      scale_y_continuous(limits = c(0,120), breaks = seq(0,120, 10))+
      xlab("Whole Spine Age (yrs)")+ ylab("Frequency")

# commit changes 
      
      

  
 