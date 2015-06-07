source("load_data.R")

png("plot3.png",  width = 480, height = 480, units = "px", bg='transparent')
plot(data_set$date_time, data_set$Sub_metering_1,  col="Black", type="l", 
     ylim=range(data_set$Sub_metering_1, data_set$Sub_metering_2, data_set$Sub_metering_3),
     xlab="", ylab="Energy sub metering"
     )
lines(data_set$date_time, data_set$Sub_metering_2, col="Red")
lines(data_set$date_time, data_set$Sub_metering_3, col="Blue")
legend("topright", lty=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.8, col=c("Black", "Red", "Blue"))
dev.off()
