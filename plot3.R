##load libraries
library(dplyr)

urlZip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileZip <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists(fileZip)) {
        download.file(urlZip, fileZip, mode = "wb")
}

dataFolder <- ""

if(!file.exists(dataFolder)) {
        unzip(fileZip)
}

dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

## select only relevant dates
subset <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]

## change date and time format
subset$Date <- as.Date(subset$Date, format ="%d/%m/%Y")
subset$datetime <- strptime(paste(subset$Date, subset$Time), "%Y-%m-%d %H:%M:%S")

head(subset)

## Creating the plot
png("plot3.png", width=480, height=480)

## Create only 1 plot
par(mfrow = c(1,1))

plot(subset$datetime, subset$Sub_metering_1, type = "l", xlab = "", ylab ="Energy sub metering")
points(subset$datetime, subset$Sub_metering_2, type = "l", col = "red")
points(subset$datetime, subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red","blue"), lty =1)
dev.off()
