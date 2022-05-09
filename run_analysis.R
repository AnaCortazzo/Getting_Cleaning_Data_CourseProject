# load packages
library(data.table)
library(dplyr)

# download data

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
pathDIR <- getwd()
download.file(fileURL, file.path(pathDIR, "datafiles.zip") , method="libcurl")
unzip("datafiles.zip", exdir = pathDIR)

# load activity labels and features

activity <- fread(file.path(pathDIR, "UCI HAR Dataset/activity_labels.txt"), sep = " ",
                col.names = c("label", "activity"))
features <- fread(file.path(pathDIR, "UCI HAR Dataset/features.txt"), sep = " ",
                  col.names = c("num", "feature"))

# load training sets    

trainSet <- fread(file.path(pathDIR, "UCI HAR Dataset/train/X_train.txt"), sep = " ")
trainLabel <- fread(file.path(pathDIR, "UCI HAR Dataset/train/y_train.txt"), sep = " ", 
                    col.names = "activityLabel")
trainSubject <- fread(file.path(pathDIR, "UCI HAR Dataset/train/subject_train.txt"), sep = " ", 
                      col.names = "subject")

# unique data table with all data of training
trainData <- cbind(trainSubject, trainLabel, trainSet) 

# load test sets

testSet <- fread(file.path(pathDIR, "UCI HAR Dataset/test/X_test.txt"), sep = " ")
testLabel <- fread(file.path(pathDIR, "UCI HAR Dataset/test/y_test.txt"), sep = " ", 
                    col.names = "activityLabel")
testSubject <- fread(file.path(pathDIR, "UCI HAR Dataset/test/subject_test.txt"), sep = " ", 
                      col.names = "subject")

# unique data table with all data of test
testData <- cbind(testSubject, testLabel, testSet) 

# merged training and test data
data <- rbind(trainData, testData, use.names = FALSE)

# Extracts the measurements wanted (mean and std) keep subject and activity
columNames <- c("subject", "activity", features$feature)
measurWanted <- grep("subject|activity|(mean|std)\\(\\)", columNames, value = FALSE)
dataWanted <- data[, measurWanted, with = FALSE]

# Descriptive names an descriptive activity 
namesWanted <- columNames[measurWanted]
dataWanted$activityLabel <- activity$activity[dataWanted$activityLabel]
setnames(dataWanted, colnames(dataWanted), namesWanted)

# tidy data set with the average of each variable for each activity and each subject

tidyData <- dataWanted %>% group_by(activity, subject) %>% summarise_all(funs(mean))
fwrite(tidyData, "tidyDataSet.txt", quote = FALSE)
