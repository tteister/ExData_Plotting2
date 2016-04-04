#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#Packages or data may be recycled from previous questions.
png("plot5.png")
sub2 <- subset(NEI, fips == "24510" & type=="ON-ROAD")
baltcar.sources <- aggregate(sub3[c("Emissions")], list(type = sub3$type, year = sub3$year, zip = sub3$fips), sum)
qplot(year, Emissions, data = baltcar.sources, geom= "line") + theme_gray() + ggtitle("Motor Vehicle-Related Emissions in Baltimore County") + xlab("Year") + ylab("Emission Levels")
dev.off()