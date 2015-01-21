# Getting_and_Cleaning_Data
# Quiz 1

# ref: https://github.com/rfoxfa/Getting_and_Cleaning_Data/blob/master/Quiz_1.md

# Question 1

data <- data.frame(read.csv("C:/Users/ezetee/Documents/Coursera - Getting and Cleaning Data - getdata-010/getdata-data-ss06hid.csv"))
sum(!is.na(data$VAL[data$VAL==24]))

# Question 2
# Tidy data has one variable per column.

# Question 3
# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
# download.file(fileUrl, destfile="./data/nga.xlsx", method="curl")
# dateDownloaded <- date()
# library(xlsx)
# colIndex <- 7:15
# rowIndex <- 18:23
# dat <- read.xlsx("./data/nga.xlsx", sheetIndex=1, header=TRUE, colIndex=colIndex, rowIndex=rowIndex)
# sum(dat$Zip*dat$Ext,na.rm=T)
# [1] 36534720

