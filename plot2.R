# Read in the household power consumption data from a CSV file
power_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', 
                       na.strings = "?", nrows = 2075259, check.names = FALSE, 
                       stringsAsFactors = FALSE, comment.char = "", quote = '\"')

# Select data for 1/2/2007 and 2/2/2007
selected_data <- subset(power_data, Date %in% c("1/2/2007", "2/2/2007"))

# Convert the date column to a date object and create a new datetime column
selected_data$Date <- as.Date(selected_data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(selected_data$Date), selected_data$Time)
selected_data$Datetime <- as.POSIXct(datetime)

# Create a line plot of global active power against datetime
with(selected_data, {
  plot(Global_active_power ~ Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
})
