data_full <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";",
                      na.strings = "?", nrows = 2075259, check.names = FALSE,
                      stringsAsFactors = FALSE, comment.char = "", quote = '\"')

# Subset the data to include only the dates "1/2/2007" and "2/2/2007"
data1 <- subset(data_full, Date %in% c("1/2/2007", "2/2/2007"))

# Convert the "Date" column to a date format
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")

# Create a new variable "Datetime" by combining the "Date" and "Time" columns
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

# Create a plot of "Sub_metering_1" against "Datetime", with lines for "Sub_metering_2" and "Sub_metering_3"
with(data1, {
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = "red")
  lines(Sub_metering_3 ~ Datetime, col = "blue")
})

# Add a legend to the plot
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
