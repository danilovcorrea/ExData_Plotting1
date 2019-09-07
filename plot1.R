### Peer-graded Assignment: Course Project 1

### plot1.R

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

### Convert the Date
dt[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

### Extract from the dates 2007-02-01 and 2007-02-02
dt <- dt[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

### Start the PNG bitmap device
png("plot1.png", width=480, height=480)

### Plot 1 histogram
hist(dt[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

### Turn off the device
dev.off()