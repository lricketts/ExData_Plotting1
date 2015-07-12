library(dplyr)

power <- read.table("./data/household_power_consumption.txt", sep = ";",
                    na.strings = "?", header = TRUE)

power$newdate <- with(power, as.POSIXct(paste(Date, Time), 
                                        format="%d/%m/%Y %H:%M:%S"))
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- filter(power, Date == "2007-02-01" | Date == "2007-02-02")

png(file = "plot3.png", width = 480, height = 480)
with(power, plot(newdate, Sub_metering_1, type = "l", ylab = "Energy sub metering", 
                  xlab = "", col = "black"))
with(power, lines(newdate, Sub_metering_2, type = "l", col = "red"))
with(power, lines(newdate, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()