### Project 2 Plot 6

library(ggplot2)
library(dplyr)

### We read in the data

NEI <- readRDS(file = "summarySCC_PM25.rds")
SCC <- readRDS(file = "Source_Classification_Code.rds")

### We subset for motor vehicle emissions in Baltimore City and calculate total emissions

NEI_Motor_Veh_LA <- NEI[(NEI$fips == "06037" & NEI$type == "ON-ROAD"),]

Total_Motor_Pollution_LA<- aggregate(Emissions ~ year, NEI_Motor_Veh_LA, sum)

Total_Motor_Pollution_Balt$County <- "Baltimore City; Maryland"
Total_Motor_Pollution_LA$County <- "Los Angeles County; California"

Total_Motor_Pollution_Both <- rbind(Total_Motor_Pollution_Balt, Total_Motor_Pollution_LA)

### We now create the plot using the ggplot 2 package

ggplot(Total_Motor_Pollution_Both, aes(x=factor(year), y=Emissions, fill=County,label = round(Emissions,2))) +
  geom_bar(stat="identity") + 
  facet_grid(County~., scales="free") +
  ylab(expression("total PM"[2.5]*" emissions in tons")) + 
  xlab("year") +
  ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles in tons"))+
  geom_label(aes(fill = County),colour = "white", fontface = "bold")

### We save into a png file and turn the device off

dev.copy(png, "Plot 6.png")

dev.off()