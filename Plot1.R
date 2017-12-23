rm(list = ls())
# Set working directory
setwd("F:\\iStudy\\Data World\\Coursera_EDA\\Project 1")

#Read the file and subset it from the dates
exdata1<-read.csv("household_power_consumption.txt", header= T, sep=';',na.strings = "?", nrows=207529, 
                  stringsAsFactors = F, comment.char ="",check.names = FALSE)
exdata1<-subset(exdata1, Date %in% c("1/2'2007","2/2/2007"))

#Format he Date
exdata1$Date<-as.Date(exdata1$Date, format="%d/%m/%Y")

exdata1$datetime <- strptime(paste(exdata1$Date, exdata1$Time), "%Y-%m-%d %H:%M:%S")

# Draw the histogram
hist(exdata1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
