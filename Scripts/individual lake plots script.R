#PLOTTING CHANGES OVER TIME FOR INDIVIDUAL LAKES#

# Data started as a column for each year with the lengths of individual fish in each year column. #
# Starting excel file = Joe_Cool_water_fishes_data_Joe
# Renamed in code below to "Decatur" because that was the lake used and it was a shorter name.

Decatur <- Joe_Cool_water_fishes_data_Joe
 
###### Converting to long form with year and length linked together###########
# Instead of years just being column names, each length has its associated year in a cell next to it. 
# Converts columns to just year and length
library(tidyverse)
pivot_longer(Decatur, colnames(Decatur))

longformdata <- pivot_longer(Decatur, colnames(Decatur))
# Named the new dataframe "longformdata" 

colnames(longformdata) = c("year", "lengths")
# Column names became "year" and "lenghts", will be referenced in later arguments.
#################################################################


######Creating the size bins###########################################
# seq(min value, max value, bin sizes)
# Naming the x axis bins "sizeclass"
# %>% and "remove_missing" used to remove the N/A's, so they don't show up in figure. 
lengths = longformdata %>% 
                 mutate(sizeclass = cut(lengths, breaks = seq(100, 800, 100)))%>%
                 remove_missing()
#######################################################################


###########Plotting###############################################
# fill=year is to fill the bars different colors based on the year.
# position=position_dodge is what makes the grouped bars in each bin.
ggplot(lengths, aes(x=sizeclass, fill= year))+
  geom_bar(position = position_dodge())
#################################################################




# FISH ADDED TO MASTER, THIS IS THE UP TO DATE PLOT

Decatur <- JoeMasterData

library(tidyverse)
pivot_longer(Decatur, colnames(Decatur))

longform <- pivot_longer(Decatur, colnames(Decatur))

colnames(longform) = c("year", "TL")

TL = longform %>%
       mutate(sizebins = cut(TL, breaks = seq(0,800,100)))%>%
       remove_missing()

ggplot(TL, aes(x=sizebins, fill=year))+
          geom_bar(position=position_dodge())+
           ggtitle("Decatur")+
          xlab("Size Bins")+ ylab("Frequency")

