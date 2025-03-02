# DataFrame : 데이터베이스의 테이블과 유사한 구조. 열 단위로 타입이 다를 수 있다.

# 1) vector로 data.frame
no <- c(1,2,3)
name <- c('hong', 'lee', 'kim')
df <- data.frame(no, name)
df
typeof(df)
df$bunho
df$irum

df <- data.frame(irum=c('james', 'oscar', 'tom'), nai=c(27,25,34),
                 row.names=c('one', 'two', 'three'))
df
head(df, 2)
tail(df, 2)
nrow(df)
ncol(df)
str(df)
summary(df)

# 2) matrix로 data.frame
m <- matrix(c(1,'홍길동', 170, 2, '나길동', 177, 3, '신길동', 187), 3, by=T)
m
mdf <- data.frame(m)
mdf

m <- matrix(1:6, nrow=3)
mdf <- data.frame(m)
mdf
colnames(mdf) <- c('c1', 'c2')
mdf

mdf$c1
mdf['c1']
mdf[1]
mdf[-1]
mdf[1,2]
mdf[1:2,1:2]
mdf[1:2,c(1,2)]

mdf
mdf[mdf$c1 ==2, ]
subset(mdf, c1 == 2)
? subset

mdf[mdf$c1 == 2 & mdf$c2 == 5, ]
subset(mdf, c1 == 2 & c2 == 5)

mdf[mdf$c1 == 2, c(1, 2)]
subset(mdf, c1 == 2, select = c(1, 2))
# subset(mdf, select = c(2))

mdf
mdf$c2 <- ifelse(mdf$c2 == 4, NA, mdf$c2)
mdf

summary(mdf)

mean(mdf$c2)
mean(mdf$c2, na.rm = T)

# 행 또는 열 추가
mdf
mdfr <- rbind(mdf, c(10, 11))  # 행 추가
mdfr
mdfc <- cbind(mdf, c3 = c("a", "b", "c"), c4 = c("a1", "a2", "a3"))  # 열 추가
mdfc

mdfc[, 'c3'] <- NULL  # 열 삭제
mdfc

mdfr <- mdfr[-1, ]  # 행 삭제
mdfr

# 기본 데이터세트 읽기
data('iris', package = 'datasets')
head(iris)
typeof(iris)
is(iris)

# merge : 데이터프레임 병합
height <- data.frame(id=c(1,2,3), h=c(180,175,178))
weight <- data.frame(id=c(1,2,3), h=c(80,75,88))
height
weight
merge(height, weight, by.x="id", by.y="id")

sid <- c(100, 110, 120, 130)
score <- c(90, 85, 70, 65)
gender <- c('M', 'F', 'M', 'F')
major <- c('경영', '교육', '컴공', '사회')
student <- data.frame(sid, score, gender, major)
student

str(student)
plot(student$score)

# 조건에 맞는 부분 자료 얻기
subset(student, score >= 70)
subset(student, subset=(score>=70))
subset(student, score >=70 & gender == 'M')
subset(student, select=c(sid, gender))
subset(student, select=c(-sid, -gender))
subset(student, select=c(sid, gender), score <= 80)