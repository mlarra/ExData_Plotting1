source("Functions.R")

## Get the data frame
data <- getData()

## Change the locale to have day names in English
Sys.setlocale("LC_TIME", "C")


## Create the plot
png(file ="Plot2.png", width = 480, height = 480)
plot(data$datetime,data$Global_active_power, type="l",xlab="", ylab ="Global Active Power (kilowatts)")
dev.off();