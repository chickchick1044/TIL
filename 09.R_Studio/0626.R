setwd('C:\\Users\\user\\Desktop\\강사공유\\20190626')

df <- read.csv('income.csv',
               header=TRUE,
               stringAsFactors=FALSE)

str(df)
#plyr
#dplyr(o)

options(repos = c(CRAN = 'https://cloud.r-project.org'))
install.packages('dplyr', repos = 'https://cloud.r-project.org')

library(dplyr)
library(magrittr)
sample_n(df,3)
sample_frac(df,0.1)
df2 <- distinct(df)
df2
df <- read.csv('income.csv',
               header=TRUE,
               stringAsFactors=FALSE)
str(df)
select(df, Index, State:Y2008)
select(df, Index, State)
select(df, State)
select(df, -Index, -State)
select(df, -c(Index, State))
select(df, starts_with("Y"))
select(df, containes("I"))

select(df, State, everything())
df2 <- rename(df, Index2=Index)
names(df2)
filter(df, Index=='A')
filter(df, Index %in% "A")
filter(df, Index %in% c("A", "C"))

filter(df, Index %in% c("A", "C") & Y2002>=1400000)
filter(df, !Index %in% c("A", "C") )
filter(df, grepl("Ar", State))

summarise(df, Y2015_mean=mean(Y2015))

# arrange
df3 <- select(df, Index)
df3
df4 <- arrange(df3, Index)
head(df4)
df5 <- arrange(df3, desc(Index))
df5
df6 <- arrnage()

df7 <- arrange(df6, desc(Index), State)
df7

group_by(df, Index)
#summarise_at(group_by(df, Index), vars(Y2011,Y2012))

a <- 10
if(is.integer(a)){
  print("X is an Integer")
}
a1 <- 10L
if(is.inter(a1)){
  print("X is and Integer");
  
  
}

a2<- c("What", "is", "truth")

if("Truth" %in% a2){
  print("True")
}else{
    'Flash'
  pritn(Flse)
}
a3 <- switch(3, "One", "Wo", )
a4 <-c("Hello", "R loop")
cnt <- 2

a7 <- letters[1:4]
for(i in a6){
  print(i)
}


# function
# built-in functions
print(seq(1,10))

#user-defined functions
myfunc <- function(a){
  for(i in 1:a){
    b <- i*2
    print(b)
  }
}
myfunc(10)

myfunc2 <- function(){
  for(i in 1:5){
    print(i*2)
  }
}
myfunc2()

myfunc3 <- function(a,b){
  r <- a+b
  print(r)
}
myfunc3(1,2)
myfunc3(b=1, a=1)

myfunc4 <- function(a=0, b=0){
  r <- a+b
  print(r)
}
myfunc4(a=1)
myfunc4(b=2)
myfunc5 <- function(a){c<-a}
myfunc5(1)

df <- read.csv("exam.csv")
str(df)

df %>%
  arrange(class, desc(id)) %>%
  head(5)

df %>%
  arrange(class, desc(id))

df %>%
  arrange(class, desc(id)) %>%
  mutate(total=math+english+science,
         mean=(math+english+science)/3 )

df %>%
  group_by(class) %>%
  summarise(mean_math = mean(math),
            median_math=median(math),
            sum_math = sum(math),
            count_math=n()) #빈도(건수)

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg) #자동차 정보
str(mpg)
select(mpg, class)

mpg %>%
  group_by(class) %>%
  summarise(mean_cty=mean(cty))

# 어떤 회사의 자동차 hwy(연비)가 가장 높은 지 알아보려고 한다.
# hwy평균이 가장 높은 회사 5곳을 출력하시오

mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy=mean(hwy)) %>%
  arrange(mean_hwy) %>%
  tail(5)

# 1. 자동차 배기량에 따라 고속도로 연비가 다른지
# displ이 4이하인 자동차와 5이상인 자동차중 어떤 자동차의 hwy가 평균적으로 더 높은지 알아보세요
mpg %>%
  group_by(manufacturer) %>%
  group_by(displ<=4) %>%
  group_by(displ>=5) %>%
  filter(displ<=4 | displ>=5) %>%
  summarise(mean_hwy=mean(hwy)) %>%
  arrange(desc(mean_hwy))

# 2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 한다.
# audi와 toyota중 어느 manufacturer의 cty가 평균적으로 더 높은지
mpg %>%
  group_by(manufacturer) %>%
  filter(manufacturer=='toyota' | manufacturer=='audi' ) %>%
  group_by(manufacturer) %>%
  summarise(mean_cty=mean(cty)) %>%
  arrange(desc(mean_cty))

# 3. "chevrolet", ford, honda 이 회사들의 자동차를 추출한 뒤 hwy의 전체 평균을 구해보세요
mpg %>%
  group_by(manufacturer) %>%
  filter(manufacturer == c('chevrolet') || manufacturer== c('ford')|| manufacturer==c('honda')) %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy=mean(hwy))

# 4. mpg 데이터 복사본을 만들고, cty와 hwy를 더한 '합산 연비 변수'를 추가하세요
mpg_copy <- mpg %>%
  mutate(total=sum(cty, hwy))
mpg_copy


# 5.앞에서 만든 '합산 연비 변수'를 2로 나눠 '평균 연비 변수'를 추가하세요
mpg_copy <- mpg_copy %>%
  mutate(avg=sum(cty, hwy)/2)
mpg_copy

# 6.'평균 연비 변수'가 가장 높은 자동차 3종의 데이터를 출력
mpg_copy %>%
  group_by(manufacturer) %>%
  arrange(desc(avg)) %>%
  head(3)

  
# 7. 어떤 회사에서 compact(경차)를 가장 많이 생산하는지,
#각 회사별 compact 차종수를 내림차순으로 정렬
mpg %>%
  filter(class=='compact') %>%
  group_by(manufacturer) %>%
  summarise('count'==n()) %>%
  arrange(desc(count))
  
  
  
  
  