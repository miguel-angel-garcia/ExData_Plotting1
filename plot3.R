## Construct the 3rd plot for global active power

## Read the data set from local dir
hhp <- read.csv("household_power_consumption.txt", sep=";", na.string="?", 
                stringsAsFactors=FALSE)

## Filters the data set
hhp2 <- subset(hhp, Date == "1/2/2007" | Date == "2/2/2007")

## Converts to R data and time format
hhp2$DateTime <- strptime(paste(hhp2$Date, hhp2$Time, sep = " "), 
                          "%d/%m/%Y %H:%M:%S")

## Inits the device (PNG)
png(filename = "plot3.png", width = 480, height = 480)

## Plot the graph
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
       lty = c(1, 1, 1))

## Switch off the device
dev.off()