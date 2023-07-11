#PLOTTING CHANGES OVER TIME FOR INDIVIDUAL LAKES#

# Data started as a column for each year with the lengths of individual fish in each year column. #
# Starting excel file = Joe_Cool_water_fishes_data_Joe
# Renamed in code below to "Decatur" because that was the lake used and it was a shorter name.
library(tidyverse)

# Load in data
data = readxl::read_excel("Data/JoeMasterData.xlsx")

# Clean data
DecaturWAE = data %>%
  filter(Species == "WAE", `Water Body`== "Decatur") %>%
  mutate(`Collection Date` = format(as.Date(`Collection Date`, format="%Y-%m-%d"),"%Y")) %>%
  select(`Collection Date`, `TL (mm)`)

colnames(DecaturWAE) = c("year", "lengths")
# Column names became "year" and "lenghts", will be referenced in later arguments.
#################################################################


######Creating the size bins###########################################
# seq(min value, max value, bin sizes)
# Naming the x axis bins "sizeclass"
# %>% and "remove_missing" used to remove the N/A's, so they don't show up in figure. 
lengths = DecaturWAE %>% 
                 mutate(sizeclass = cut(lengths, breaks = seq(100, 800, 100)))%>%
                 remove_missing()
#######################################################################


# PLOTTING
ggplot(lengths, aes(x=sizeclass, fill= year))+  # fill=year is to fill the bars different colors based on the year.
  geom_bar(position = position_dodge())  # position=position_dodge is what makes the grouped bars in each bin.


