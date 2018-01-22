#plot3.r  produces plot3.png 
zipFileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFileName <- "powercon.zip"
download.file(zipFileUrl,destFileName)
unzip(destFileName,exdir=".")
readData <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character","character",rep("numeric",7)),na.strings="?")
dataToPlot <- subset(readData,readData$Date=="1/2/2007" | readData$Date == "2/2/2007")
dataToPlot$Date <- as.Date(dataToPlot$Date,format="%d/%m/%Y")
dataToPlot$DateTime <- as.POSIXct(paste(dataToPlot$Date,dataToPlot$Time))
Sys.setlocale("LC_TIME","English")
png("plot3.png",480,480)
plot(dataToPlot$DateTime, dataToPlot$Sub_metering_1,"n",xlab = "",ylab = "Energy sub metering") 
points(dataToPlot$DateTime, dataToPlot$Sub_metering_1, type = "line")
points(dataToPlot$DateTime, dataToPlot$Sub_metering_2, type = "line", col = "red")
points(dataToPlot$DateTime, dataToPlot$Sub_metering_3, type = "line", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"),lty = c(1, 1, 1))
dev.off()

