##
## Make time series of energy sub meterings with different colors
##

plot3 <- function(){
    
    ## load data
    power <- subset(read.csv2("household_power_consumption.txt"), Date == "1/2/2007" | Date == "2/2/2007")
    
    power$Time <- strptime(paste(power$Date, power$Time, sep = "-"), "%d/%m/%Y-%H:%M:%S")
    
    ## open the output file
    png(filename = "./plot3.png")
    
    ## plot
    plot(x = power$Time, y = power$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", ylim = c(0, 40) )
    lines(x = power$Time, y = power$Sub_metering_2, type = "l", col = "red")
    lines(x = power$Time, y = power$Sub_metering_3, type = "l", col ="blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
    
    
    ## close the output file
    dev.off()
    
}