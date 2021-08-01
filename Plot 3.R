### Script for the third plot in Project 2

library(ggplot2)
library(dplyr)

### We read in the data

NEI <- readRDS(file = "summarySCC_PM25.rds")
SCC <- readRDS(file = "Source_Classification_Code.rds")

### WE subset the data to only include Baltimore city

Baltimore_NEI <- NEI[NEI$fips == "24510",]

### Now we aggregate Total EMissions in Baltimore

Total_Pollution_Baltimore <- aggregate(Emissions ~ year, Baltimore_NEI, sum)

### Now we make the plot, using the ggplot2 package (already loaded)

pl<- ggplot(Baltimore_NEI, aes( x = year, y = Emissions, fill = type))+
  geom_bar(stat = "identity")+
  facet_grid(.~type) + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

pl + theme(
  plot.title = element_text(hjust = 0.5, vjust = 0.5)
)

###We create the png file and turn the device off

dev.copy(png, "Plot3.png")

dev.off()