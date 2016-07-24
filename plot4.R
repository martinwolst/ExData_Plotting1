##
## Make 4 panel plot of: alobal active power, voltage, energy sub metering and global reative power
##

plot4 <- function(){
    
    ## load data
    power <- subset(read.csv2("household_power_consumption.txt"), Date == "1/2/2007" | Date == "2/2/2007")
    
    power$Time <- strptime(paste(power$Date, power$Time, sep = "-"), "%d/%m/%Y-%H:%M:%S")
    
    ## open the output file
    png(filename = "./plot4.png")
    
    ## plot
    par(mfrow=c(2,2))
    
    ## top left
    plot(x = power$Time, y = as.numeric(power$Global_active_power)/1000, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    
    ## top right
    plot(x = power$Time, y = power$Voltage, type = "l", ylab = "Voltage", xlab = "")
    
    ## bottom left
    plot(x = power$Time, y = power$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", ylim = c(0, 30) )
    lines(x = power$Time, y = power$Sub_metering_2, type = "l", col = "red")
    lines(x = power$Time, y = power$Sub_metering_3, type = "l", col ="blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1,  bty = "n")
    
    ##bottom right
    plot(x = power$Time, y = power$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "")
    
    ## close the output file
    dev.off()
    
}