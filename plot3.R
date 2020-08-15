readdata <- "D:/Coursera/EDA/Project 1/household_power_consumption.txt"
data <- read.table(readdata, header=TRUE, sep= ";")
subsetdata <- subset(data, Date=="1/2/2007"|Date=="2/2/2007")

#transform to numeric vektor
subsetdata <- transform(subsetdata, Sub_metering_1=as.numeric(as.character(Sub_metering_1)))
subsetdata <- transform(subsetdata, Sub_matering_2=as.numeric(as.character(Sub_metering_2)))
subsetdata <- transform(subsetdata, Sub_matering_3=as.numeric(as.character(Sub_metering_3)))

#concetenate to date time column
subsetdata$DateTime <- paste(subsetdata$Date, subsetdata$Time, sep=" ")

#convert DateTime to POSIXlt vector
subsetdata$DateTime <- strptime(subsetdata$DateTime, "%d/%m/%Y %H:%M:%S")
#grphic device png
png(file="plot3.png", height = 480, width = 480)

#ploting
plot(subsetdata$DateTime, subsetdata$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab = "")
lines(subsetdata$DateTime, subsetdata$Sub_metering_2, type = "l", col="red")
lines(subsetdata$DateTime, subsetdata$Sub_metering_3, type="l", col="blue")

#Legends
legend("topright",col=c("black","red","blue"), lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#close and save
dev.off()
