source("load_data.R")

png("plot4.png",  width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(data_set$date_time, data_set$Global_active_power, type="l", xlab="", ylab="Global Active power (kilowatts)")
plot(data_set$date_time, data_set$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data_set$date_time, data_set$Sub_metering_1,  col="Black", type="l", 
     ylim=range(data_set$Sub_metering_1, data_set$Sub_metering_2, data_set$Sub_metering_3),
     xlab="", ylab="Energy sub metering")
lines(data_set$date_time, data_set$Sub_metering_2, col="Red")
lines(data_set$date_time, data_set$Sub_metering_3, col="Blue")
legend("topright", lty=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.8, col=c("Black", "Red", "Blue"), bty="n")
plot(data_set$date_time, data_set$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
par(mfrow = c(1,1))
dev.off()
