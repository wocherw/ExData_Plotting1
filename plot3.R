# load data.
setwd("D:/Coursera/04 Exploratory Data Analysis/Project1")
data01 <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "")

# using data from the dates 2007-02-01 and 2007-02-02. 
data.02.01 <- unique(subset(data01, Date == "1/2/2007"))
data.02.02 <- unique(subset(data01, Date == "2/2/2007"))

# Merge data set
data.02 <- merge(data.02.01, data.02.02, all=TRUE)
rm(data.02.01)
rm(data.02.02)

# Create date time column
data.02$date_time <- strptime(paste(data.02$Date, data.02$Time), "%d/%m/%Y %H:%M:%S")
rm(data01)

# Convert Global Active Power to Numeric
data.02$Global_active_power <- as.numeric(as.character(data.021$Global_active_power))

#------------------------------------------------------------------------------------------------------------------------------------
# Plot 3
# 
# x-axis : Energy sub metering (0-40)
# y-axis : Thu  Fri  Sat
# Legend
#------------------------------------------------------------------------------------------------------------------------------------

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png(filename='plot3.png',width=480,height=480,units='px')
par(mfrow = c(1, 1), mar = c(5, 4, 2, 1))

with(data.02, plot(date_time, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering"))
with(subset(data.02), lines(date_time, Sub_metering_2, col="red"))
with(subset(data.02), lines(date_time, Sub_metering_3, col="blue"))

legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()  ## Don't forget to close the PNG device!

rm(data.02)
