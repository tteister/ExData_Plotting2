#2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

#Packages or data may be recycled from previous questions.
png("plot2.png")
balt<-subset(NEI, NEI$fips==24510)           #Subset Baltimore area
totalBaltimore<-tapply(balt$Emissions, INDEX=balt$year, sum)   #Sum emissions per year
barplot(totalBaltimore, main="Total Emissions in Baltimore, MD by Year", xlab="Year", ylab="Emissions")
dev.off()