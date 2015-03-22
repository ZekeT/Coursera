setwd("C:/Users/Z/Desktop/Coursera/Coursera - Getting and Cleaning Data - getdata-011/Proj1")

library("data.table")
library("reshape2")

# read labels and features
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
exfeatures <- grepl("mean|std", features)

#read test data
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(xtest) <- features

#subset data by extracted features
xtest <- xtest[,exfeatures]
ytest[,2] <- activity_labels[ytest[,1]]

#set names
names(ytest) <- c("ActivityID", "ActivityLabel")
names(subtest) <- "Subject"

#get testdata set
testdat <- cbind(as.data.table(subtest), ytest, xtest)

#read train data
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(xtrain) <- features

#subset data by extracted features
xtrain <- xtrain[,exfeatures]
ytrain[,2] <- activity_labels[ytrain[,1]]

#set names
names(ytrain) <- c("ActivityID", "ActivityLabel")
names(subtrain) <- "Subject"

#get traindata set
traindat <- cbind(as.data.table(subtrain), ytrain, xtrain)

#merge to one dataset
completedata <- rbind(testdat, traindat)

#define labels
labels <- c("Subject", "ActivityID", "ActivityLabel")
#get labels of data
datalabels <- setdiff(colnames(completedata), labels)

#melt to flat table
flat <- melt(completedata, id=labels, measure.vars=datalabels)

tidy = dcast(flat, Subject + ActivityLabel ~ variable, mean)

#write file
write.table(tidy, file = "./tidy_data.txt", row.name=F)
