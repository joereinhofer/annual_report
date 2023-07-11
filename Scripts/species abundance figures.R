# ABUNDANCE FIGURE BY SPECIES (THIS CODE IS FOR SAUGER)

# I added a sheet in excel that contained only the sauger lengths
# The sauger data could probably be isolated within R, but this was easier for now

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
                                       ggtitle("Sauger")
