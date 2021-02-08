### Preapering the data
x <- read.csv('/Users/admin/Desktop/Data Science/Exploratory Data Analysis with R/household_power_consumption.txt', sep = ';', stringsAsFactors=F, na.strings = '?')
head(x)
str(x)
data <- x[x$Date == '1/2/2007' | x$Date ==  '2/2/2007', ]
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

### Building the Plot3
png(filename = "Plot3.png", width=480, height=480)
plot(data$Time, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l', col = 'black')
lines(data$Time, data$Sub_metering_2, col='red')
lines(data$Time, data$Sub_metering_3, col = 'blue')
legend('topright', col= c('black', 'red', 'blue'), lty = c(1, 1, 1), legend= c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()