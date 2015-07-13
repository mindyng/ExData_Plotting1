#Reading data
Electric <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Electric$Date <- as.Date(Electric$Date, format="%d/%m/%Y")

#Subsetting data
Electric1 <- subset(Electric, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Converting Date and Time variables
DateTime<-paste(as.Date(Electric1$Date), Electric1$Time)
Electric1$DT<-as.POSIXct(DateTime)

#Constructing plot4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(Electric1, {
  plot(Global_active_power~DT, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~DT, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~DT, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DT,col='Red')
  lines(Sub_metering_3~DT,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DT, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})

dev.off()