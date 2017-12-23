setwd("F:\\iStudy\\Data World\\Coursera_EDA\\Project 1")

exdata1<-read.csv("household_power_consumption.txt", header= T, sep=';',na.strings = "?", nrows=207529, 
                  stringsAsFactors = F, comment.char ="",check.names = FALSE)
exdata1<-subset(exdata1, Date %in% c("1/2'2007","2/2/2007"))

exdata1$Date<-as.Date(exdata1$Date, format="%d/%m/%Y")
exdata1$datetime <- strptime(paste(exdata1$Date, exdata1$Time), "%Y-%m-%d %H:%M:%S")

#str(exdata1$DateTime)

exdata1$DateTime<-as.POSIXct(exdata1$datetime)   

plot(exdata1$Global_active_power~exdata1$DateTime, type="l",
     ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
