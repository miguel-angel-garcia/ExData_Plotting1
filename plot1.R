## Construct the 1st plot for global active power

## Read the data set from local dir
hhp <- read.csv("household_power_consumption.txt", sep=";", na.string="?", 
                stringsAsFactors=FALSE)

## Filters the data set
hhp2 <- subset(hhp, Date == "1/2/2007" | Date == "2/2/2007")

## Converts to R data and time format
hhp2$DateTime <- strptime(paste(hhp2$Date, hhp2$Time, sep = " "), 
                          "%d/%m/%Y %H:%M:%S")

## Inits the device (PNG)
png(filename = "plot1.png", width = 480, height = 480)

## Plot the histogram
hist(hhp2$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frecuency")

## Switch off the device
dev.off()