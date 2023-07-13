# ABUNDANCE FIGURE BY SPECIES (THIS CODE IS FOR SAUGER)

# N=104

library(ggplot2)
library(dplyr)


#  Load in data
data = readxl::read_excel("Data/JoeMasterData.xlsx")

# Clean data
Joe_Cool_water_fishes_data_Joe = data %>%
  filter(Species == "SAR") %>%
  rename(SAR = `TL (mm)`)

#########Placing the data into size bins###################################
# seq(min value, max value, bin sizes)
Joe_Cool_water_fishes_data_Joe = mutate(Joe_Cool_water_fishes_data_Joe, 
               SAR_bins = cut(SAR, breaks = seq(0,800,100)))
##############################################################################

##########PLotting#########################################################
ggplot(Joe_Cool_water_fishes_data_Joe, aes(x=SAR_bins))+
                                       geom_bar()+
                                       xlab("Length Bins (mm)")+
                                       ylab("Frequency")+
                                       ggtitle("Sauger (SAR)")+
                                   scale_y_continuous(breaks =  seq(0, 60, 10))+
                                    theme_bw()+
                                theme(plot.title = element_text(hjust = 0.5))