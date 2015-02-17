makePlot1 <- function() {
  data <- readRDS("data/summarySCC_PM25.rds")
  agg <- aggregate(data["Emissions"], by=data[c("year")], FUN=sum)
  with( agg,{ 
       plot(year,Emissions, col="black",  main="Emissions by year", type="p", pch=17)
       lines(year, Emissions, col="red")
       text(year, Emissions, labels=year, cex=0.7, pos=c(1,3,3,3))
       
  })  
  
} 

makePlot1_bar <- function() {
  data <- readRDS("data/summarySCC_PM25.rds")
  agg <- aggregate(data["Emissions"], by=data[c("year")], FUN=sum)
  with( agg,{ 
    barplot(Emissions,   main="Emissions by year", xlab="Year", names.arg=year, col="green")
 })  
  
} 