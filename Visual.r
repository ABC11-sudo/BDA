library(graphics)
library(datasets)
data(mtcars)
str(data)

#scatterplot
 plot(mtcars$mpg,
+ xlab="Number of cars",
+ ylab="Millions per Gallon",
+ col="red",
+ pch=19)

#Histogram
hist(mtcars$hp,
+ xlab="Horsepower",
+ ylab="Frequency",
+ main="Distribution of Horse power")

#Bar Graph
avg_mpg <- aggregate(mpg~cyl , data=mtcars, FUN=mean)
barplot(avg_mpg$mpg,       
+         names.arg = avg_mpg$cyl,    
+         col = "blue",
+         xlab = "Number of Cylinders",
+         ylab = "Average MPG",
+         main = "Average MPG by Number of Cylinders")
