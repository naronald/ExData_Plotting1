# courtesy Syed Tariq on the discussion forum
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
householdData <- read.csv2.sql(myFile,mySql) 


householdData$DateTime <- strptime(
  paste(householdData$Date, householdData$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
hist(householdData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()



