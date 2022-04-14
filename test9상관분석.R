x <- c(1,2,3,4,5)  # 상품 판매용 DM 발송횟수
y <- c(3,5,8,11,15)  # 제품 판매 수
mean(x)
mean(y)
cov(x, y)  # 공분산 7.5
cor(x, y)  # 상관계수

cov(1:5, 2:6)  # 공분산 2.5
plot(1:5, 2:6)
cov(1:5, c(3,3,3,3,3))  # 공분산 0
plot(1:5, c(3,3,3,3,3))
cov(1:5, 5:1)  # 공분산 -2.5
plot(1:5, 5:1)

cov(1:5, c(50,40,30,20,10))  # 공분산 -25
plot(1:5, c(50,40,30,20,10))

cov(1:5, c(500,400,300,200,100))  # 공분산 -250
plot(1:5, c(500,400,300,200,100))

cor(1:5, 5:1)  # -1
cor(1:5, c(50,40,30,20,10))  # -1
cor(1:5, c(500,400,300,200,100))  # -1

cov(1:5, c(55,43,40,15,10))  # -29.5
cor(1:5, c(55,43,40,15,10))  # -0.9682545
plot(1:5, c(55,43,40,15,10))

# 아버지와 아들의 키의 상관분석
hf <- read.csv("testdata/galton.csv")
head(hf, 3)
dim(hf)
str(hf)
summary(hf)

hf_man <- subset(hf, sex == 'M')
head(hf_man)

hf_man <- hf_man[c("father", "height")]
head(hf_man)

# 두 개의 변수 간의 관계분석
# 공분산 수식 사용
f_mean <- mean(hf_man$father)
s_mean <- mean(hf_man$height)
cat(f_mean, s_mean)
cov_sum <-  sum((hf_man$father - f_mean) * (hf_man$height - s_mean))
cov_xy <- cov_sum / (nrow(hf_man) -1)
cov_xy  # 2.368441

# 공분산 함수 사용
cov(hf_man$father, hf_man$height)  # 2.368441

# 상관 계수 수식 사용 : 공분산 / 두 변수의 표준편차 곱
r_xy <- cov_xy / (sd(hf_man$father) * sd(hf_man$height))
r_xy  # 0.3913174

# 상관 계수 함수 사용
cor(hf_man$father, hf_man$height)  # 0.3913174

cor.test(hf_man$father, hf_man$height, method = 'pearson')
