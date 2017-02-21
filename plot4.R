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

# 4 multiple plots
par(mfrow = c(2, 2))

# plot 1- global active power
plot(DateTime, core_data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

# plot 2 - voltage
plot(DateTime, core_data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

# plot 3 - sub metering 
plot(DateTime, core_data$Sub_metering_1, xlab = "", ylab = "Energy sub metering",
     col = "black", type = "l")
lines(DateTime, core_data$Sub_metering_2, xlab = "", col = "red", type = "l")
lines(DateTime, core_data$Sub_metering_3, xlab = "", col = "blue", type = "l")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot 4 - global active power
plot(DateTime, core_data$Global_reactive_power, xlab = "datetime", type = "l")

title(main = "Plot 4", outer = T)

# copy all the plots to png file
dev.cur()
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()
