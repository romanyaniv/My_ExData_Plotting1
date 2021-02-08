### Preapering the data
x <- read.csv('/Users/admin/Desktop/Data Science/Exploratory Data Analysis with R/household_power_consumption.txt', sep = ';', stringsAsFactors=F, na.strings = '?')
head(x)
str(x)
data <- x[x$Date == '1/2/2007' | x$Date ==  '2/2/2007', ]
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

### Building the Plot1
png(filename = "Plot1.png", width=480, height=480)
y <- as.numeric(data$Global_active_power)
hist(y, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', breaks = 12)
dev.off()
