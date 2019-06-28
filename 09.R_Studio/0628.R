ls("package:datasets")
test_data <-
  c(850, 740, 900, 1050, 1020, 940, 930, 870, 980, 900,
    800, 740, 630, 1050, 960, 960, 810, 760, 980, 1000)
test_data

plot(test_data)
plot(1:10)
stem(test_data)
hist(test_data)
qqnorm(test_data)
boxplot(test_data) # 중간값(평균x), 아웃라이어 -> 분포를 살필때 사용한다.
summary(test_data) # 4분위
mean(test_data)
min(test_data)
sd(test_data) #표준편차
var(test_data) # 분산

plot(attitude)

test <- lm(rating ~ complaints, data=attitude) # ~: 연관 # y~x: y는 x에 대한 종속변수
test
summary(test)

#rxSummary()
library(readr)
library(RevoScaleR)
list.files(rxGetOption("sampleDataDir"))
inDataFile <- file.path(rxGetOption("sampleDataDir"),
                        "mortDefaultSmall2000.csv")
inDataFile

mortData <- rxImport(inData = inDataFile)
str(mortData)
rxGetVarInfo(mortData)
nrow(mortData)
ncol(mortData)
names(mortData)
head(mortData, 3)
rxGetInfo(mortData, getVarInfo = TRUE, numRows=5)

rxHistogram(~creditScore, data=mortData) #빈도기때문에 x만 필요하다.
mortData2 <-
  rxDataStep(inData= mortData,
             varsToDrop = c("year"), 
            rowSelection = creditScore<800  )
mortData2
rxHistogram(~creditScore, data=mortData2)
#rxHistogram(~creditScore, data=mortData)

mortData3 <- rxDataStep(inData= mortData,
                        varsToDrop = c("year"),
                        rowSelection = creditScore<800,
                        transforms = list( catDept = cut(ccDebt, breaks = c(0,6500,1300),
                                        labels =  c("Low Debt", "High Debt")),
                        lowScore = creditScore<625 ))
#rxGetVarInfo(mortData)

mortCube <- rxCube(~F(creditScore):catDept,
                   data=mortData3)
head(mortCube)
rxLinePlot(Counts ~ creditScore | catDept, 
           data = rxResultsDF(mortCube))

# ex1. Visualizing data using the ggplot2 package


# ex2. Examining relationships in bigdata using the rxLinePlot function

# ex3. Creating histograms over bigdata


