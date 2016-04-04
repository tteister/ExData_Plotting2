#Data load
library(downloader)
library(utils)
file <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(file, dest = "EPAdata.zip", mode= "wb")
unzip("EPAdata.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
df <- with(NEI, aggregate(Emissions, by = list(year), sum))

#1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
png("plot1.png")
plot(df, type = "o", main = "PM2.5 Emissions", xlab = "Year", ylab = "PM2.5 Emissions", pch = 19, col = "darkred", lty = 6)
dev.off()
#2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
png("plot2.png")
sub1 <- subset(NEI, fips == "24510")
balt <- tapply(sub1$Emissions, sub1$year, sum)
plot(balt, type = "b", main = "PM2.5 Emissions in Baltimore County", xlab = "Year", ylab = "PM2.5 Emissions", pch = 18, col = "darkblue", lty = 5)
dev.off()
#3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
png("plot3.png")
library(ggplot2)
sub2 <- subset(NEI, fips = "24510")
balt.sources <- aggregate(sub2[c("Emissions")], list(type = sub2$type, year = sub2$year), sum)
qplot(year, Emissions, data = balt.sources, color = type, geom = "line") + ggtitle("PM2.5 Emissions in Baltimore County by Source") + xlab("Year") + ylab("PM2.5 Emissions")
dev.off()
#4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

#5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
