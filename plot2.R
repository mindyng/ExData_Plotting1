#Reading data
Electric <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Electric$Date <- as.Date(Electric$Date, format="%d/%m/%Y")

#Subsetting data
Electric1 <- subset(Electric, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Converting Date and Time variables
DateTime<-paste(as.Date(Electric1$Date), Electric1$Time)
Electric1$DT<-as.POSIXct(DateTime)

#Constructing plot2
plot(Electric1$Global_active_power~Electric1$DT, type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

dev.off()

