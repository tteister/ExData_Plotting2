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
