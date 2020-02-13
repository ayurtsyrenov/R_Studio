#setwd("~/Data analytics/R/R_Studio/EDU")

(g<-8)


#c()- create a vector
#t() - transponate a matrix

#inf (-inf) - это бесконечность 

y = seq(2,30, by=3)
y

z = seq(10,30, length.out = 10)
z

z.4 = rep(c(5,4,3), c(2,4,3))
z.4

vec = c(2,4,NA,5,6)
vec

max(vec, na.rm = TRUE)
mean(vec, na.rm = TRUE)

# знаки после запятой - это важно

w <- c(1,8,2,6,3,8,5,5,5,5)
sum(w)
log10(w)
log(exp(w))
z = (w - 5.4)/3.875
z
round(z)

y = max(w) - min(w)
y

w[w!=5]

# diagram

View(iris)

hist(iris$Sepal.Length, main = "Гистограмма распределения длинны
     лепесточка", xlab = "Длина", ylab = "ширина", nclass = 10, 
     freq = F, labels = T)

plot(iris$Species)
plot(sample(iris$Species, 70, F))

group = c(18,30,32,10,10)
lab = c("A", "B", "C", "D", "F")

pie(group, lab, col = c("grey", "grey20", "grey40", "grey60", "grey80"))

plot(iris$Sepal.Length, iris$Sepal.Width, type ="l")

x = seq(0,10, 0.01)
y = sin(x)
plot(x, y, main = "y=sin(x)",
     xlab = "x", ylab="y", col = "red")
plot(iris$Petal.Length, iris$Petal.Width)
points(iris$Sepal.Length, iris$Sepal.Width, col="blue")
plot(iris)
plot(iris[,1:4])

install.packages("ggplot2")
library(ggplot2)

# сравнение данных нескольких категорий
x = iris$Species
y = iris$Sepal.Length
qplot(x, y, geom="point", main="Iris data")




