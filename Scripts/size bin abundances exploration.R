# ABUNDANCE FIGURE BY SPECIES 


# Sauger (SAR)################

# N=104

library(ggplot2)
library(dplyr)
library(plotrix)

#  Load in data
data = readxl::read_excel("Data/JoeMasterData.xlsx")

# Clean data
Joe_Cool_water_fishes_data_Joe = data %>%
  filter(Species == "SAR") %>%
  rename(SAR = `TL (mm)`)

summary(Joe_Cool_water_fishes_data_Joe$SAR)
sd(Joe_Cool_water_fishes_data_Joe$SAR)
std.error(Joe_Cool_water_fishes_data_Joe$SAR)
# Mean = 322.7 mm
# Range = 169 - 506 mm
# Std Dev = 79.2
# SE of mean = 7.8

#Placing the data into size bins
Joe_Cool_water_fishes_data_Joe = mutate(Joe_Cool_water_fishes_data_Joe, 
                                        SAR_bins = cut(SAR, breaks = seq(0,800,100))) # seq(min value, max value, bin sizes)

# Plotting
ggplot(Joe_Cool_water_fishes_data_Joe, aes(x=SAR_bins))+
  labs(title = "Sauger")+
  geom_bar()+
  xlab("Total Length Bins (mm)")+
  ylab("Frequency")+
  scale_x_discrete(labels = c("100-200", "200-300", "300-400", "400-500", "500-600"))+
  scale_y_continuous(limits = c(0,60), breaks =  seq(0, 60, 10))+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))

# labs(title = "Sauger", caption = "Mean = 322.7 ± 7.8 mm, Range = 169-506 mm")

###############################################################################


# Walleye (WAE)

# N= 778 nrow() gives popultion size

library(ggplot2)
library(dplyr)
library(plotrix)

#  Load in data
data = readxl::read_excel("Data/JoeMasterData.xlsx")

# Clean data
Joe_Cool_water_fishes_data_Joe = data %>%
  filter(Species == "WAE") %>%
  rename(WAE = `TL (mm)`)

summary(Joe_Cool_water_fishes_data_Joe$WAE)
sd(Joe_Cool_water_fishes_data_Joe$WAE)
std.error(Joe_Cool_water_fishes_data_Joe$WAE)
# Mean = 355.1 mm
# Range = 140-718 mm 
# SD = 127.53 mm
# SE of mean = 4.6 mm

#Placing the data into size bins
Joe_Cool_water_fishes_data_Joe = mutate(Joe_Cool_water_fishes_data_Joe, 
                                        WAE_bins = cut(WAE, breaks = seq(0,800,100))) # seq(min value, max value, bin sizes)

# Plotting
ggplot(Joe_Cool_water_fishes_data_Joe, aes(x=WAE_bins))+
  geom_bar()+
  xlab("Total Length Bins (mm)")+
  ylab("Frequency")+
  labs(title = "Walleye")+
  scale_y_continuous(limits = c(0, 260), breaks =  seq(0, 260, 20))+
  scale_x_discrete(labels = c("100-200", "200-300", "300-400", "400-500", "500-600", "600-700", "700-800"))+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))

# labs(title = "Walleye", caption = "Mean = 355.1 ± 4.6 mm, Range = 140-718 mm")

################################################################################

# Saugeye (WSH)

# N=1044 

library(ggplot2)
library(dplyr)
library(plotrix)

#  Load in data
data = readxl::read_excel("Data/JoeMasterData.xlsx")

# Clean data
Joe_Cool_water_fishes_data_Joe = data %>%
  filter(Species == "WSH", `Water Body` == "Weldon Springs") %>%
  rename(WSH = `TL (mm)`)

summary(Joe_Cool_water_fishes_data_Joe$WSH)
sd(Joe_Cool_water_fishes_data_Joe$WSH)
std.error(Joe_Cool_water_fishes_data_Joe$WSH)
# Mean = 446.2 mm
# Range = 174-695 mm 
# SD = 105.5 mm
# SE of the mean = 3.3 mm

#Placing the data into size bins
Joe_Cool_water_fishes_data_Joe = mutate(Joe_Cool_water_fishes_data_Joe, 
                                        WSH_bins = cut(WSH, breaks = seq(0,800,10))) # seq(min value, max value, bin sizes)
# breaks = seq(0,800,50)
# breaks = seq(0,800,25)
# breaks = seq(0,800,20)
# breaks = seq(0,800,10)


# Plotting
ggplot(Joe_Cool_water_fishes_data_Joe, aes(x=WSH_bins))+
  geom_bar()+
  xlab("Total Length Bins (mm)")+
  ylab("Frequency")+
  labs(title = "Saugeye")+
  geom_text(stat = 'count', aes(label = ..count..))+
  scale_y_continuous(limits = c(0,20), breaks =  seq(0, 20, 1))+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5))



# ggplot(data=dat, aes(x=Types, y=Number, fill=sample)) + 
 # geom_bar(position = 'dodge', stat='identity') +
 # geom_text(aes(label=Number), position=position_dodge(width=0.9), vjust=-0.25)


# scale_x_discrete(labels = c("100-200", "200-300", "300-400", "400-500", "500-600", "600-700"))
# labs(title = "Saugeye", caption = "Mean = 446.2 ± 3.3 mm, Range = 174-695 mm")