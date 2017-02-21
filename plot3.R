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

# plot3 - line plots by sub-metering groups
dev.off()
plot(DateTime, core_data$Sub_metering_1, xlab = "", ylab = "Energy sub metering",
     col = "black", type = "l")
lines(DateTime, core_data$Sub_metering_2, xlab = "", col = "red", type = "l")
lines(DateTime, core_data$Sub_metering_3, xlab = "", col = "blue", type = "l")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
title(main = "Plot 3", outer = T)

# copy the plot to png file
dev.cur()
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()
