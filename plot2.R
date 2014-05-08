# courtesy Syed Tariq on the discussion forum
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
householdData <- read.csv2.sql(myFile,mySql) 


householdData$DateTime <- strptime(
  paste(householdData$Date, householdData$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
with(householdData, plot(DateTime, Global_active_power, main="", 
     ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()