## Required libraries
library(data.table)


getData <- function () {
  ## Variables for gettin the data
  project.data.url  <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  data.folder  <- "./data"
  project.data.txt.file  <- paste(data.folder, "household_power_consumption.txt", sep="/")
  project.data.zip.file  <- paste(data.folder, "exdata-data-household_power_consumption.zip", sep="/")
  
  
  ## Check if the data file is available. 
  if (!file.exists(project.data.txt.file)) {
    ## If the zip file containing the data exists, unzip it. Otherwise, download it first
    if (!file.exists(project.data.zip.file)) {
      if (!file.exists(data.folder)) {
        dir.create(data.folder)
      }
      download.file(project.data.url, project.data.zip.file, method ="curl")
    }
    ## Unzip the data file
    unzip(project.data.zip.file, exdir=data.folder)
  }
  
  ## Read the data
  data  <- fread(project.data.txt.file, na.strings = c("?"),colClasses = rep("character",9))
  ## Filter dates
  filtered.data  <- as.data.frame(data[data$Date %in% c("1/2/2007","2/2/2007"),])
  
  ## Change the class for numeric columns
  cols <- 3:9
  filtered.data[,cols]  <- apply(filtered.data[,cols],2, function(x) as.numeric(x))
  
  ## Add datetime
  filtered.data$datetime <- as.POSIXct(strptime(paste(filtered.data$Date, filtered.data$Time, sep = " "), format="%d/%m/%Y %H:%M:%S"))
  
  return(filtered.data)
}