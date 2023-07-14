# MALE WSH KEY

# Uses same code as the female key


library(FSA)
library(FSAdata)
library(plotrix)
library(dplyr)

# Load in data
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
male_wsh_key = data %>%
  filter(Species=="WSH", Sex=="Male") %>%
  rename(TL = `TL (mm)`, Age = `O FINAL AGE`) %>%
  select(TL, Age) 



WSH.age <- subset(male_wsh_key, !is.na(Age)) # gets fish without NAs in age variable
# '!' does the reverse meaning of the function
str(WSH.age)      # Gives a preview of the data
# Should display lengths that have ages assigned already

WSH.age = mutate(.data=WSH.age, TL=as.numeric(TL)) #TL was character for me, changed to numeric

WSH.len <- subset(male_wsh_key, is.na(Age)) #gets fish with NAs in age variable (no '!')
str(WSH.len)      # Gives a preview of the data
# Should display lengths with NAs for 'Age' 


Summarize(~TL, data=WSH.age, digits=1)   # Use 'Summarize' from FSA package
# Could use FSA::Summarize(.......) to make sure
# Gets the min length to start your size bins with
WSH.age1 <- lencat(~TL, data = WSH.age, startcat = 300, w=10) #categorized fish by size bin
#startcat=300 because my min length was 309
#'w' dictates the range of bins
head(WSH.age1)       # Preview data

WSH.raw <- with(WSH.age1, table(LCat, Age))  #Lcat is default name for data frame with length bins created
# It was created with the lencat() function
# table('row variable', 'column variable')
WSH.key <- prop.table(WSH.raw, margin = 1)   # Assigning age-length probability table to object 'WSH.key'
round(WSH.key, 2)    # Displays the key in form of probability table

################################################################################

# ASSIGNING AGES TO INDIVIDUALS USING THE KEY CREATED ABOVE 

WSH.len = mutate(.data=WSH.len, TL=as.numeric(TL))
WSH.len1 <- alkIndivAge(WSH.key, Age~TL, data=WSH.len) #Gives data frame where each fish is assigned
#   an age according to the assigning method.
# Error: The minimum observed length in the length sample (346)
#   is less than the smallest length category in the age-length key (350).
#   You should include fish of these lengths in your age sample
#   or exclude fish of this length from your length sample.
# Warning message:The maximum observed length 
# in the length sample (695) is greater
# than the largest length category in the 
# age-length key (670).The last length category 
# will be treated as all-inclusive. 
head(WSH.len1)

WSH.comb <- rbind(WSH.age, WSH.len1)      # Original age sample data frame and modified length data frame
# combined into one
head(WSH.comb)  #preview

WSH.sum <- Summarize(TL~Age, data=WSH.comb, digits=2)  
print(WSH.sum)              # Displays the breakdown of lengths across ages

################################################################################

# PLOTTING THE CREATED AGE DATA

hist(~Age, data=WSH.comb, breaks=0:10, xlim=c(0,11), xlab="Age (yrs)", # Histogram of frequency of ages
     main="Saugey (WSH) Age Frequency", col = "grey")
# Add N for each age either onto
#    the figure or in description
plot(TL~jitter(Age), data=WSH.comb, ylab="Total Length (mm)", xlab="Age (jittered)")
# Plotting the fish as points
# Jitter added so fish with same metrics aren't graphed directly on top one another
#   Just for making the concetration of points more visible in an age category
lines(mean~Age, data=WSH.sum, col="blue", lwd=2)
#    Trying to add mean age at lengths line but not working
#    Error: 'object' is not a factor or character anddoes not fit the purpose of this function.

library(plotrix)
histStack(TL~Age, data=WSH.comb, breaks=seq(170,700,10), xlab="Total Length (mm)", 
          main = "Male Saugeye (WSH)", legend.pos = "topright")
# Different colors indicate age
#   Shows how much of the total for that length are a given age
#   You can add a legend but the placement keeps covering parts of the figure 