library("dplyr") # обработка данных
library("ggplot2") #визуализация
library("GGally") #матрица диаграм рассеивания
library("psych") #описательные статистики

d <- cars
glimpse(d)
help(cars)
head(d)
tail(d)
describe(d)
ncol(d)
nrow(d)
str(d)


mean(d$speed)
# change value
d2 <- mutate(d, speed=1.67*speed,
             dist=0.3*dist, ratio=dist/speed)

glimpse(d2)
# visualization
qplot(data=d2, dist, xlab="Длина тормозного пути", ylab = "Количество машин", main = "Данные 1920х годов")

qplot(data=d2, speed, dist)

# если много переменных, то через +
model <- lm(data=d2, dist~speed)
model

beta_hat <- coef(model)
beta_hat

eps <- residuals(model)
eps
y <- d2$dist
y_hat<-fitted(model)

RSS <-deviance(model)
RSS
TSS <- sum((y-mean(y))^2)
TSS
ESS <- TSS - RSS
ESS
R2 <- ESS/TSS
R2
cor(y,y_hat)^2
X <- model.matrix(model)
X

nd <- data.frame(speed=c(40,60))
nd
predict(model, nd)

qplot(data=d2, speed, dist) + stat_smooth(method="lm")

# another data
t <- swiss
summary(t)
glimpse(t)
describe(t)

ggpairs(t)
model2 <- lm(data=t, Fertility~Agriculture 
             + Education+Catholic)
model2
#y^
fitted(model2)
#eps
residuals(model2)
#RSS
deviance(model2)

report <- summary(model2)
report
report$r.squared

cor(t$Fertility, fitted(model2))^2

nd2 <- data.frame(Agriculture=0.5, Catholic=0.5, Education=20)
predict(model2,nd2)

rm(list = ls())
