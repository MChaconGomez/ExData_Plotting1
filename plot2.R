#################################################################
###                 Exploratory Data Analysis                 ###
####                   Couerse Proyect                       ####
#################################################################


# 1 - Read the data
data <- read.csv('household_power_consumption.txt', sep = ';')


# 2 -  Convert the Date as date field and time in time format.
data$Date<-as.Date(data$Date, "%d/%m/%Y")

data$Date.Time<-paste(data$Date, data$Time)
data$Date.Time<- strptime(data$Date.Time, "%Y-%m-%d %H:%M:%S")


# 3 - We filter for the date that we'll use.
data_fil <- data[data$Date == "2007-02-01" |data$Date == "2007-02-02" ,]

# 4 - We create a plot 2
Global_active_power<- as.numeric(data_fil$Global_active_power)
Date.Time<- data_fil$Date.Time
plot(Date.Time,Global_active_power, type = "l", xlab = '',ylab = 'Global Active Power (kilowatts)')

# 5 - We save like PNG

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
