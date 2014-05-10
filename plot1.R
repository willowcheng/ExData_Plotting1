## Loading the data
# Read file into data
data <- read.table(file="./Data/household_power_consumption.txt", sep=";", colClasses="character")
# Modify data to normal format since names are not correct
names(data) <- data[1,]
data <- data[2:nrow(data),]
# Subset data for data from the dates 2007-02-01 and 2007-02-02
subdata <- data[as.character(as.Date(data$Date, format="%d/%m/%Y")) == "2007-02-01" |
        as.character(as.Date(data$Date, format="%d/%m/%Y")) == "2007-02-02",  ]

## Making Plots
hist(as.numeric(subdata$Global_active_power), col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
# Copy current display into "plot1.png"
dev.copy(png, file="plot1.png")
# Turn off device
dev.off()