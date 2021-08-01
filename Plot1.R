### Project 2 Plot 1

### We set the working directory, load libraries and load in the data

setwd("C:/Users/javie/OneDrive/Documents/Coursera/Exploratory Data Analysis/Project 2")

library(ggplot2)
library(dplyr)

### We read in the data

NEI <- readRDS(file = "summarySCC_PM25.rds")
SCC <- readRDS(file = "Source_Classification_Code.rds")


### We aggregate the pollution data by year

Total_Pollution_by_year <- aggregate(Emissions ~ year, NEI, sum)

### We make the plot of total PM 2.5 emissions by year

barplot((Total_Pollution_by_year$Emissions)/(10^6),
        names = Total_Pollution_by_year$year, xlab = "Year",
        ylab = "Fine particulate matter emissión PM 2.5",
        main = "Total PM 2.5 Emissions form all Sources in the US 1999-2008")

###WE create the png file and turn the device off

dev.copy(png, "Plot1.png")

dev.off()