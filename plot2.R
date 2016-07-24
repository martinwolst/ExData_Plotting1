##
## Make time series plot of global active power by day of the week
##

plot2 <- function(){
    
    ## load data
    power <- subset(read.csv2("household_power_consumption.txt"), Date == "1/2/2007" | Date == "2/2/2007")
    
    power$Time <- strptime(paste(power$Date, power$Time, sep = "-"), "%d/%m/%Y-%H:%M:%S")
    
    ## open the output file
    png(filename = "./plot2.png")
    
    ## plot
    plot(x = power$Time, y = power$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    
    
    ## close the output file
    dev.off()
    
}