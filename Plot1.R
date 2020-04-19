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

# created png file
png(filename = "plot1.png", width = 480, height = 480)
# plot 1 
hist(hpc_subset$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
# close the png device!
dev.off() 
