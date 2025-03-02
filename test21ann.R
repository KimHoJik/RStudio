# ANN( 인공 신경망)

# 논리 회로 처리를 인공신경망을 사용

library(nnet)

input <- matrix(c(0,0,1,1,0,1,0,1), ncol=2)
input
# output <- matrix(c(0,0,0,1))  # AND
# output <- matrix(c(0,1,1,1))  # OR
output <- matrix(c(0,1,1,0))  # XOR
output

# ann <- nnet(input, output, maxit = 1000, size = 1, decay = 0.001)
ann <- nnet(input, output, maxit = 1000, size = 5, decay = 0.001)
ann

result <- predict(ann, input)
result
ifelse(result > 0.5, 1, 0)

# ANN 예제 2
df <- data.frame(
  x1 = c(1:6),
  x2 = c(6:1),
  y = factor(c('n','n','n','y','y','y'))
)

str(df)
df

library(nnet)

model_net <- nnet(y ~ ., data = df, size = 1)
model_net
summary(model_net)

install.packages("devtools")
library(devtools)
source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')
plot.nnet(summary(model_net))

# 분류 예측
model_net$fitted.values  # 분류모델 적합값
predict(model_net, df)   # 분류모델 적합값

ifelse(predict(model_net, df) > 0.5, 1, 0)

p <- predict(model_net, df, type='class')
p

table(p, df$y)


# ANN 예제 3 - iris dataset
head(iris, 3)
unique(iris$Species)

# train / test
set.seed(123)
idx <- sample(1:nrow(iris), 0.7 * nrow(iris))
idx
train <- iris[idx, ]
test <- iris[-idx, ]
dim(train)  # 105   5
dim(test)  # 45  5

model_iris1 <- nnet::nnet(Species ~ ., data = train, size = 1)  # 뉴런의 갯수가 1개
model_iris1
summary(model_iris1)

source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')
plot.nnet(summary(model_iris1))

model_iris2 <- nnet::nnet(Species ~ ., data = train, size = 3)  # 뉴런의 갯수가 3개
model_iris2
summary(model_iris2)

source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')
plot.nnet(summary(model_iris2))

# 분류 모델 성능 비교
pred1 <- predict(model_iris1, test, type="class")
t1 <- table(pred1, test$Species)
t1
sum(diag(t1)) / nrow(test)