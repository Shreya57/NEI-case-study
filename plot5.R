library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

yearwise_emissions <- NEI %>%  filter(fips == "24510" & type == "ON-ROAD") %>% group_by(year) %>%  summarize(total_emissions = sum(Emissions))
yearwise_emissions$year <- as.factor(yearwise_emissions$year)
ggplot(yearwise_emissions, aes(x=year, y=total_emissions)) + geom_bar(stat="identity") + labs(x="Year", y="PM2.5 Emissions (tons)") + ggtitle("PM2.5 Emissions from Baltimore City from Vehicle Related Sources")
ggsave('plot5.png')