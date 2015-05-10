library(lubridate)
if (!file.exists("data.rds")) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "data.zip")
  unzip("data.zip")
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))
  data$Date <- dmy(data$Date)
  data$Time <- hms(data$Time)
  start <- ymd("2007-02-01")
  end <- ymd("2007-02-02")
  data <- subset(data, year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))
  data$date.time <- data$Date + data$Time
  saveRDS(data, file = "data.rds")
} else {
  data <- readRDS("data.rds")
}