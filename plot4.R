setwd("F:\\iStudy\\Data World\\Coursera_EDA\\Project 1")

exdata1<-read.csv("household_power_consumption.txt", header= T, sep=';',na.strings = "?", nrows=207529, 
                  stringsAsFactors = F, comment.char ="",check.names = FALSE)
exdata1<-subset(exdata1, Date %in% c("1/2'2007","2/2/2007"))

exdata1$Date<-as.Date(exdata1$Date, format="%d/%m/%Y")
exdata1$datetime <- strptime(paste(exdata1$Date, exdata1$Time), "%Y-%m-%d %H:%M:%S")
bufdttm <- paste(as.Date(exdata1$Date), exdata1$Time)
exdata1$Datetime <- as.POSIXct(bufdttm)

par(mfrow=c(2,2), mar=c(4,4,2,1))
with(exdata1, {
  plot(Global_active_power~Datetime, type="l",
  ylab = "Global Active Power (kilowatts)")

  plot(Voltage~Datetime, type="l", 
  ylab="Voltage (volt)", xlab="")
  
  plot(Sub_metering_1~Datetime, type="l", 
  ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
  ylab="Global Rective Power (kilowatts)",xlab="")

})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()