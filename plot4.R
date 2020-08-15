rdata <- "D:/Coursera/EDA/Project 1/household_power_consumption.txt"
data <- read.table(rdata, header = TRUE, sep=";")
subsetdata <- subset(data, Date== "1/2/2007"| Date=="2/2/2007")

#convert string vector to numeric vector
datetime <- strptime(paste(subsetdata$Date,subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subsetdata$Global_active_power)
globalReactivePower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)

png(file="plot4.png")
par(mfrow=c(2,2))

plot(datetime,globalActivePower, type="l",xlab="",ylab="Global Active Power")
plot(datetime,voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type = "l", ylab="Energy sub metering", xlab = "")
lines(datetime, subMetering2, type = "l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(datetime,globalReactivePower, type="l", ylab = "Global_reactive_power", xlab="datetime")

dev.off()
