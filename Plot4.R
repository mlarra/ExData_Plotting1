source("Functions.R")

## Get the data frame
data <- getData()

## Change the locale to have day names in English
Sys.setlocale("LC_TIME", "C")


## Create the plot
png(file ="Plot4.png", width = 480, height = 480)
oldPar <- par(mfrow=c(2,2))
# First plot
plot(data$datetime,data$Global_active_power, type="l",xlab="", ylab ="Global Active Power (kilowatts)")

# Second plot
plot(data$datetime,data$Voltage, type="l", ylab="Voltage", xlab="datetime")


# Third plot
with (data, {
  plot(datetime,Sub_metering_1,ylab="Energy sub metering", xlab="",type="n")
  points(datetime,Sub_metering_1,type="l", col="black")
  points(datetime,Sub_metering_2,type="l", col="red")
  points(datetime,Sub_metering_3,type="l", col="blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), xjust=0,bty="n", cex=.7)
})

# Fourth plot
plot(data$datetime,data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off();
## Restore previous configuration
par(oldPar)