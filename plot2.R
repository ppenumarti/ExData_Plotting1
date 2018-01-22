#plot2.r  produces plot2.png 
zipFileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFileName <- "powercon.zip"
download.file(zipFileUrl,destFileName)
unzip(destFileName,exdir=".")
readData <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character","character",rep("numeric",7)),na.strings="?")
dataToPlot <- subset(readData,readData$Date=="1/2/2007" | readData$Date == "2/2/2007")
dataToPlot$Date <- as.Date(dataToPlot$Date,format="%d/%m/%Y")
dataToPlot$DateTime <- as.POSIXct(paste(dataToPlot$Date,dataToPlot$Time))
Sys.setlocale("LC_TIME","English")
png("plot2.png",480,480)
plot(dataToPlot$DateTime, dataToPlot$Global_active_power, type="line", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

