##
## Mke histogram showing Global Active power, red bars
##

plot1 <- function(){
    
    ## load data
    power <- subset(read.csv2("household_power_consumption.txt"), Date == "1/2/2007" | Date == "2/2/2007")
    
    ## open the output file
    png(filename = "./plot1.png")
    
    ## make histogram
    with(power, hist(as.numeric(Global_active_power)/1000, col ="red", main = "Global active Power", xlab = "Global Active Power (kilowatts)"))
    ## need to increse bin width and change x axis units to KW
    
    
    ## close the output file
    dev.off()
}
