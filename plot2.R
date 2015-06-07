source("load_data.R")

png("plot2.png",  width = 480, height = 480, units = "px", bg='transparent')
plot(data_set$date_time, data_set$Global_active_power, type="l", xlab="", ylab="Global Active power (kilowatts)")
dev.off()
