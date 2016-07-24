##
## Make histogram showing Global Active power, red bars
##

plot1 <- function(){
    
    ## load data
    power <- read.csv2("household_power_consumption.txt", na.strings = "?")
    
    power$Date <- as.Date(power$Date, "%d/%m/%Y")
    
    days <- subset(power, Date == as.Date ("2007-2-1") | Date == as.Date("2007-2-2"))
    
    ## open the output file
    png(filename = "./plot1.png")
    
    ## plot histogram
    with(days, hist(Global_active_power, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0,1200)))

    ## close the output file
    dev.off()
}
