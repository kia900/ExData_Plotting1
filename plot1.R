# read data for 1/2/2007 through 2/22007. 
dat <- read.csv('./data/feb.txt' , sep = ';')

png(file = "plot1.png" , )
hist(dat$Global_active_power, col = 'red', xlab = "Global Active Power (kilowatts)" , main = "Global Active Power")

dev.off()
