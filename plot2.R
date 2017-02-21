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

# Plot 2 - line plot
# create a new variable indicating the day of week for each date
plot(DateTime, core_data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
title(main = "Plot 2", outer = T)

# copy plot to png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()