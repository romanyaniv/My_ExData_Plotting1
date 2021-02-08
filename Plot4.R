### Preapering the data
x <- read.csv('/Users/admin/Desktop/Data Science/Exploratory Data Analysis with R/household_power_consumption.txt', sep = ';', stringsAsFactors=F, na.strings = '?')
head(x)
str(x)
data <- x[x$Date == '1/2/2007' | x$Date ==  '2/2/2007', ]
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

### Building the Plot4
png(filename = "Plot4.png", width=480, height=480)
par(mfrow = c(2,2))
#topleft
plot(data$Time, y, ylab = 'Global Active Power (kilowatts)', type = 'l', xlab = '')

#topright
plot(data$Time, data$Voltage, ylab ='Voltage', xlab = 'datetime', type = 'l')

#bottomleft
plot(data$Time, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l', col = 'black')
lines(data$Time, data$Sub_metering_2, col='red')
lines(data$Time, data$Sub_metering_3, col = 'blue')
legend('topright', col= c('black', 'red', 'blue'), lty = c(1, 1, 1), legend= c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

#bottomight
plot(data$Time, data$Global_reactive_power, type = 'l', xlab = 'datetime', ylab= 'Global_reactive_power', ylim = c(0.0, 0.5))

dev.off()
