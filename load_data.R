data_root = "./data/"
file_url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file_location = paste0(data_root, "household_power_consumption.zip")
data_location = paste0(data_root, "household_power_consumption.txt")


if(!file.exists(data_location)){
    
    if(!file.exists(data_root)){
        dir.create(data_root)
    }
    
    if(!file.exists(file_location)){
        download.file(file_url,destfile=file_location,method="curl")
    }
    
    unzip(file_location, "household_power_consumption.txt", exdir = "./data")   
}

start_date = as.Date("2007-02-01", "%Y-%m-%d")
end_date = as.Date("2007-02-02", "%Y-%m-%d")

raw_data <- read.table(data_location, header = T, sep = ";")
raw_data$Date <- as.Date(raw_data$Date, "%d/%m/%Y")


data_set <- raw_data[raw_data$Date >= start_date && raw_data$Date <= end_date, ]