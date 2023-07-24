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

summary(data$`TL (mm)`)
mean(data$`TL (mm)`)
# Mean = 322.67 mm
# Range = 169 - 506 mm
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
                                    theme_classic()+
                                theme(plot.title = element_text(hjust = 0.5))

# scale_x_continuous(breaks =  seq(0, 10, 1), limits = c(0, 10))+
# scale_y_continuous(breaks =  seq(0, 750, 50), limits = c(100, 750))+
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
  theme_classic()+
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
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))