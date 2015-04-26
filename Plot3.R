
# Plot3.R
setwd('~/Documents/exdata_2/')
source('./readdata.R')
library('ggplot2')

readdata('~/Downloads/exdata-data-NEI_data/')

baltimore <- NEI[which(NEI$fips==24510),]

png(file='./Plot3.png', )
p <- qplot(year, 
      ylab='Total Emissions',
      data=baltimore, 
      geom='bar', 
      weight=Emissions, 
      binwidth=1)
p + facet_wrap(~ type)
dev.off()
