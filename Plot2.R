
# Plot2.R
setwd('~/Documents/exdata_2/')
source('./readdata.R')

readdata('~/Downloads/exdata-data-NEI_data/')

baltimore <- NEI[which(NEI$fips==24510),]
total_baltimore <- aggregate(baltimore$Emissions, by=list(baltimore$year), FUN=sum)
names(total_baltimore) <- c('Year', 'Total.Emissions')

png(file='./Plot2.png', )
barplot(total_baltimore$Total.Emissions, names.arg=total_baltimore$Year)
dev.off()

