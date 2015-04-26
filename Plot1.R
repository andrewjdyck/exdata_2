
# Plot1.R
setwd('~/Documents/exdata_2/')
source('./readdata.R')

readdata('~/Downloads/exdata-data-NEI_data/')

totals <- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
names(totals) <- c('Year', 'Total.Emissions')

png(file='./Plot1.png', )
barplot(totals$Total.Emissions, names.arg=totals$Year)
dev.off()
