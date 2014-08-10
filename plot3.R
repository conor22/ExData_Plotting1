## Exploratory Data Analysis
## Project 1: Plot 3

## Please ensure the "household_power_consumption.txt" dataset is in your working directory before starting
## The data can be downloaded from here [https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip]

## Read the data into memory
power <- read.table("household_power_consumption.txt", header=T, sep = ";", colClasses="character", na.strings="?")

## Convert the variables into the required classes
power$Time <- strptime(paste(power$Date,power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date,"%d/%m/%Y")


## Subset the data based on date paramters required  
sub_power <- subset(power, power$Date %in% as.Date(c("2007-02-01","2007-02-02")))


## Convert the rest if the variables in the subsetted data into numerics 
sub_power[,3] <- as.numeric(sub_power[,3])
sub_power[,4] <- as.numeric(sub_power[,4])
sub_power[,5] <- as.numeric(sub_power[,5])
sub_power[,6] <- as.numeric(sub_power[,6])
sub_power[,7] <- as.numeric(sub_power[,7])
sub_power[,8] <- as.numeric(sub_power[,8])
sub_power[,9] <- as.numeric(sub_power[,9])

## Ok - we should now have a correctly formatted and clean data set to plot on i.e 'sub_power'
## Create plot3
png(filename="plot3.png", width=480, height=480, units="px")
plot(sub_power[,2], sub_power[,7], type = "l", ylab="Energy sub metering", xlab="")
lines(sub_power[,2], sub_power[,8], col="red")
lines(sub_power[,2],sub_power[,9], col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=1)
dev.off()