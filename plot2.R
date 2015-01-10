## print a lineplot into a png grafics file.
## Input:  Datafile household_power_consumption.txt
## Output: PNG-file plot2.png
##
plot2 <- function () {
  ## read datafile
  DF <- read.table("household_power_consumption.txt", sep =";", na.strings = c("?"),header = TRUE)
  ## reduce dataset to expected time range
  subDF <- subset(DF, Date == "1/2/2007" | Date == "2/2/2007")
  ## convert date and time columns to a date_time column
  subDF$Date_time <- paste(subDF$Date, subDF$Time)
  subDF$Date_time <- strptime(subDF$Date_time, "%d/%m/%Y %H:%M:%S")

  ## creating the plot
  png(filename="plot2.png", width = 480, height = 480)
  plot(subDF$Date_time,subDF$Global_active_power,
       type="l",
       main="",
       xlab="",
       ylab="Global Active Power (kilowatts)"
  )
  dev.off()

  ## remove datasets
  rm(DF)
  rm(subDF)
}
