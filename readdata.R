

# A function to read data in
readdata <- function(filelocation) {
  setwd(filelocation)
  NEI <- readRDS("./summarySCC_PM25.rds")
  SCC <- readRDS("./Source_Classification_Code.rds")
}