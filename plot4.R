library(sqldf)
# courtesy Syed Tariq on the discussion forum
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
householdData <- read.csv2.sql(myFile,mySql) 


householdData$datetime <- strptime(
  paste(householdData$Date, householdData$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

par(mfrow = c(2, 2))
with(householdData, {
  plot(datetime, Global_active_power, main="", 
       ylab="Global Active Power", xlab="", type="l")
  plot(datetime, Voltage, main="", 
       ylab="Voltage", type="l")
  plot(datetime, Sub_metering_1, main = "", type = "n", ylab="Energy sub metering", xlab="")
  lines(datetime, Sub_metering_1, col = "black") 
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright", col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=1, bty="n")
  plot(datetime, Global_reactive_power, main="", type="l")
})
  dev.off()
