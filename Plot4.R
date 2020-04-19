# Exploratory Data Analysis Course Project 1
# Student: Benedikt Thorarensen
# Date: 2020-04-19

# Loading data
# get household power consumption data
hpc <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", header = T, stringsAsFactors=FALSE)
# subset the dates we want to use
hpc_subset <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
# create a new date time variable 
hpc_subset$DateTime <- paste(hpc_subset$Date, hpc_subset$Time, sep=" ")
# put the new variable on a POXIXlt formar
hpc_subset$DateTime <- strptime(hpc_subset$DateTime, "%d/%m/%Y %H:%M:%S")
# put char variable to numeric
hpc_subset$Global_active_power = as.numeric(hpc_subset$Global_active_power)
hpc_subset$Sub_metering_1 = as.numeric(hpc_subset$Sub_metering_1)
hpc_subset$Sub_metering_2 = as.numeric(hpc_subset$Sub_metering_2)
hpc_subset$Sub_metering_3 = as.numeric(hpc_subset$Sub_metering_3)
hpc_subset$Voltage = as.numeric(hpc_subset$Voltage)
hpc_subset$Global_reactive_power = as.numeric(hpc_subset$Global_reactive_power)

# created png file
png(filename = "plot4.png", width = 480, height = 480)
# plot 4
par(mfcol = c(2,2))
# part 1 (plot 2)
with(hpc_subset,plot(DateTime,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
# part 2 (plot 3)
with(hpc_subset,plot(DateTime,Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="n"))
with(hpc_subset,lines(DateTime,Sub_metering_1, col = "black"))
with(hpc_subset,lines(DateTime,Sub_metering_2, col = "red"))
with(hpc_subset,lines(DateTime,Sub_metering_3, col = "blue"))
legend("topright", lty = c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), box.lty = 0, inset = 0.01)
# part 3 (new plot)
with(hpc_subset,plot(DateTime,Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
# part 4 (new plot)
with(hpc_subset,plot(DateTime,Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
# close the png device!
dev.off() 
