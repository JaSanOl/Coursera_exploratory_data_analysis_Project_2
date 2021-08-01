### Project 2 Plot 5

library(ggplot2)
library(dplyr)

### We read in the data

NEI <- readRDS(file = "summarySCC_PM25.rds")
SCC <- readRDS(file = "Source_Classification_Code.rds")

### We subset for motor vehicle emissions in Baltimore City and calculate total emissions

NEI_Motor_Veh_Balt <- NEI[(NEI$fips == "24510" & NEI$type == "ON-ROAD"),]

Total_Motor_Pollution_Balt<- aggregate(Emissions ~ year, NEI_Motor_Veh_Balt, sum)

### WE create the plot using ggplot2

ggplot(Total_Motor_Pollution_Balt, aes(x=factor(year), y=Emissions,fill=year, label = round(Emissions,2))) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions in tons")) +
  ggtitle("Emissions from motor vehicle sources in Baltimore City")+
  geom_label(aes(fill = year),colour = "white", fontface = "bold")

### We save into a png file and close the device

dev.copy(png, "Plot5.png")

dev.off()