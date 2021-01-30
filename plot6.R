library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

yearwise_emissions <- NEI %>% filter(fips %in% c("24510", "06037") & type == "ON-ROAD") %>%  group_by(year, fips) %>%  summarize(total_emissions = sum(Emissions))
yearwise_emissions$year <- as.factor(yearwise_emissions$year)
yearwise_emissions$county_name <- factor(yearwise_emissions$fips, levels=c("06037", "24510"), labels=c("Los Angeles County", "Baltimore City")) 
ggplot(yearwise_emissions, aes(x=year, y=total_emissions)) + 
  geom_bar(stat="identity", aes(fill=county_name), position = "dodge") +
  labs(x="Year", y="PM2.5 Emissions (tons)") +
  ggtitle("Baltimore City vs. LA County - Emissions from Motor Vehicles") +
  theme(legend.position="right")
ggsave('plot6.png')