attach(mtcars)
dotchart(mtcars$mpg,labels=row.names(mtcars),cex=.7,
  	main="Dotchart of Gas Milage for Car Models", 
   xlab="Miles Per Gallon")

counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Barplot of Car Distribution by Gears and VS",
  xlab="Number of Gears", col=c("darkblue","red"),
 	legend = rownames(counts))

counts<- table(mtcars$cyl)
lbls <-paste("(",names(counts),")", "\n", counts, sep="")
pie(counts, labels = lbls, main="Pie Chart of Cylinder Numbers")

boxplot(mpg~cyl,data=mtcars, main="Boxplot of Car Milage Data", 
    col=(c("gold","darkgreen", "red")),
  	xlab="Number of Cylinders", ylab="Miles Per Gallon")

plot(wt, mpg, main="Scatterplot MPG vs. Car Weight", 
  	xlab="Car Weight ", ylab="Miles Per Gallon ", pch=19)
  	
hist(mtcars$mpg, breaks=12, col="red", main="Histogram of MPG")
