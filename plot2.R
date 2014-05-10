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
# Plot graph by given some necessary parameters
plot(subdata2$DateTime, subdata2$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
# Copy current display into "plot2.png"
dev.copy(png, file="plot2.png")
# Turn off device
dev.off()