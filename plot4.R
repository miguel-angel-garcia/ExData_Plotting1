## Construct the 4th plot for global active power

## Read the data set from local dir
hhp <- read.csv("household_power_consumption.txt", sep=";", na.string="?", 
                stringsAsFactors=FALSE)

## Filters the data set
hhp2 <- subset(hhp, Date == "1/2/2007" | Date == "2/2/2007")

## Converts to R data and time format
hhp2$DateTime <- strptime(paste(hhp2$Date, hhp2$Time, sep = " "), 
                          "%d/%m/%Y %H:%M:%S")

## Inits the device (PNG)
png(filename = "plot4.png", width = 480, height = 480)

## Sets the canvas to 2 x 2
par(mfrow = c(2, 2))

## Plot the 1st graph
par(col = "black")
with(hhp2, 
     plot(DateTime, Global_active_power, 
          xlab = "", 
          ylab = "Global Active Power",
          type = "n"))
with(hhp2, 
     lines(DateTime, Global_active_power, 
           type = "l"))

## Plot the 2nd graph
with(hhp2, 
     plot(DateTime, Voltage, 
          xlab = "datetime", 
          ylab = "Voltage",
          type = "n"))
with(hhp2, 
     lines(DateTime, Voltage, 
           type = "l"))

## Plot the 3rd graph
with(hhp2, 
     plot(DateTime, Sub_metering_1,
          xlab = "", 
          ylab = "Energy sub metering",
          type = "n"))
with(hhp2,
     lines(DateTime, Sub_metering_1, 
           col = "black",
           type = "l"))
with(hhp2,
     lines(DateTime, Sub_metering_2, 
           col = "red",
           type = "l"))
with(hhp2,
     lines(DateTime, Sub_metering_3, 
           col = "blue",
           type = "l"))
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"),
       col = c("black", "red", "blue"),
       lwd = 1,
       lty = c(1, 1, 1),
       bty = "n")

## Plot the 4th graph
with(hhp2, 
     plot(DateTime, Global_reactive_power, 
          xlab = "datetime", 
          ylab = "Global_reactive_power",
          type = "n"))
with(hhp2, 
     lines(DateTime, Global_reactive_power, 
           type = "l"))

## Switch off the device
dev.off()