# R의 자료 구조(객체 타입)
# Vector, Matrix, Array, List, DataFrame

#1. Vector : 1차원 배열 형태의 자료구조
year <- 2022
is(year)
year <- "2022"
is(year)
year[1]
is.vector(year)

# 벡터 수열
# seq(from, to, by) seq(start, stop, step)
seq(1, 5)
1 : 5
seq(1, 10, 2)
seq(1, 10, length.out = 4)

rep(1:3, 3)
rep(seq(1:3), 3)
rep(1:3, each=3)
rep(1:3, each=5, times=2)

c(1, 2, 5, -3, 10, 10:15)
aa <- c(1:10)
aa

c(22, -5.7, '문자열')
c(1, 2.5, T, F)

age <- c(10, 20, 30)
age
age[1]
age[3]
age[4]
age <- c(age, 40)
age
age[10] <- 50
age
age <- append(age, 60, after = 6)
age
age <- NULL
age

v1 <- c(13, -5, 20:23, 12, -2:3)
v1
v1[1]
v1[c(2, 4, 4:7)]
v1[-c(2, 3)]  # 여집합 출력
# v1[1, 2] # incorrect number of dimensions:2차원 배열...
13 %in% v1  # vector에 포함된 값 유무 확인
11 %in% v1

nrow(v1)  # 건수 확인 : 행렬만 가능
NROW(v1)  # 건수 확인 : 행렬, 벡터 가능

a <- 1:3
b <- 4:6
a
b
a + b
a * b
a - b
a + 10
a[4] <- 2

union(a, b) # 벡터 결합 : 합집합, 중복 허용X
c(a, b)     # 벡터 결합 : 합집합, 중복 허용O
setdiff(a, b) # 차집합
b[4] <- 2
intersect(a, b) # 교집합

# --------------------
# matrix : 2차원 배열, 행렬 구조, 현대 수학에서는 행렬이 대세
a <- 1:8
dim(a) <- c(2, 4)  # matrix 생성
a
dim(a)  # 구조 확인
is(a)
class(a)
mode(a)

m <- matrix(1:5)
m
dim(m)

m <- matrix(1:9, nrow = 3)
m
dim(m)

m <- matrix(1:9, nrow = 3, byrow = T)
m
dim(m)

m <- matrix(1:10, 2)
m

# m <- matrix(1:10, 3)
# m

m[1, ]
m[ , 3]
m[2, 3]
m[1, c(2:4)]
m[1:2, c(2:4)]
m[-1, ]
m[ , -3]
m[-1, -1]

a <- matrix(c(1:9), nrow = 3, ncol = 3)
rownames(a) <- c('r1', 'r2', 'r3')
colnames(a) <- c('one', 'two', 'three')
a
a['r1', ]
ncol(a)
nrow(a)
dim(a)

a <- matrix(c(1, 2, 3, 4), 2, 2)
a
b <- matrix(5:8, 2)
b

a + b
a * b
a %*% b # 행렬곱

diag(a) # 주대각 요소 출력
a
t(a)  # 전치

x1 <- c(5, 40, 50:52)
x1
x2 <- c(30, 5, 6:8)
x2
rbind(x1, x2)
cbind(x1, x2)

# 함수를 실행하는 함수
# apply()  # lapply(), sapply(), tapply()
x <- matrix(1:9, 3)
x
apply(x, 1, max)  # 1: 행기준
apply(x, 2, max)  # 2: 열기준
apply(x, 2, mean)

func <- function(x){
  x + c(5, 10, 15)
}

apply(x, 1, func) # 사용자정의 함수 실행

head(iris, 2)
apply(iris[, 1:4], 2, mean)

# ---------------------
# array : 다차원 배열 - 행, 열, 면을 갖는 3차원 자료 구조
d <-  c(1:12)
is(d)
arr1 <- array(d)
arr1
dim(arr1)
is(arr1)

arr2 <- array(1:12, dim=c(6, 2))
arr2
dim(arr2)

arr3 <- array(1:12, dim=c(3, 2, 2))
arr3
dim(arr3)

# ----------------------
# list : 서로 다른 타입의 데이터 자료구조 (키, 값) 형태의 데이터를 담는 연관배열
li <- list("1", "홍길동", 22, "2", "고길동", 32)
li
unli <- unlist(li)
unli

num <- list(c(1:5), c(6:10), c("a", "b", "c"))
num
num[1]
typeof(num[1])
typeof(num[[1]])

num2 <- list(x=1:5, y=6:10)
num2
num2$x
num2$y