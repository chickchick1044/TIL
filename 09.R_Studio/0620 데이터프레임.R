# 데이터 프레임 만들기

# 데이터 프레임의 열이 될 벡터를 생성
id <- c('F1', 'F2', 'F3')
name <- c('김가수', '박인호', '고소미')
age <- c(32, 28, 22)
isMarried <- c(TRUE, TRUE, FALSE)
# 데이터 프레임 생성
df <- data.frame(id, name, age, isMarried)
df
str(df) # 데이터 프레임의 구조

df <- data.frame(id, name, age, isMarried, stringsAsFactors = FALSE) #문자인경우에도 팩터로 변환하지않음

str(df)

df <- data.frame(name=c("김가수", "박인호"), age=c(32,28))
df

id <- c('F1', 'F2', 'F3')
name <- c('김가수', '박인호', '고소미')
age <- c(32, 28, 22)
isMarried <- c(TRUE, TRUE, FALSE)

df <- data.frame(id, name, age, isMarried)
df
df[2,3]
df[c(2,3), c(2,4)]
df[,c(2,3)]
df[c(2,3),]
df[,c('name', 'age')]
df$name
df$age[2:3]

# iris 데이터
iris
str(iris)
nrow(iris)
ncol(iris)
head(iris) # default=6
tail(iris,3)
summary(iris) #describe

# 입력 항목명을 명시하지 않고 호출하기 -입력항목의 순서가 중요
subset(iris, Sepal.Length==7.2, c("Species", "Sepal.Length"))
#subset(Sepal.Length==7.2, iris, c("Species", "Sepal.Length")) # 입력 항목의 순서가 맞지 않을 경우 오류 발생

# 입력 변수명을 명시하고 호출하기 -순서 바꿔보기
subset(select=c("Species", "Sepal.Length"), x=iris, subset=(Sepal.Length==7.2))

# ex_df 데이터프레임 생성
name <- c('김가수', '박인호', '어만데', '이기성') 
age <- c(23, 28, 15, 22) 
weight <- c(67, 75, 73, 80)
ex_df<- data.frame(name, age, weight)
ex_df
ex_df[,]
ex_df[c("1", "2"), c("name", "weight")]
ex_df[c(1,2), c(1,3)]
ex_df[c(T,T,F,T), c(T,F,T)]

# 논리 연산
ex_df$age >25
ex_df[ex_df$age >25]

#Longley 데이터프레임
str(longley)
longley
longley[longley$GNP>200 & longley$Population>=109 & longley$Year>1960 & longley$Employed>50, ]
attach(longley)
longley[GNP>200 & Population>=109 & Year>1960 & Employed>50, ]
detach(longley)

# 추출 시 데이터 타입 확인
longley[, c("GNP", "Year")]
str(longley[,c("GNP", "Year")]) # 칼럼 두 개 추출 시, 데이터프레임

longley[,c("GNP")]
str(longley[,c("GNP")]) # 칼럼 한 개 추출 시, 벡터로 전환됨

longley[, c("GNP"), drop=FALSE]
str(longley[, c("GNP"), drop=FALSE]) # ???

# iris 데이터
str(iris)
subset(iris, Sepal.Length>=7.6 & Species=='virginica', c("Species", "Sepal.Length"))
iris[iris$Sepal.Length>=7.6 & iris$Species=='virginica', c("Species", "Sepal.Length")]



# longley 데이터
longley
install.packages("sqldf")
library(sqldf)
sqldf('select GNP, Year, Employed from longley where GNP>400')
sqldf('select Year, sum(GNP) from longley where Year>1960 group by Year')

# ex_df 데이터
ex_df
ex_df[c(1,2,4),]
ex_df[c(4,2,1),]




hotel_rooms <- read.table(file='clipboard', header=TRUE, sep='\t', stringsAsFactors = FALSE)
hotel_rooms
hotel_rooms$room_type <- as.factor(hotel_rooms$type)
hotel_rooms$room_number <- as.character()
