## print a group of 4 plots into a png grafics file.
## Input:  Datafile household_power_consumption.txt
## Output: PNG-file plot4.png
##
plot4 <- function () {
  ## read datafile
  DF <- read.table("household_power_consumption.txt", sep =";", na.strings = c("?"),header = TRUE)
  ## reduce dataset to expected time range
  subDF <- subset(DF, Date == "1/2/2007" | Date == "2/2/2007")
  ## convert date and time columns to a date_time column
  subDF$Date_time <- paste(subDF$Date, subDF$Time)
  subDF$Date_time <- strptime(subDF$Date_time, "%d/%m/%Y %H:%M:%S")

  ## creating the plot
  png(filename="plot4.png", width = 480, height = 480)
  par(mfrow = c(2, 2), oma = c(0, 0, 2, 0))
  with(subDF, {
    plot(subDF$Date_time,subDF$Global_active_power,
       type="l",
       main="",
       xlab="",
       ylab="Global Active Power"
    )
    plot(subDF$Date_time,subDF$Voltage,
       type="l",
       main="",
       xlab="datetime",
       ylab="Voltage"
    )
    {plot(subDF$Date_time, subDF$Sub_metering_1,
       type="l",
       col="black",
       ylim=range(subDF$Sub_metering_1, subDF$Sub_metering_2, subDF$Sub_metering_3),
       main="",
       xlab="",
       ylab="Energy sub metering"
    )
    lines(subDF$Date_time, subDF$Sub_metering_2, col="red")
    lines(subDF$Date_time, subDF$Sub_metering_3, col="blue")
    legend("topright", 
         col = c("black", "red", "blue"),
         lwd = 2, 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         bty="n"
    )}    
    plot(subDF$Date_time,subDF$Global_reactive_power,
       type="l",
       main="",
       xlab="datetime",
       ylab="Global_reactive_power"
    )
  })
  dev.off()

  ## remove datasets
  rm(DF)
  rm(subDF)
}
