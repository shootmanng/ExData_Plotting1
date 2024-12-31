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
with(df, plot(datetime,as.numeric(Global_active_power),type="l",
              ylab="Global Active Power (kilowatts)",
              xlab="",xaxt='n'))
axis(side=1,at=c(df$datetime[1],df$datetime[1441],df$datetime[2880]+60),labels = c("Thu","Fri","Sat"))
dev.copy(png,file="plot2.png")
dev.off()