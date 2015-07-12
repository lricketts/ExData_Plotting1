library(dplyr)

power <- read.table("./data/household_power_consumption.txt", sep = ";",
                    na.strings = "?", header = TRUE)

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- filter(power, Date == "2007-02-01" | Date == "2007-02-02")

png(file = "plot1.png", width = 480, height = 480)
with(power2, hist(Global_active_power, col = "red", main = "Global Active Power", 
                  xlab = "Global Active Power (kilowatts)"))
dev.off()