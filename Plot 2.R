###Project 2 Plot 2

library(ggplot2)
library(dplyr)

### We read in the data

NEI <- readRDS(file = "summarySCC_PM25.rds")
SCC <- readRDS(file = "Source_Classification_Code.rds")

### WE subset the data to only include Baltimore city

Baltimore_NEI <- NEI[NEI$fips == "24510",]

### Now we aggregate Total EMissions in Baltimore

Total_Pollution_Baltimore <- aggregate(Emissions ~ year, Baltimore_NEI, sum)


### We create a bar plot to show our findings


barplot((Total_Pollution_Baltimore$Emissions),
        names = Total_Pollution_Baltimore$year, xlab = "Year",
        ylab = "Fine particulate matter emission PM 2.5 (Tons)",
        main = "Total PM 2.5 Emissions in Baltimore 1999-2008")


### We save our plot into a png file

dev.copy(png, "Plot2.png")

dev.off()