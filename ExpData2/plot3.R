library(ggplot2)

makePlot3 <- function() {
  data <- readRDS("data/summarySCC_PM25.rds")
  plotdata <- subset(data, fips=="24510")
  agg <- aggregate(plotdata["Emissions"], by=plotdata[c("year", "type")], FUN=sum)
  
  g <- ggplot(agg, aes(factor(year), Emissions))
  g <- g + geom_bar(stat="identity")
  g <- g  + facet_grid(. ~ type)
  
  print(g)  
}