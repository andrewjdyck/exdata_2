
# Plot1.R
setwd('~/Documents/exdata_2/')
#source('./readdata.R')

readdata <- function(filelocation) {
  setwd(filelocation)
  NEI <- readRDS("./summarySCC_PM25.rds")
  SCC <- readRDS("./Source_Classification_Code.rds")
}
readdata('~/Downloads/exdata-data-NEI_data/')

totals <- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
names(totals) <- c('Year', 'Total.Emissions')

png(file='./Plot1.png', )
barplot(totals$Total.Emissions, 
        names.arg=totals$Year,
        ylab='Emissions',
        xlab='Year',
        main='USA PM2.5 Emissions')
dev.off()
