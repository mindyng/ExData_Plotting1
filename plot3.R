#Reading data
Electric <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Electric$Date <- as.Date(Electric$Date, format="%d/%m/%Y")

#Subsetting data
Electric1 <- subset(Electric, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Converting Date and Time variables
DateTime<-paste(as.Date(Electric1$Date), Electric1$Time)
Electric1$DT<-as.POSIXct(DateTime)

#Constructing plot3
png(file = "plot3.png", width = 480, height = 480)
with(Electric1, {
  plot(Sub_metering_1~DT, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DT,col='Red')
  lines(Sub_metering_3~DT,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
