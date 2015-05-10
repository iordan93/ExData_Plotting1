source("load_data.R")
png(filename = "plot2.png")
plot(data$date.time, data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()