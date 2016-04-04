#3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

#Packages or data may be recycled from previous questions.
library(ggplot2)
library(plyr)
sub1 <- subset(NEI, fips == "24510")
PM25.year <- ddply(sub1, .(year, type), function(x) sum(x$Emissions))
colnames(PM25.year)[3] <- "Emissions"
png("plot3.png")
qplot(year, Emissions, data=PM25.year, color=type, geom ="line") + ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Emmission by source, type and year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in tons)"))
dev.off()