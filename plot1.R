#plot1.r  produces plot1.png 
zipFileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFileName <- "powercon.zip"
download.file(zipFileUrl,destFileName)
unzip(destFileName,exdir=".")
readData <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character","character",rep("numeric",7)),na.strings="?")
dataToPlot <- subset(readData,readData$Date=="1/2/2007" | readData$Date == "2/2/2007")
png("plot1.png",480,480)
histObj <- hist(dataToPlot$Global_active_power)
plot(histObj,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

