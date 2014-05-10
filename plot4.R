## Loading the data
# Read file into data
data <- read.table(file="./Data/household_power_consumption.txt", sep=";", colClasses="character")
# Modify data to normal format since names are not correct
names(data) <- data[1,]
data <- data[2:nrow(data),]
# Subset data for data from the dates 2007-02-01 and 2007-02-02
subdata <- data[as.character(as.Date(data$Date, format="%d/%m/%Y")) == "2007-02-01" |
                        as.character(as.Date(data$Date, format="%d/%m/%Y")) == "2007-02-02",  ]
## Create DateTime column
DateTime <- as.POSIXct(
        strptime(paste(subdata$Date,subdata$Time),format='%d/%m/%Y %H:%M:%S'))
# Bind 'DateTime' as new line of 'subdata2'
subdata2 <- cbind(subdata, DateTime)
# Partition Plots into 2 rows and 2 columns
par(mfrow=c(2, 2))
# First plot
plot(subdata2$DateTime, subdata2$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power")
# Second plot
plot(subdata2$DateTime, subdata2$Voltage, type="l", xlab="datetime", 
     ylab="Voltage")
# Third plot
plot(subdata2$DateTime, subdata2$Sub_metering_1, type="l", xlab="", 
     ylab="Energy sub metering")
points(subdata2$DateTime, subdata2$Sub_metering_2, type="l", col = "red")
points(subdata2$DateTime, subdata2$Sub_metering_3, type="l", col = "blue")
legend("topright", cex=0.3, lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       border = "white")
# Fourth plot
plot(subdata2$DateTime, subdata2$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")
# Copy current display into "plot4.png"
dev.copy(png, file="plot4.png")
# Turn off device
dev.off()