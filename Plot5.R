

# Plot5.R
setwd('~/Documents/exdata_2/')
source('./readdata.R')
library('ggplot2')

readdata('~/Downloads/exdata-data-NEI_data/')

SCC$SCC_num <- as.character(levels(SCC$SCC)[SCC$SCC])
vehicletypes1 <- unique(SCC$SCC.Level.Three)[
  grep('motor', tolower(unique(SCC$SCC.Level.Three)))
  ]

vehicles_SCC <- SCC[which(SCC$SCC.Level.Three %in% vehicletypes1), 'SCC_num']

motor_vehicles <- NEI[which(NEI$SCC %in% unique(vehicles_SCC)), ]
baltimore_mv <- motor_vehicles[which(motor_vehicles$fips == '24510'),]

png(file='./Plot5.png', )
qplot(year, 
      ylab='Motor Vehicle Emissions',
      data=baltimore_mv, 
      geom='bar', 
      weight=Emissions, 
      binwidth=1,
      main='Baltimore Motor Vehicle Emissions over time')
dev.off()
