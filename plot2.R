library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

yearwise_emissions <- NEI %>% filter(fips == "24510") %>% group_by(year) %>% summarise(total_emissions = sum(Emissions))
png('plot2.png')
with(yearwise_emissions, barplot(total_emissions, names.arg = year, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Total PM2.5 Emissions from Baltimore City"))
dev.off()