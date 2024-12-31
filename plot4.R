library(dplyr)

setwd("~/Education/Data Science/Exploratory Data Analysis/Project 1/ExData_Plotting1")
df<-read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt",sep = ";")

# Dates are in Day/Month/Year, not common in US
df<-filter(df, Date == "2/2/2007" | Date == "1/2/2007")
df$datetime <- paste(df$Date,df$Time)
df$datetime<-strptime(df$datetime, format="%d/%m/%Y %H:%M:%S")
# the above makes a POSIXlt object which won't format right 
# for the axis() function below, convert to POSIXct
df$datetime<-as.POSIXct(df$datetime)

dev.cur()
par(mfrow=c(2,2))

# Plot 1,1
with(df, plot(datetime,as.numeric(Global_active_power),type="l",lwd=1,
              ylab="Global Active Power (kilowatts)",
              xlab="",xaxt='n'))
axis(side=1,at=c(df$datetime[1],df$datetime[1441],df$datetime[2880]+60),labels = c("Thu","Fri","Sat"))

# Plot 1,2
with(df, plot(datetime,as.numeric(Voltage),type="l",lwd=1,
              ylab="Voltage",
              xlab="datetime",xaxt='n'))
axis(side=1,at=c(df$datetime[1],df$datetime[1441],df$datetime[2880]+60),labels = c("Thu","Fri","Sat"))

# Plot 2,1
with(df, plot(datetime,as.numeric(Sub_metering_1),type="l",lwd=1,
              ylab="Energy sub metering",
              xlab="",xaxt='n',col = "black"))
with(df, lines(datetime,as.numeric(Sub_metering_2),type="l",
              xaxt='n',col = "red"))
with(df, lines(datetime,as.numeric(Sub_metering_3),type="l",
              xaxt='n',col = "blue"))
legend("topright",legend=names(df)[7:9],col=c("black","red","blue"),lwd=1,
       cex=0.75,
       y.intersp = 0.2,
       x.intersp = 0.2,
       inset = c(-0.08,-0.05),
       bty='n')
axis(side=1,at=c(df$datetime[1],df$datetime[1441],df$datetime[2880]+60),labels = c("Thu","Fri","Sat"))

# Plot 2,2
with(df, plot(datetime,as.numeric(Global_reactive_power),type="l",lwd=1,
              ylab="Global_reactive_power",
              xlab="datetime",xaxt='n'))
axis(side=1,at=c(df$datetime[1],df$datetime[1441],df$datetime[2880]+60),labels = c("Thu","Fri","Sat"))

dev.copy(png,file="plot4.png")
par(mfrow=c(1,1))
dev.off()