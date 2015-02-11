# Getting_and_Cleaning_Data
# Quiz 1

# ref: https://github.com/rfoxfa/Getting_and_Cleaning_Data/blob/master/Quiz_1.md

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./Quiz1/data/Fss06hid.csv")
list.files("./Quiz1/data")

# Question 1

data <- data.frame(read.csv("C:/Users/ezetee/Documents/Coursera/Coursera - Getting and Cleaning Data - getdata-010/Quiz1/data/Fss06hid.csv"))
#Ans: [1] 53
sum(!is.na(data$VAL[data$VAL==24]))


# Question 2
# Ans: 
# Tidy data has one variable per column.

# Question 3
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile="./Quiz1/data/gov_NGAP.xlsx", mode="wb")
# install.packages('xlsx',repos='http://cran.r-project.org')
library(xlsx)
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("./Quiz1/data/gov_NGAP.xlsx", sheetIndex=1, header=TRUE, colIndex=colIndex, rowIndex=rowIndex)
#Ans: [1] 36534720
sum(dat$Zip*dat$Ext,na.rm=T)

# Question 4
# install.packages('XML',repos='http://cran.r-project.org')
library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal=T)
rootNode <- xmlRoot(doc)
names(rootNode)
names(rootNode[[1]])
names(rootNode[[1]][[1]])
zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)
table(zipcode == 21231)

# Question 5
# install.packages('data.table',repos='http://cran.r-project.org')
library(data.table)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "./Quiz1/data/Fss06pid.csv")
DT <- fread("./Quiz1/data/Fss06pid.csv")
DT[,mean(pwgtp15),by=SEX]
