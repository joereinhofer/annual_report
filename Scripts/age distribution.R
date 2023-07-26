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
   filter(Species == "WAE", `Water Body` == "Decatur")%>%
   select('WS FINAL AGE')%>%
   remove_missing()

summary(ages)
std.error(ages)
sd(ages)
# Mean = 2.4 ± 0.11 yrs
# Range = 0-8 yrs
# SE = 0.11


ggplot(ages, aes(x='WS FINAL AGE'))+
       geom_bar()+
      labs(title = "Lake Decatur", caption = "Mean = 2.4 ± 0.11 yrs, Range = 0-8 yrs")+
     theme(plot.title = element_text(hjust = 0.5))
      theme_classic()+
      xlab("Age (yrs)")+ ylab("Frequency")
      
      
  
  
 