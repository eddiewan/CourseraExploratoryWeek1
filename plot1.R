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

## Creating the plot
plottedData <- as.numeric(subset$Global_active_power)
png("plot1.png", width=480, height=480)

## Create only 1 plot
par(mfrow = c(1,1))

hist(plottedData, xlab = 'Global Active Power (kilowatts)', main = "Global Active Power", col = "red")
dev.off()
     