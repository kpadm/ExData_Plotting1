# construct line plot 2
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

# make line plot2 
png('plot2.png')
plot(power_cons_subset$Date_time, power_cons_subset$Global_active_power, type='l',
     xlab='', ylab='Global Active Power (kilowatts)', main='')
dev.off()