rm(list=ls())
install.packages("data.table")
library("data.table")

## Load Data
setwd("C:/Karen/R/Course 4/Week 1")
data<-read.table(unzip("data.zip","household_power_consumption.txt"), header = TRUE, sep=";")
data_project<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Plot 1
png("Plot1 .png", width = 480, height=480)
globActP<-as.numeric(as.character(data_project$Global_active_power))
hist(globActP, col="red",main="Global Active Power",
                        xlab = "Global Active Power", ylab = "Frequency")
dev.off()

## Plot 2
png("Plot2.png", width = 480, height = 480)
dateTime<-strptime(paste(data_project$Date, data_project$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
plot(dateTime, globActP, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")     
dev.off()

## Plot 3
par(mfrow=c(1,1))
png("Plot3.png", width = 480, height = 480)
plot(dateTime, as.numeric(data_project$Sub_metering_1), type = "l", xlab= " ", ylab="Energy sub metering")
lines(dateTime, as.numeric(as.character(data_project$Sub_metering_2)), type="l", col="red")
lines(dateTime, as.numeric(as.character(data_project$Sub_metering_3)), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"))
dev.off()

## Plot 4
png("Plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))
plot(dateTime, globActP, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")     

plot(dateTime, as.numeric(data_project$Sub_metering_1), type = "l", xlab= " ", ylab="Energy sub metering")
lines(dateTime, as.numeric(as.character(data_project$Sub_metering_2)), type="l", col="red")
lines(dateTime, as.numeric(as.character(data_project$Sub_metering_3)), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black","red","blue"), cex=0.3)

plot(dateTime, as.numeric(as.character(data_project$Voltage)), type="l", ylab="Voltage")
plot(dateTime, as.numeric(as.character(data_project$Global_reactive_power)), type="l", ylab="Global_reactive_power")
dev.off()
