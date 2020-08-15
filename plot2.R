dataFile <- "D:/Coursera/EDA/Project 1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";",stringsAsFactors = FALSE)
subsetdata <- subset(data, Date == "1/2/2007"|Date =="2/2/2007")

#str(subSetData)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()



