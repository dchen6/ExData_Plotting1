require(data.table)
require(dplyr)

getwd()
setwd("C:\\Users\\Chen De\\Desktop\\Coursera - DS\\Exploratory Data Analysis\\ExData_Plotting1")
list.files()
rm(list = ls())

# read in raw data
mdata <- fread("household_power_consumption/household_power_consumption.txt", na.strings="?", data.table = T)

# combine date and time
str(mdata)
mdata$DateTime <- paste(mdata$Date, mdata$Time)

# subset the whole data by dates
mdata$Date <- as.Date(mdata$Date, "%d/%m/%Y")
core_data <- mdata %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")
DateTime <- strptime(core_data$DateTime, "%d/%m/%Y %H:%M:%S")

# Plot 1 - histogram of global active power
hist(core_data$Global_active_power, col = "Red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
title(main = "Plot 1", outer = T)

# save plot in png
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
