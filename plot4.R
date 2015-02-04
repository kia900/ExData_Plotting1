# read data for 1/2/2007 through 2/22007. 
dat <- read.csv('./data/feb.txt' , sep = ';')

png(file = "plot4.png")

#add time variable
x <- as.character(paste(dat$Date, dat$Time))
y <- strptime(x, "%d/%m/%Y %H:%M:%S")
time <- as.POSIXct(y)
dat <- cbind(dat, time)

par(mfrow = c(2,2))
with(dat, {
	plot(dat$time, dat$Global_active_power , type = 'l', ylab = "Global Active Power (kilowatts)" , xlab = "")
	
	plot(time, Voltage, type = 'l' , xlab = "datetime")
	
	plot(time, Sub_metering_1, type = 'l', ylim=c(0, 40), ylab = "Energy sub metering", xlab = "")
	par(new=T)
	plot(time, Sub_metering_2, type = 'l', ylim=c(0, 40), ylab = "", xlab = "" , col = "red")
	par(new=T)
	plot(time, Sub_metering_3, type = 'l', ylim=c(0, 40), ylab = "", xlab = "" , col = "blue")
	legend("topright" , lwd = 1, col = c('black', 'red' , 'blue'), legend = c('Sub_metering_1' , 'Sub_metering_2', 'Sub_metering_3'))
	
	plot(time, Global_reactive_power, type = 'l', xlab = "datetime")
})

dev.off()