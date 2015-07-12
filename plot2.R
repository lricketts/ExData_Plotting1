library(dplyr)

power <- read.table("./data/household_power_consumption.txt", sep = ";",
                    na.strings = "?", header = TRUE)

power$newdate <- with(power, as.POSIXct(paste(Date, Time), 
                                          format="%d/%m/%Y %H:%M:%S"))
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- filter(power, Date == "2007-02-01" | Date == "2007-02-02")

png(file = "plot2.png", width = 480, height = 480)
with(power, plot(newdate, Global_active_power, type = "l", xlab = "", 
                 ylab = "Global Active Power (kilowatts)"))
dev.off()
