# construct histogram plot 1
# Karthik Padmanabhan 02-09-2023

# read in data into dataframe 
power_cons = read.table('household_power_consumption.txt', na.strings = '?', sep=';', header = TRUE)

# convert into date and time objects 
power_cons$Date = as.Date(power_cons$Date, "%d/%m/%Y")
power_cons$Time = format(strptime(power_cons$Time, "%H:%M:%S"),"%H:%M:%S")

# subset data only between 2007-02-01 and 2007-02-02
power_cons_subset = power_cons[power_cons$Date >="2007-02-01" & power_cons$Date<="2007-02-02",]

# plot the histogram required for generating plot1 and save as png

png('plot1.png')

hist(power_cons_subset$Global_active_power, xlab='Global Active Power (kilowatts)', col='red', ylab='Frequency',
     main='Global Active Power')

dev.off()