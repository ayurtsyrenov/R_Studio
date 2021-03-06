# ???????????? ?????? ? R, ?????? 2020

#############################################
# ????? ggplot
install.packages("ggplot2")
library(ggplot2)


#????????? ?????? ?????????? ?????????

qplot(x=Species, y=Sepal.Length, data=iris, geom="point",
      main="????? ??????", xlab="????? ????????", ylab="?????")

qplot(x=Species, y=Sepal.Length, data=iris, geom="point",
      col=Species, main="????? ??????",
      xlab="????? ????????", ylab="?????")

qplot(x=Species, y=Sepal.Length, data=iris,geom="boxplot",
      col=Species, main="????? ??????",
      xlab="????? ????????", ylab="?????")

qplot(x=Species, y=Sepal.Length, data=iris, geom="jitter",
      col=Species, main="????? ??????",
      xlab="????? ????????", ylab="?????")

#????????? ????????????? ?????????????? ?????? ?????????? ?????????
qplot(x=Species, y=Sepal.Length, data=iris, geom=c("boxplot", "jitter"),
      fill=Species, main="????? ? ????? ? ???????? ??????",
      xlab="????? ????????", ylab="?????")

qplot(x=Species, y=Sepal.Length, data=iris, geom="violin",
      fill=Species, main="????????? ????????????? ???? ????????",
      xlab="????? ????????", ylab="?????")

# плотность распределения
qplot(x=Sepal.Length, data=iris, geom="density",
      main="????????? ?????????????",
      xlab="????? ????????")

qplot(x=Sepal.Length, data=iris, geom="density",fill=I("pink"),
      main="????????? ?????????????",
      xlab="????? ????????")

# ????????? ????????????? ???? ????????? ??? ?????? ???????
qplot(x=Sepal.Length, data=iris, geom="density",
      fill=Species, xlab="????? ????????")

qplot(x=Sepal.Length, data=iris, geom="density",
      fill=Species, alpha=I(0.5))

qplot(x=Sepal.Length, data=iris, geom="density",facets=Species~.,
      fill=Species, xlab="????? ????????")

################################
#??????????
install.packages("corrplot")
library(corrplot)

a=cor(iris[,-5], use = "complete.obs", method = "pearson")
corrplot(a,method="color")
corrplot(a, method="color", addgrid.col = "gray33")
corrplot(a, method="color", addCoef.col="red", addgrid.col = "gray50", tl.col = "black")
corrplot(a, method="pie", type="lower")

################################
#?????? ?????????
qplot(x=Sepal.Width, y=Sepal.Length, data=iris, geom="point",
      col=Species)

qplot(x=Sepal.Width, y=Sepal.Length, data=iris, geom="point",
      shape=Species)

################################
# ????????? ????????? ??????? ?????????
RE <- read.table ("RealEstatePrice.csv", header=T, sep=";", dec=",")

qplot(x=Square, y=PRICE, data=RE, geom="point")
qplot(x=Square, y=log(PRICE), data=RE, geom="point")
qplot(x=Square, y=log(PRICE), data=RE, geom="point", alpha=I(1/20))

# ????????? ????????? - ?????????? ?????? ????????? ?????
smoothScatter(x=RE$Square, y=log(RE$PRICE))

# ????????? ????????? - ?????????? ??????????? ?????? ? ????????????? ??????
library(hexbin)
bin <- hexbin(RE$Square, log(RE$PRICE), xbins=150)
plot(bin)

# ????????? ????????? - ????????? ????? ???????????? ??????
install.packages("IDPmisc")
library(IDPmisc)
iplot(RE$Square, log(RE$PRICE))

####################################
#??????????? ?????????
qplot(x=Sepal.Width, y=Sepal.Length, data=iris, geom="point",
      size=Petal.Length)

qplot(x=Sepal.Width, y=Sepal.Length, data=iris, geom="point",
      col=Petal.Length)

qplot(x=Sepal.Width, y=Sepal.Length, data=iris, geom="point",
      col=Species, facets=Species~.)

#################################
#??????????? ??? ?????????????? ??????
# ????????? ?????????: ??????? ?? ??????????? ??????? ????????????? ???????????? ? ???? ????????? ???????????????,
# ?????? ??????? ?????????????? ????????
View(Titanic)

install.packages("vcd")
library(vcd)
mosaic(Titanic, shade=F, legend=TRUE)
mosaic(Titanic, shade=TRUE, legend=TRUE)
mosaic(~Class+Sex+Age+Survived, data=Titanic, shade=TRUE, legend=TRUE)

# ??????? ????????? ??? ????????? ??????
install.packages("plotrix")
library(plotrix)
GDP <- c(3677, 2622, 1577, 2582, 1311)
lbls <- c("????????","??????????????","??????","???????","???????")
fan.plot(GDP, labels = lbls,main="???")
fan.plot(GDP, labels = lbls,max.span=pi, main="???")

#######################
# ?????? ????
Pr=read.table("Words_cloud.csv", header=F, sep = ";")
install.packages("wordcloud")
library(wordcloud)
wordcloud(Pr$V1, Pr$V2, scale=c(2,.5))
wordcloud(Pr$V1, Pr$V2, scale=c(2,.5),ordered.colors=T,col=terrain.colors(length(Pr$V1)))
wordcloud(Pr$V1, Pr$V2, scale=c(2,.5),ordered.colors=T,col=terrain.colors(length(Pr$V1)),rot.per=0.5)

install.packages("wordcloud2")
library(wordcloud2)
wordcloud2(data=Pr)
wordcloud2(data=Pr, size=0.8)
wordcloud2(data=Pr, size=0.8,shape = "star")

######################################
# ????????? ? ????????????? ????????????
# ????????????? ??? ????????? ???????? ?????????? ?????????? ? ??????? ?? ????????????.
library(MASS)
parcoord(iris[,1:4])

colors.1=colors()[as.numeric(iris$Species)]
parcoord(iris[,c(1:4)] , col= colors.1)

colors.1=colors()[as.numeric(iris$Species)*35]
parcoord(iris[,c(1:4)] , col= colors.1,var.label =T)

###############################################
# ???????????? ??????????? ??????????? ???????

# ????????????? ?????????? ??????
install.packages("factoextra")
install.packages("igraph")
library(factoextra)
library(igraph)

#data=read.table()

res.hc <- hclust(dist(iris[,-5]), "ward.D2")

#????????????
fviz_dend(res.hc, k = 4, color_labels_by_k = TRUE,
          rect = TRUE,type ="rectangle")
fviz_dend(res.hc, k = 4, color_labels_by_k = TRUE,
          rect = TRUE,type ="circular")
fviz_dend(res.hc, k = 4, color_labels_by_k = TRUE,
          rect = TRUE,type ="phylogenic")



##############################################
# ??????? ???????????? ??????
# https://datavizcatalogue.com/RU/index.html
