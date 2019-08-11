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

