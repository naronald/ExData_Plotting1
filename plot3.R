# courtesy Syed Tariq on the discussion forum
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
householdData <- read.csv2.sql(myFile,mySql) 


householdData$DateTime <- strptime(
  paste(householdData$Date, householdData$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
with(householdData, plot(DateTime, Sub_metering_1, main = "", type = "n", ylab="Energy sub metering", xlab=""))
with(householdData, lines(DateTime, Sub_metering_1, col = "black")) 
with(householdData, lines(DateTime, Sub_metering_2, col = "red"))
with(householdData, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()
