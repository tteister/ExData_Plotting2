#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

#Packages or data may be recycled from previous questions.
coalcombust.scc <- subset(SCC, EI.Sector %in% c("Fuel Comb - Comm/Instutional - Coal", 
                                             "Fuel Comb - Electric Generation - Coal", "Fuel Comb - Industrial Boilers, ICEs - 
  Coal"))
coalcombust.scc1 <- subset(SCC, grepl("Comb", Short.Name) & grepl("Coal", Short.Name))
coalcombust.codes <- union(coalcombust.scc$SCC, coalcombust.scc1$SCC)
coal.combust <- subset(NEI, SCC %in% coalcombust.codes)
coalcombust.pm25year <- ddply(coal.combust, .(year, type), function(x) sum(x$Emissions))
colnames(coalcombust.pm25year)[3] <- "Emissions"
png("plot4.png")
qplot(year, Emissions, data=coalcombust.pm25year, color=type, geom="line") + stat_summary(fun.y = "sum", fun.ymin = "sum", fun.ymax = "sum", color = "purple", aes(shape="total"), geom="line") + geom_line(aes(size="total", shape = NA)) + ggtitle(expression("Coal Combustion" ~ PM[2.5] ~ "Emissions by Source Type and Year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
dev.off()