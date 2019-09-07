### Peer-graded Assignment: Course Project 1

### plot3.R

### installing and/or loading "data.table" package

if (!"data.table" %in% installed.packages()) {install.packages("data.table")}
library(data.table)

### download the dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./Dataset.zip")

### unzip the dataset 
unzip(zipfile="./Dataset.zip")

### load the dataset (missing values are coded as '?')
dt <- fread(input = "household_power_consumption.txt"
            , na.strings="?")

### Create a DateTimeClasses POSIXct column
dt[, datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

### Extract from the dates 2007-02-01 and 2007-02-02
dt <- dt[(datetime >= "2007-02-01") & (datetime < "2007-02-03")]

### Start the PNG bitmap device
png("plot3.png", width=480, height=480)

### Plot 3
plot(dt[, datetime], dt[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(dt[, datetime], dt[, Sub_metering_2],col="red")
lines(dt[, datetime], dt[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

### Turn off the device
dev.off()
