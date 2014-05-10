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
# Plot first graph for 'Sub_metering_1'
plot(subdata2$DateTime, subdata2$Sub_metering_1, type="l", xlab="", 
     ylab="Energy sub metering")
# Plot second graph for 'Sub_metering_2' which has color of red
points(subdata2$DateTime, subdata2$Sub_metering_2, type="l", col = "red")
# Plot third graph for 'Sub_metering_3' which has color of blue
points(subdata2$DateTime, subdata2$Sub_metering_3, type="l", col = "blue")
# Add legend
legend("topright", cex=0.7, lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Copy current display into "plot3.png"
dev.copy(png, file="plot3.png")
# Turn off device
dev.off()