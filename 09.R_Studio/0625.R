install.packages("ggplot2")
search()
searchpaths()
library(ggplot2)

13%/%4  #3
13%%4 #1

v <- c(3,1,TRUE)
t <- c(4,1,FALSE)
print(v&t) # AND연산
print(v|t) # OR연산

# R은 default로 factor 연산을 한다. SQL에서의 연산과 다르다!
# 모든것은 factor로 선언되는데, 그 안에서 numeric, charactor 등
a1 <- 1
a2 <- c(1)
a3 <- c(1,2,FALSE) # 세가지 전부 factor

b1 <- TRUE
class(b1)
mode(b1)
b2 <- 24.5
class(b2)
mode(b2)

b3 <- 3L # L: 명시적으로 int로 전환
class(b3)
mode(b3)

b4 <- "TRUE"
mode(b4)

b5 <- 3+4i
mode(b5)

apple1 <- 'red'
apple2 <- c('red')
apple3 <- c('red', 'yellow')
apple4 <- c('red', 'yellow', 20)
mode(apple1)
mode(apple2)
mode(apple3)
mode(apple4) # factor는 모든 요소를 같은 타입으로 맞춘다.

data <- 'test data'
data2 <- "test data"

ls() #변수에 대한 리스트를 리턴
rm(list=ls()) #리스트에 있는걸 전부 지움

#paste
data3 <- "I am"
data4 <- "a Girl"
paste(data3, data4)
data5 <- paste(data3, data4)
paste(data3, data4, sep="") #공백없이 문자열을 붙여줌

#format
format(120.3333, digits=4)
format(14.7, width=10)
data6 <- "This is mine, Have good lunch"
substring(data6, 2, 4) # 문자열 추출 #2부터 4까지 #R은 1부터 센다.

#seq 
data7 <- seq(5,9)
data7
data8 <- seq(5,9,0.5) # 그래프 그릴때 많이 사용
data8

# 리스트
data9 <- c('sun', 'mon', 'tue', 'wed', 'thur', 'fri', 'sat')
length(data9)
data9[1]
data9[c(1)] #위와 동일
data9[c(1,3)] # 1과 3을 출력
data9[1:3] #1부터 3까지 출력
data9[c(-1)]
data9[-1]
data9[c(-1,-3)]
data9[c(TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE)] #TRUE인 1, 3을 출력

data10 <- c(1,2)
data11 <- c(3,4)
data10 + data11

data12 <- c(1,2,1,2)
data12 + data11 # broadcasting

#data13 <- c(1,2,3)
#data13 + data12 #개수가 배수가 아니어서 경고

#sort
data13 <- c(1,2,3,4,10,9,8,7,6,5)
sort(data13)
sort(data13, decreasing=TRUE)
data.test #그냥 변수이름에 .이 포함된것일 뿐


#names
data14 <- c(1,2,3,4)
names(data14) <- c("One", 'Two', "Three", "Four")
print(data14)
data14
data15 <- 1:3 #seq는 중간에 구간을 정할수있다.
data16 <- c(1,3)
data15
data16

data17 <- c(1,2,3)
data17
data18 <- seq(1,10,by=0.5)
data18

data19 <-c("East", "West", "East", "North", "North", "East")
mode(data19) #character type
data20 <- factor(data19) #Levels
mode(data20) #numeric type
is.factor(data20) # factor가 맞다.TRUE
data22 <- factor(data19, levels=c("East", "West", "North") )
data22
data23 <- factor(data19, levels=c("East", "West", "North", "South") )
data23

data24 <- gl(3,4, labels=c("East", "West", "South") ) # 카테고리3개를 4번 반복
data24
data24 <- gl(1,4, labels=c("East", "West", "South") )
data24

# Matrix
data25 <- matrix(c(1,2,3,4))
data25
data26 <- matrix(c(1,2,3,4),nrow=2)
data26
data27 <- matrix(3:14, nrow=4)
data27
data28 <- matrix(1:6, nrow=2, ncol=3)
data28

data29 <- matrix(3:14, nrow=4)
data29

data29 <- matrix(3:14, nrow=4, byrow = FALSE)
data29

#data30 <- list(3:14, nrow=4, byrow=TRUE, dimnames = list(c('row1', 'row2', 'row3'), c('col1','col2','col3'))

data31 <- data29
data29
data31
data32 <- data29+data31
data32

data33 <- c(1,2,3)
data34 <- c(10,11,12,13,14,15)
data35 <- array(c(data33, data34), 
                dim=c(3,3,2))
data35
data35[3,3,1]
data35
data35[,,2]


# List
data37 <- list("Apple", "Green", 10.20, c(1,2,3,4))
data37 #리스트는 다양한 타입을 저장할수있다.
data37 <- list("Apple", "Green", 10.20, c(1,2,3,4),
               c('test1', 'test2', 3) )
data37
data38 <- list("Apple", "Green", 10.20, c(1,2,3,4),
               matrix(c(1,2,3,4)) )
data38 
mode(data38[1]) #리스트

data39 <- list("Apple", "Green", 10.20, c(1,2,3,4),
               c('test1', 'test2', 3),
               matrix(c(1,2,3,4)),
              list(1, "2", TRUE))
data39
data39[7] 
data39[7][2] #리스트안의 리스트에 접근할수있다.

d <- data39[[6]]
d
d1 <- data39[6]
d1
d[,1]
names(data39) <- 1:7
data39
names(data39) <- c('item1', #라벨링
                   'item2',
                   'item3',
                   'item4',
                   'item5',
                   'item6',
                   'item7')
data39
data39$item1

# 데이터 프레임
temp <- c(1,2,3,4)
df <- data.frame(temp)
df
class(df)
temp2 <- matrix(c(1,2,3,5,4))
df2 <- data.frame(temp2)
df2
emp <- data.frame(
  emp_id = c(1:3), 
  emp_name = c('Tom', 'John', 'Amy'),
  salary = c(2000, 3000, 4000),
  start_date = c('2019-01-01', '2019-02-01', '2019-03-01'),
  stringAsFactors = FALSE
)
emp
str(emp)
summary(emp)

emp[1,2]
emp[c(1,3), c(1,2)]
emp$dept <- c('IT', 'HR', 'Finance')
emp

new.data <- data.frame(
  emp_id = c(4,5),
  emp_name = c('Tom', 'Jerry'),
  salary = c(2000,3000),
  start_date = c('2019-10-11', '2019-10-20'),
  dept = c('IT', 'Finance'),
  stringAsFactors = FALSE
  )
new.data
emp2 <- rbind(emp, new.data)



remoteLogin("http://testmlserver.eastus.cloudapp.azure.com:12800", 
            session=TRUE, 
            diff=TRUE, 
            commandline = TRUE, 
            username='admin', 
            password='Pa$$w0rd2019')



