library(RCurl)
library(dplyr)

workingDirectory <- "G:/Git_Repositories/Exploratory_Data_Analysis/Project_1"
setwd(workingDirectory)

## Import data for the date range 1/2/2007 and 2/2/2007
col_Names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
EPC <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), sep = ";", na.strings = "?", header = FALSE, col.names = col_Names)

## Format date to type Date
EPC$Date <- as.Date(EPC$Date, "%d/%m/%Y")
EPC$datetime <- as.POSIXct(paste(EPC$Date, EPC$Time))

par(mfrow = c(2, 2), mar=c(4, 4, 2, 1), oma=c(0, 0, 2, 0))
with(EPC,{
     ## Plot 1
     plot(Global_active_power~datetime, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
     ## Plot 2
     plot(Voltage~datetime, type = "l")
     ## Plot 3
     plot(Sub_metering_1~datetime, type="l", xlab = "", ylab = "Energy sub metering", col = "black")
     lines(Sub_metering_2~datetime, col = "red")
     lines(Sub_metering_3~datetime, col = "blue")
     legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"), lty = 1, lwd = 1, bty = "n")
     ## Plot 4
     plot(Global_reactive_power~datetime, type="l")
     })

dev.copy(png, "plot4.png", width= 480, height= 480)
dev.off()