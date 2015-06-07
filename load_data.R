data_root = "./data/"
file_url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file_location = paste0(data_root, "household_power_consumption.zip")
data_location = paste0(data_root, "household_power_consumption.txt")


load_data <- function() {
    if(!exists('data_set'))  {
        
        # Download if the file does not exist.
        if(!file.exists(data_location)){
            
            if(!file.exists(data_root)){
                dir.create(data_root)
            }
            
            if(!file.exists(file_location)){
                download.file(file_url,destfile=file_location)
            }
            
            unzip(file_location, "household_power_consumption.txt", exdir = "./data")   
        }
        
        #Load the dataset.
        raw_data <- read.table(data_location, header = T, sep = ";", na.strings='?',
                               colClasses=c(rep('character', 2), rep('numeric', 7)))
        
        # Turn the date into date objects
        raw_data$Date <- as.Date(raw_data$Date, "%d/%m/%Y")
        
        # Filter to just the date range required
        start_date = as.Date("2007-02-01", "%Y-%m-%d")
        end_date = as.Date("2007-02-02", "%Y-%m-%d")
        
        data_set <<- raw_data[raw_data$Date >= start_date & raw_data$Date <= end_date, ]
        
        #Tidy up data
        data_set$Global_active_power <- as.numeric(data_set$Global_active_power)
        data_set$date_time <- strptime(paste(format(data_set$Date, "%Y-%m-%d"), data_set$Time), "%Y-%m-%d %H:%M:%S")
    }

    data_set
}