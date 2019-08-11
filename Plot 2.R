rm(list=ls())
install.packages("data.table")
library("data.table")

## Load Data
setwd("C:/Karen/R/Course 4/Week 1")
data<-read.table(unzip("data.zip","household_power_consumption.txt"), header = TRUE, sep=";")
data_project<-data[data$Date %in% c("1/2/2007","2/2/2007"),]


globActP<-as.numeric(as.character(data_project$Global_active_power))

## Plot 2
png("Plot2.png", width = 480, height = 480)
dateTime<-strptime(paste(data_project$Date, data_project$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
plot(dateTime, globActP, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")     
dev.off()

