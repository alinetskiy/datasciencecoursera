# The scrpit performs dataset cleanup and aggregation as required in the 
# project assignment for "Getting and Cleaning Data" Coursera class.
#
# The script assumes that the data is located in the "UCI HAR Dataset" subdirectory.


library(dplyr)

# The function performs all necessary cleanup and aggregation operations on data:
# - merge train and test data
# - select only features with Mean and Standard deviation data
# - clean up feature names
# - merge data with subjct IDs and activity names
# - create a new aggregated data set with the average of each variable for each 
#   activity and each subject

runAnalysis <- function () {
  
  # Load data for testing and trainng
  xtest <- read.table('UCI HAR Dataset/test/X_test.txt')
  activtest <- read.table('UCI HAR Dataset/test/y_test.txt', col.names=c('activityid'))
  subjectstest <- read.table('UCI HAR Dataset/test/subject_test.txt', col.names=c('subject'))
  testSet<-cbind(xtest,activtest, subjectstest )

  xtrain <- read.table('UCI HAR Dataset/train/X_train.txt')
  activtrain <- read.table('UCI HAR Dataset/train/y_train.txt', col.names=c('activityid'))
  subjectstrain <- read.table('UCI HAR Dataset/train/subject_train.txt', col.names=c('subject'))
  trainSet<-cbind(xtrain,activtrain, subjectstrain )
  
  # Combine test and train sets
  t1 <- rbind(testSet, trainSet)
  
  ## Process and clean features
  features <- read.table('UCI HAR Dataset/features.txt', col.names=c('column','feature'))
  features <- features[grep('mean\\(\\)|std\\(\\)',features$feature),] 
  features$feature <- gsub('^f', 'frequency', features$feature)
  features$feature <- gsub('^t', 'time', features$feature)
  features$feature <- gsub('Acc', 'Acceleration', features$feature)
  features$feature <- gsub('Mag', 'Magnitude', features$feature)
  features$feature <- gsub('BodyBody', 'Body', features$feature)
  features$feature <- gsub('std\\(\\)', 'Std', features$feature)
  features$feature <- gsub('mean\\(\\)', 'Mean', features$feature)
  features$feature <- gsub('-', '', features$feature)
  
  # apply new feature names  
  t1<-t1[,c(features$column, ncol(trainSet)-1, ncol(trainSet))]
  names(t1) <- c(features$feature, 'activityid', 'subject')
  
  #merge with activity labels
  labels <- read.table('UCI HAR Dataset/activity_labels.txt', col.names=c('activityid','activity'))
  t1 <-merge(t1, labels)
  
  # create result data set
  subjectActivity <- group_by(t1, activity, subject)
  res <- summarise_each(subjectActivity, funs(mean))
  res$activityid <- NULL
  res 
}