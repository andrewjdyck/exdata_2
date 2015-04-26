
# Plot4.R
setwd('~/Documents/exdata_2/')
source('./readdata.R')
library('ggplot2')

readdata('~/Downloads/exdata-data-NEI_data/')

SCC$SCC_num <- as.character(levels(SCC$SCC)[SCC$SCC])
coaltypes1 <- unique(SCC$SCC.Level.Three)[
  grep('coal', tolower(unique(SCC$SCC.Level.Three)))
]
coalSCC3 <- SCC[which(SCC$SCC.Level.Three %in% coaltypes1), 'SCC_num']

coal <- NEI[which(NEI$SCC %in% unique(coalSCC3)),]

png(file='./Plot4.png', )
qplot(year, 
 ylab='Total Coal Emissions',
 data=coal, 
 geom='bar', 
 weight=Emissions, 
 binwidth=1,
 main='USA Coal Emissions on the Decline')
dev.off()
