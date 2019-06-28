remoteLogin(
  "http://testmlvm.eastus.cloudapp.azure.com:12800",
  session=TRUE,
  diff=TRUE,
  commandline = TRUE,
  username="admin",
  password="Pa$$w0rd2019"
)
#exit

# Azure Database용
conString <- "Driver=SQL Server;Server=testmldb0139.database.windows.net; Database=AirlineData;Uid=admin0139;Pwd=Pa$$w0rd2019"
airportData <- RxSqlServerData(connectionString = conString, table = "Airports")
colClasses <- c(
  "iata" = "character",
  "airport" = "character",
  "city" = "character",
  "state" = "factor",
  "country" = "factor",
  "lat" = "numeric",
  "long" = "numeric")
csvData <- RxTextData(file = "C:\\TestData\\airports.csv", colClasses = colClasses)
rxDataStep(inData = csvData, outFile = airportData, overwrite = TRUE)

sqlConnString <- "Driver=SQL Server;Server=testmldb0139.database.windows.net;Database=AirlineData;Trusted_Connection=True"

connection <- RxSqlServerData(connectionString = sqlConnString,
                              table = "dbo.Airports", rowsPerRead = 1000)

# Use R functions to examine the data in the Airports table
head(connection)
rxGetVarInfo(connection)
rxSummary(~., connection)



refactoredData = "C:\\Users\\user\\Desktop\\teacher\\20190627\\2000Refactored.xdf"
refactoredXdf = RxXdfData(refactoredData)

#rxFactors(inData = filteredData, outFile = refactoredXdf, 
#          overwrite = TRUE, factorInfo = c("Origin", "Dest"))

rxFactors(inData = "C:\\Users\\user\\Desktop\\teacher\\20190627\\2000.xdf", outFile = refactoredXdf, 
          overwrite = TRUE , factorInfo = c("Origin", "Dest"))



rxSummary(Delay~Origin, refactoredXdf)

# Generate a crosstab showing the average delay 
# for flights departing from each origin to each destination
rxCrossTabs(Delay ~ Origin:Dest, refactoredXdf, means = TRUE)

# Generate a cube of the same data
rxCube(Delay ~ Origin:Dest, refactoredXdf)

# Omit the routes that don't exist
rxCube(Delay ~ Origin:Dest, refactoredXdf, removeZeroCounts = TRUE)
