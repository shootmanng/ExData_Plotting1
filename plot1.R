library(dplyr)
setwd("~/Education/Data Science/Exploratory Data Analysis/Project 1/ExData_Plotting1")
df<-read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt",sep = ";")
# Dates are in Day/Month/Year, not common in US
df<-filter(df, Date == "2/2/2007" | Date == "1/2/2007")
dev.cur()
hist(as.numeric(df[["Global_active_power"]]), 
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()