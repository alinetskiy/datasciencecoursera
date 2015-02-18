
makePlot4 <- function() {
  data <- readRDS("data/summarySCC_PM25.rds")
  class <- readRDS("data/Source_Classification_Code.rds")
  class["source"] = as.character(class[,"SCC.Level.Three"])
  coalClass = class[grep("coal", class$source, ignore.case = TRUE),]
  d1 <- subset(data, data$SCC %in% coalClass$SCC)
  agg <- aggregate(d1["Emissions"], by=d1[c("year")], FUN=sum)
  with( agg,{ 
    barplot(Emissions,   main="Emissions by year for coal sources", xlab="Year", names.arg=year, col="green")
 })  
  
} 