makePlot2 <- function() {
  data <- readRDS("data/summarySCC_PM25.rds")
  plotdata <- subset(data, fips=="24510")
  agg <- aggregate(plotdata["Emissions"], by=plotdata[c("year")], FUN=sum)
  with( agg,{ 
    plot(year,Emissions, col="black",  main="Emissions by year in Baltimore City, MD", type="p", pch=17)
    lines(year, Emissions, col="red")
    text(year, Emissions, labels=year, cex=0.7, pos=c(1,3,3,3))
    
  })  
  
}