# construct line plot 4
# Karthik Padmanabhan 02-09-2023

# read in data into dataframe 
power_cons = read.table('household_power_consumption.txt', na.strings = '?', sep=';', header = TRUE)

# convert into date and time objects 
power_cons$Date = as.Date(power_cons$Date, "%d/%m/%Y")
power_cons$Time = format(strptime(power_cons$Time, "%H:%M:%S"),"%H:%M:%S")

# subset data only between 2007-02-01 and 2007-02-02
power_cons_subset = power_cons[power_cons$Date >="2007-02-01" & power_cons$Date<="2007-02-02",]
power_cons_subset$Date_time = as.POSIXct(paste(power_cons_subset$Date, power_cons_subset$Time), 
                                         format = "%Y-%m-%d %H:%M:%S")

# plot 4
png('plot4.png')

par(mfrow = c(2, 2), mar=c(4,3,3,4))

plot(power_cons_subset$Date_time, power_cons_subset$Global_active_power, type='l',
     xlab='', ylab='Global Active Power', main='')
plot(power_cons_subset$Date_time, power_cons_subset$Voltage, type='l',
     xlab='datetime', ylab = 'Voltage', main='')
plot(power_cons_subset$Date_time, power_cons_subset$Sub_metering_1, type='n', 
     xlab = '', ylab='Energy sub metering')
lines(power_cons_subset$Date_time, power_cons_subset$Sub_metering_1, col='black')
lines(power_cons_subset$Date_time, power_cons_subset$Sub_metering_2, col='red')
lines(power_cons_subset$Date_time, power_cons_subset$Sub_metering_3, col='blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), lty = 1, lwd = 2, bty='n')
plot(power_cons_subset$Date_time, power_cons_subset$Global_reactive_power, type='l',
     xlab='datetime', ylab = 'Global_reactive_power', main='')

dev.off()