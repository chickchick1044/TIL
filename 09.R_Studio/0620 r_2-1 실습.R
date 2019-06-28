# love 변수에 1을 지정
love <- 1
print(love)

# 값이 1로 설정된 love변수에 문자열 지정
love <- "안녕하세요"
print(love)

# 현재 문자열인 love를 함수처럼 사용해보면 오류 발생
love("이제 나는 함수가 될 수 있을 까?")

#love 변수에 print함수를 지정
love <- print
love("나는 이제 함수다")

#객체 설정
love_num <- 1
love_str <- "안녕하세요"
love_vec <- c(1,1,1,1) #벡터(array)
love_fun <- print

str(love_num)
str(love_str)
str(love_vec) # 인덱싱이 1부터
str(love_fun)

# B는 A로 부터 지정된 객체
A <- 1
B <- A
print(A)
print(B)

# A의 값을 변경하더라도 B의 값은 여전히 1이다.
A <- 9
print(A)
print(B)

#벡터를 생성할 때 문자와 숫자를 함께 사용하면 문자로 통일된다.
vec_t <- c(1, "hi", 2) # array는 동일한 데이터 타입
vec_t # 따라서 문자형(char)으로 통일되었다.
str(vec_t) # 인덱싱이 1부터

# 1로 선언하면 벡터로 인식
scalar_item <- 1
scalar_item
vector_item <-c(1)
vector_item
identical(scalar_item, vector_item) # 두 객체가 동일하다.

# 숫자형 벡터 - 양수, 음수, 소수점 모두 하나의 벡터에 담을 수 있다.
numeric_vector <- c(0.2, -1, 2, -0.5)
numeric_vector
mode(numeric_vector) # numeric vector 타입 확인

# 숫자 벡터
n_vector <- c(1,2,3,4,5,6,7,8,9)
min(n_vector)
max(n_vector)
mean(n_vector)
median(n_vector)
sum(n_vector)

# inf와 NAN이 포함된 벡터 만들기
numeric_vector <- c(1/0, 2/2, -2/2, -1/0, 0/0)
numeric_vector

# 논리 벡터
ex_logical_1 <- c(TRUE, FALSE, TRUE, FALSE) # True, False로 설정
mode(ex_logical_1)

ex_logical_2 <- c(T,F,T,F) # T, F로도 설정 가능
ex_logical_2

ex_logical_3 <- c(true, false, true, false) #소문자는 오류

ex_logical_4 <- c("TRUE", "FALSE", "TRUE", "FALSE") #따옴표를 붙이면 문자열로 인식
ex_logical_4
mode(ex_logical_4) # char 타입으로 설정

ex_logical <- as.logical(0, -1, 1, 100, -7) # as: logical 변수로 형변환
print(ex_logical)
as.numeric(ex_logical)

# 문자 개수 출력
substr("1234567", 2, 4) # strip과 동일
substr(c("F123", "F124", "F125", "F126"), 2,4)

# 문자열 합치기
paste("50=", "30+", "20", sep="") # join과 동일한 역할
paste("50", "30", "20", sep="*")

# 대소문자 변환
toupper("AbCdEfGhIjKlMn") 
tolower("AbCdEfGhIjKlMn")

# facor함수로 팩터 생성
v_character <- c("사과", "복숭아", "사과", "오렌지", "사과", "오렌지", "복숭아")
v_character

v_factor <- factor(v_character)
v_factor #factor함수는 내부적으로 level을 통해 관리
mode(v_factor) # 문자로 출력되지만 데이터 타입은 숫자(numeric)타입
str(v_factor) # 객체 정보 확인

# 팩터를 문자벡터 또는 숫자벡터로 변환
    #as.char:형변환, str과 동일한 역할



#factor함수에서 내부적으로 level을 통해 관리
#ordered: 서열이 있는 범주


#등급을 나타내는 문자 벡터
ex_label <- c("하하", "중하", "중", "중상", "상")
ordered_factor <- factor(ex_label)
ordered_factor
factor(ex_label, level=c("하하", "중하", "중", "중상", "상"), ordered=T)

#as.numeric: 숫자로 변환

# t_vector[idx] : fancy index : 인덱스를 여러개 넣음
#seq: range()와 동일

