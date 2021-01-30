library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore_data <- NEI[NEI$fips=="24510",]
ggplot(baltimore_data,aes(factor(year),Emissions)) +
  geom_bar(stat="identity") +
  facet_grid(.~type) + 
  labs(x="Year", y=expression("Total PM2.5 Emission (tons)")) + 
  labs(title=expression("PM2.5 Emissions from Baltimore City by Source Type"))
ggsave("plot3.png")
