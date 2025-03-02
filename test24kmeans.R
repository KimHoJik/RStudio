# 비계층적(분할적) 분석 - k-means 
# 계층적 군집분석에 비해 큰 dataset에 효과적이며, 
# 관측치가 군집에 영구히 할당되는 것이 최종결과를 개선시키는 방향으로 군집이 형성된다.

data <- read.csv("testdata/exam.csv", sep=' ',header = T)
head(data,8)

d_data <- dist(data, method = 'euclidean')
d_data

gra_data <- cmdscale(d_data)
gra_data
plot(gra_data, type="n")
text(gra_data)

data$avg <- apply(data[,2:5],1,mean)
head(data,3)

# k-means : k 갯수?
# 계층적 군집으로 k 갯수를 얻을 수 있다. 또는 nbclust를 사용할 수도 있다. 
install.packages("NbClust")
library(NbClust)
?scale
data_s <- scale(data[2:5])  # 군집화 할 때는 정규화 또는 표준화를 선행한다. 
head(data,3)
head(data_s,3)

# Best 군집수 얻기
nc <- NbClust::NbClust(data_s, min.nc = 2, max.nc = 5, method = 'kmeans')
nc
plot(table(nc$Best.nc[1,]))

model <- kmeans(data[,c("bun", "avg")], 4)
model

table(model$cluster)

cluster <- model$cluster
cluster
kmeans_df <- cbind(cluster, data[,c("bun", "avg")])
kmeans_df
