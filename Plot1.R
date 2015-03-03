source("Functions.R")

## Get the data frame
data <- getData()


## Create the histogram
png(file ="Plot1.png", width = 480, height = 480)
hist(data$Global_active_power, freq=T, col="red",xlab="Global Active Power (kilowatts)", main ="Global Active Power")
dev.off();