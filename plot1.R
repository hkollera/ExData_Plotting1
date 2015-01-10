## plot a histogramm into a png grafics file.
## Input:  Datafile household_power_consumption.txt
## Output: PNG-file plot1.png
##
plot1 <- function() {
  ## read datafile
  DF <- read.table("household_power_consumption.txt", sep =";", na.strings = c("?"),header = TRUE)
  ## reduce dataset to expected time range
  subDF <- subset(DF,Date == "1/2/2007" | Date == "2/2/2007")
  
  ## creating the plot
  png(filename="plot1.png", width = 480, height = 480)
  hist(subDF$Global_active_power, 
       col="red", 
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)"
  )
  dev.off()

  ## remove datasets
  rm(DF)
  rm(subDF)
}
