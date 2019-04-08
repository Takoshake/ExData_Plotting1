library(RCurl)
library(dplyr)

workingDirectory <- "G:/Git_Repositories/Exploratory_Data_Analysis/Project_1"
setwd(workingDirectory)

## Import data for the date range 1/2/2007 and 2/2/2007
col_Names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
EPC <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), sep = ";", na.strings = "?", header = FALSE, col.names = col_Names) ##, colClasses = col_Classes)

## Format date to Type Date
EPC$Date <- as.Date(EPC$Date, "%d/%m/%Y")
EPC$Day <- as.POSIXct(paste(EPC$Date, EPC$Time))

with(EPC,
     plot(Global_active_power~Day, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
     )


dev.copy(png, "plot2.png", width= 480, height= 480)
dev.off()