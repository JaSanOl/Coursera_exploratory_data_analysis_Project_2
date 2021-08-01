### Project 2 Plot 4

### We read in the data

NEI <- readRDS(file = "summarySCC_PM25.rds")
SCC <- readRDS(file = "Source_Classification_Code.rds")


### We subset by coal combustion emissions

Coal_Combustion <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
Coal_Combustion_Sources <- SCC[Coal_Combustion,]

NEI_Coal <- NEI[NEI$SCC %in%  Coal_Combustion_Sources$SCC,]

### We make the plot with the data we just obtained

Total_Coal_Pollution <- aggregate(Emissions ~ year, NEI_Coal, sum)

barplot(Total_Coal_Pollution$Emissions, names = Total_Coal_Pollution$year,
        xlab = "Year", ylab = "Total PM 2.5 Emissions",
        main = "Total PM 2.5 Emissions from Coal-related Sources")

ggplot(Total_Coal_Pollution, aes(x=year, y = Emissions/1000, fill=year, label = round(Emissions/1000,2))) +
  geom_bar(stat="identity") +
  #geom_bar(position = 'dodge')+
  # facet_grid(. ~ year) +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions in kilotons")) +
  ggtitle("Emissions from coal combustion-related sources in kilotons")+
  geom_label(aes(fill = year),colour = "white", fontface = "bold")

### We sae¡ve the plot into a png file and turn the device off

dev.copy(png, "Plot4.png")

dev.off()