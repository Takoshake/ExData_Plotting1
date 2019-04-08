library(RCurl)
library(dplyr)

workingDirectory <- "G:/Git_Repositories/Exploratory_Data_Analysis/Project_1"
setwd(workingDirectory)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!dir.exists("Electric_Power_Consumption")){
  download.file(url,"EPC_dataset.zip", method = "curl")
  unzip("./EPC_dataset.zip")
} else{
  print("Directory exists")
}
## Import data for the date range 1/2/2007 and 2/2/2007
col_Names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
EPC <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), sep = ";", na.strings = "?", header = FALSE, col.names = col_Names)
hist(EPC$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "Red", main = "Global Active Power")

dev.copy(png, "plot1.png", width= 480, height= 480)
dev.off()