dataFile <- "D:/Coursera/EDA/Project 1/household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")
subsetdata <- subset(data, Date== "1/2/2007"| Date=="2/2/2007")


globalActivePower <- as.numeric(subsetdata$Global_active_power)
png("plot 1.png", width = 480, height = 480)
hist(globalActivePower, col="red", main = "Global Active Power",xlab = "Global Active Power (kilowatt)")
dev.off()
  