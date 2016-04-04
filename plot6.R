#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

#Packages or data may be recycled from previous questions.
png("plot6.png")
sub3 <- subset(NEI, fips == "06037" & type=="ON-ROAD")
lacar.sources <- aggregate(sub3[c("Emissions")], list(type = sub3$type, year = sub3$year, zip = sub3$fips), sum)
comp.car <- rbind(baltcar.sources, lacar.sources)
qplot(year, Emissions, data = comp.car, color = zip, geom= "line", ylim = c(-100, 5500)) + ggtitle("Motor Vehicle Emissions in Baltimore (24510) \nvs. Los Angeles (06037) Counties") + xlab("Year") + ylab("Emission Levels")
dev.off()