## Log of 2012 Milwaukee Parking Violations Data ##
## July 2013 - Excel file from city saved as CSV file##

setwd("~/Desktop/MKEParkingTixMap/ParkingTix")

library("ProjectTemplate")
# makde sure load_libraries setting in config/global.dcf file is set to "on"
load.project()

# load data
# data <- read.csv("./data/2012 tickets issued.csv")

data <- X2012.tickets.issued
str(data)
summary(data)
typeCount <- sort(table(data$VIODESCRIPTION), TRUE)
typeCount
barplot(head(typeCount))
qplot(VIODESCRIPTION, data = data, geom = "histogram")
summary(typeCount)

addressCount <- sort(table(data$LOCATIONDESC1), TRUE)
head(addressCount) #wow

table(duplicated(data)) # looks like there are 32 dupes
dupes <- data[duplicated(data),]
view(dupes)

# what about missing values?
null <- is.na(data)
table(null) #no missing values

# select random subset to geocode
set.seed(1133)
sampleKey <- sample(1:743833, 10000)
subset <- data[c(sampleKey),]
write.csv(subset,"./data/subset10K.csv")