# ABUNDANCE FIGURE BY SPECIES 


# Sauger (SAR)##########

# N=104

library(ggplot2)
library(dplyr)

#  Load in data
data = readxl::read_excel("Data/JoeMasterData.xlsx")

# Clean data
Joe_Cool_water_fishes_data_Joe = data %>%
  filter(Species == "SAR") %>%
  rename(SAR = `TL (mm)`)

#Placing the data into size bins
Joe_Cool_water_fishes_data_Joe = mutate(Joe_Cool_water_fishes_data_Joe, 
               SAR_bins = cut(SAR, breaks = seq(0,800,100))) # seq(min value, max value, bin sizes)

# Plotting
ggplot(Joe_Cool_water_fishes_data_Joe, aes(x=SAR_bins))+
                                       geom_bar()+
                                       xlab("Total Length Bins (mm)")+
                                       ylab("Frequency")+
                                       ggtitle("Sauger (SAR)")+
                                   scale_y_continuous(breaks =  seq(0, 60, 10))+
                                    theme_bw()+
                                theme(plot.title = element_text(hjust = 0.5))
###############################################################################


# Walleye (WAE)

# N= 778 (nrow() gives popultion size)

library(ggplot2)
library(dplyr)

#  Load in data
data = readxl::read_excel("Data/JoeMasterData.xlsx")

# Clean data
Joe_Cool_water_fishes_data_Joe = data %>%
  filter(Species == "WAE") %>%
  rename(WAE = `TL (mm)`)

#Placing the data into size bins
Joe_Cool_water_fishes_data_Joe = mutate(Joe_Cool_water_fishes_data_Joe, 
                                        WAE_bins = cut(WAE, breaks = seq(0,800,100))) # seq(min value, max value, bin sizes)

# Plotting
ggplot(Joe_Cool_water_fishes_data_Joe, aes(x=WAE_bins))+
  geom_bar()+
  xlab("Total Length Bins (mm)")+
  ylab("Frequency")+
  ggtitle("Walleye (WAE)")+
  scale_y_continuous(breaks =  seq(0, 250, 20))+
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5))
################################################################################

# Saugeye (WSH)

# N=1044 

library(ggplot2)
library(dplyr)

#  Load in data
data = readxl::read_excel("Data/JoeMasterData.xlsx")

# Clean data
Joe_Cool_water_fishes_data_Joe = data %>%
  filter(Species == "WSH") %>%
  rename(WSH = `TL (mm)`)

#Placing the data into size bins
Joe_Cool_water_fishes_data_Joe = mutate(Joe_Cool_water_fishes_data_Joe, 
                                        WSH_bins = cut(WSH, breaks = seq(0,800,100))) # seq(min value, max value, bin sizes)

# Plotting
ggplot(Joe_Cool_water_fishes_data_Joe, aes(x=WSH_bins))+
  geom_bar()+
  xlab("Total Length Bins (mm)")+
  ylab("Frequency")+
  ggtitle("Saugeye (WSH)")+
  scale_y_continuous(breaks =  seq(0, 400, 50))+
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5))