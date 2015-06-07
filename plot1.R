source("load_data.R")
data_set <- load_data()

png("plot1.png",  width = 480, height = 480, units = "px", bg='transparent')
hist(data_set$Global_active_power, col="Red", main="Global Active Power", ylab="Frequency", xlab="Global Active power (kilowatts)")
dev.off()
