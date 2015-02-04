# read data for 1/2/2007 through 2/22007. 
dat <- read.csv('./data/feb.txt' , sep = ';')

png(file = "plot2.png")

#add time variable
x <- as.character(paste(dat$Date, dat$Time))
y <- strptime(x, "%d/%m/%Y %H:%M:%S")
time <- as.POSIXct(y)
dat <- cbind(dat, time)

# plot
plot(dat$time, dat$Global_active_power , type = 'l', ylab = "Global Active Power (kilowatts)" , xlab = "")

dev.off()