# AGE DISTRIBUTION HISTOGRAMS

# WS Ages 

library(dplyr)
library(ggplot2)

readxl::read_excel("Data/JoeMasterData.xlsx")

# Clean data
age_distribution = data %>%
   filter(Species == "WAE", `Water Body` == "Decatur")%>%
   select('WS FINAL AGE')

age_distribution = mutate('WS FINAL AGE' = as.numeric('WS FINAL AGE'))

summary(age_distribution$`WS FINAL AGE`)
# Mean = 2.4 mm
# Range = 0-8 yrs


ggplot(age_distribution, aes(x='WS FINAL AGE'))+
      labs(title = "Lake Decatur", )
  
  
 