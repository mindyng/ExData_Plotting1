#Reading data
Electric <- read.table("household_power_consumption.txt", header=TRUE, sep=';', colClasses=c("character", "character", rep("numeric",7)), na="?")
Electric1 <- Electric[Electric$Date == "1/2/2007" | Electric$Date == "2/2/2007",]

Electric1$Time<-strptime(paste(Electric1$Date, Electric1$Time), "%d,%m,%Y %H:%M:%S")
Electric1$Date<-as.Date(Electric1$Date, "%d/%M/%Y")

#Constructing plot1
hist(Electric1$Global_active_power,
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col= "red")
     
dev.off()