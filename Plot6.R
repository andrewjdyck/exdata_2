

# Plot6.R
setwd('~/Documents/exdata_2/')
source('./readdata.R')
library('ggplot2')

readdata <- function(filelocation) {
  setwd(filelocation)
  NEI <- readRDS("./summarySCC_PM25.rds")
  SCC <- readRDS("./Source_Classification_Code.rds")
}
readdata('~/Downloads/exdata-data-NEI_data/')

SCC$SCC_num <- as.character(levels(SCC$SCC)[SCC$SCC])
vehicletypes1 <- unique(SCC$SCC.Level.Three)[
  grep('motor', tolower(unique(SCC$SCC.Level.Three)))
  ]

vehicles_SCC <- SCC[which(SCC$SCC.Level.Three %in% vehicletypes1), 'SCC_num']

motor_vehicles <- NEI[which(NEI$SCC %in% unique(vehicles_SCC)), ]
balt_la_mv <- motor_vehicles[which(motor_vehicles$fips %in% c('06037', '24510')), ]
balt_la_mv$City <- 'Baltimore'
balt_la_mv$City[which(balt_la_mv$fips == '06037')] <- 'Los Angeles'


png(file='./Plot6.png', )
p <- qplot(year, 
      ylab='Emissions',
      data=balt_la_mv, 
      geom='bar', 
      weight=Emissions, 
      binwidth=1, 
      main='Motor Emissions in Baltimore and Los Angeles')
p + facet_wrap(~ City)
dev.off()
