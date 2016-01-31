# *** set working directory ***
setwd("C:/data_science/getting_and_cleaning_data/project/")

# 1. Merge training and test sets to create one data set
xTrainData <- read.table("./train/X_train.txt")
xTestData <- read.table("./test/X_test.txt")
xMergedData <- rbind(xTrainData, xTestData)
sTrainData <- read.table("./train/subject_train.txt")
sTestData <- read.table("./test/subject_test.txt")
sMergedData <- rbind(sTrainData, sTestData)
yTrainData <- read.table("./train/y_train.txt")
yTestData <- read.table("./test/y_test.txt")
yMergedData <- rbind(yTrainData, yTestData)

# 2. Extract only the measurements on the mean and standard deviation for each measurement
featuresData <- read.table("./features.txt")
meanFeaturesData <- grep("-mean\\(\\)|-std\\(\\)", featuresData[, 2])
xMergedData <- xMergedData[, meanFeaturesData]
names(xMergedData) <- meanFeatures[Data, 2]
names(xMergedData) <- gsub("\\(|\\)", "", names(xMergedData))
names(xMergedData) <- tolower(names(xMergedData))

# 3. Use descriptive activity names to name the activities in the data set
activityLabel <- read.table("activity_labels.txt")
activityLabel[, 2] = gsub("_", "", tolower(as.character(activityLabel[, 2])))
yMergedData[,1] = activityLabel[yMergedData[,1], 2]
names(yMergedData) <- "activity"

# 4. Appropriately label the data set with descriptive activity names
names(sMergedData) <- "subject"
descriptiveData <- cbind(sMergedData, yMergedData, xMergedData)
write.table(descriptiveData, "tidyDataSet1.txt")

# 5. Create second independent tidy data set with the average of each variable for each activity and each subject
uniqueSubjects = unique(sMergedData)[,1]
numSubjects = length(unique(sMergedData)[,1])
numActivities = length(activityLabel[,1])
numCols = dim(descriptiveData)[2]
result = descriptiveData[1:(numSubjects*numActivities), ]
row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activityLabel[a, 2]
    tmp <- descriptiveData[descriptiveData$subject==s & descriptiveData$activity==activityLabel[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "tidyDataSet.txt")