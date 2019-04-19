#################################################################
###                 Exploratory Data Analysis                 ###
####                   Couerse Project                       ####
#################################################################


# 1 - Read the data
data <- read.csv('household_power_consumption.txt', sep = ';')


# 2 -  Convert the Date as date field and time in time format.
data$Date<-as.Date(data$Date, "%d/%m/%Y")

data$Date.Time<-paste(data$Date, data$Time)
data$Date.Time<- strptime(data$Date.Time, "%Y-%m-%d %H:%M:%S")


# 3 - We filter for the date that we'll use.
data_fil <- data[data$Date == "2007-02-01" |data$Date == "2007-02-02" ,]

# 4 - We create a plot 3
Sub_metering_1<- as.numeric(data_fil$Sub_metering_1)
Sub_metering_2<- as.numeric(data_fil$Sub_metering_2)
Sub_metering_3<- as.numeric(data_fil$Sub_metering_3)
Date.Time<- data_fil$Date.Time
plot(Date.Time,Sub_metering_1, type = "l", xlab= "", ylab="Energy sub metering")
lines(Date.Time, Sub_metering_2, col = 'red')
lines(Date.Time, Sub_metering_3, col = 'blue')
legend('topright',legend=c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'),lty=1,  col = c("black","red","blue"))

# 5 - We save like PNG

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
