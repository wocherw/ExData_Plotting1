# load data.
setwd("D:/Coursera/04 Exploratory Data Analysis/Project1")
data01 <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "")

# using data from the dates 2007-02-01 and 2007-02-02. 
data.02.01 <- unique(subset(data01, Date == "1/2/2007"))
data.02.02 <- unique(subset(data01, Date == "2/2/2007"))
rm(data01)

# Merge data set
data.02 <- merge(data.02.01, data.02.02, all=TRUE)
rm(data.02.01)
rm(data.02.02)

# Create date time column
data.02$date_time <- strptime(paste(data.02$Date, data.02$Time), "%d/%m/%Y %H:%M:%S")

# Convert Global Active Power to Numeric
data.02$Global_active_power <- as.numeric(as.character(data.02$Global_active_power))

#------------------------------------------------------------------------------------------------------------------------------------
# Plot 1
# histogram of Global Active Power in Red
# x-axis : Global Active Power (kilowatts)
# y-axis : Frequency (0-1200)
#------------------------------------------------------------------------------------------------------------------------------------

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png(filename='plot1.png',width=480,height=480,units='px')
par(mfrow = c(1, 1), mar = c(5, 4, 2, 1))
hist(data.02$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()  ## Don't forget to close the PNG device!

rm(data.02)

