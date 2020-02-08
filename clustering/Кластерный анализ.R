# кластерный анализ результатов опроса 
#по выпитым напиткам за последние 2 недели

getwd()

# for set up new directory use setwd("way/way")

bev <- read.table(file = "beverage_r.csv", header = TRUE, sep = ";")

# Вариант 1. К среднему 0 и ст отклонению 1
# bev_2 <- scale(bev[,2:9], center=TRUE, scale=TRUE) 


# вариант стандартизации 2 (min = 0, max = 1)
# maxs <- apply(bev, 2, max)
# mins <- apply(bev, 2, min)
# bev_2 <- scale(bev, center = mins, scale = maxs - mins)
# Вариант 3. rescaler from library reshape
# Вариант 4. data.Normalization from clusterSim




# создаем матрицу попарных расстояний
dist.bev <- dist(bev[,2:9])

# clustering by WARD method (иерархический кластерный анализ)
clust_bev <- hclust(dist.bev, "ward.D")
clust_bev

plot(clust_bev)
plot(clust_bev, hang = -1, main = "Clustering",
     sub = "Subtitle", xlab = "x", ylab = "y")

# add color
rect.hclust(clust_bev, k=3, border = "red")

# разделим пользователей на 3 кластера

group <- cutree(clust_bev, k = 3)
group

# вычислим долю пьющих каждый напиток
colMeans(bev[group == 1, 2:9])*100
colMeans(bev[group == 2, 2:9])*100
colMeans(bev[group == 3, 2:9])*100

names(clust_bev)
clust_bev$merge
clust_bev$height
clust_bev$order
clust_bev$labels
clust_bev$method

# строим график "локоть"
plot(1:33, clust_bev$height, main = "График 'локоть'", 
     type = "l")

# ПРИМЕР 2. анализ потребительских предпочтений в продуктах питания по регионам

prot <- read.table(file = "protein.csv", header = TRUE, sep = ";", dec = ",")

prot_2 <- scale(prot[,2:10], center=TRUE, scale=TRUE)

#maxs <- apply(prot[,2:10], 2, max)
#mins <- apply(prot[,2:10], 2, min)
#prot_2 <- scale(prot, center = mins, scale = maxs - mins)

dist_prot_2 <- dist(prot_2[,1:9])

clust_prot_2 <- hclust(dist_prot_2, "ward.D")
clust_prot_2

plot(clust_prot_2, labels = prot[,1], hang = -1)
rect.hclust(clust_prot_2, k=4, border = "green")

group_2 <- cutree(clust_prot_2, k=4)
group_2

colMeans(prot_2[group_2 == 1, 2:9])*100
colMeans(prot_2[group_2 == 2, 2:9])*100
colMeans(prot_2[group_2 == 3, 2:9])*100
colMeans(prot_2[group_2 == 4, 2:9])*100

