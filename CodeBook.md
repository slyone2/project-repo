#Code Book for the Getting and Cleaning Data Course Project

 This is the Code Book for the Getting and Cleaning Data Course Project. A full description of the data used can be optained from the following web site:
	
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project can be obtained from the following web site:

	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The run_analysis.R script cleans and tidies the data by performing the following tasks: 
1.	Inputs training, test, and subject data from six text files into data frames. Next it merges the six training and test data sets (xTrainData, xTestData, xMergedData, sTrainData, sTestData, yTrainData, yTestData) to create three separate data sets (xMergedData, sMergedData, and yMergedData). 
2.	Reads features text file and extracts only the measurements on the mean and standard deviation for each measurement. The result is a 10299x66 data frame, because only 66 out of 561 attributes are measurements on the mean and standard deviation. All measurements appear to be floating point numbers in the range (-1, 1).
3.	Reads activity_labels text file and applies descriptive activity variable names to the data set. The following are examples of the names:

•	walking

•	walkingupstairs

•	walkingdownstairs

•	sitting

•	standing

•	laying

4.	Next the script appropriately labels the data set with descriptive names: all feature names (attributes) and activity names are converted to lower case using the tolower command. Underscores and brackets are removed using grep and gsub commands.  Then it merges the 10299x66 data frame containing features with 10299x1 data frames containing activity labels and subject IDs. The result is saved as dataset_step4.txt, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. Subject IDs are integers between 1 and 30 inclusive. The names of the attributes are: 

[1] "tbodyacc-mean-x"           "tbodyacc-mean-y"           "tbodyacc-mean-z"          
 [4] "tbodyacc-std-x"            "tbodyacc-std-y"            "tbodyacc-std-z"           
 [7] "tgravityacc-mean-x"        "tgravityacc-mean-y"        "tgravityacc-mean-z"       
[10] "tgravityacc-std-x"         "tgravityacc-std-y"         "tgravityacc-std-z"        
[13] "tbodyaccjerk-mean-x"       "tbodyaccjerk-mean-y"       "tbodyaccjerk-mean-z"      
[16] "tbodyaccjerk-std-x"        "tbodyaccjerk-std-y"        "tbodyaccjerk-std-z"       
[19] "tbodygyro-mean-x"          "tbodygyro-mean-y"          "tbodygyro-mean-z"         
[22] "tbodygyro-std-x"           "tbodygyro-std-y"           "tbodygyro-std-z"          
[25] "tbodygyrojerk-mean-x"      "tbodygyrojerk-mean-y"      "tbodygyrojerk-mean-z"     
[28] "tbodygyrojerk-std-x"       "tbodygyrojerk-std-y"       "tbodygyrojerk-std-z"      
[31] "tbodyaccmag-mean"          "tbodyaccmag-std"           "tgravityaccmag-mean"      
[34] "tgravityaccmag-std"        "tbodyaccjerkmag-mean"      "tbodyaccjerkmag-std"      
[37] "tbodygyromag-mean"         "tbodygyromag-std"          "tbodygyrojerkmag-mean"    
[40] "tbodygyrojerkmag-std"      "fbodyacc-mean-x"           "fbodyacc-mean-y"          
[43] "fbodyacc-mean-z"           "fbodyacc-std-x"            "fbodyacc-std-y"           
[46] "fbodyacc-std-z"            "fbodyaccjerk-mean-x"       "fbodyaccjerk-mean-y"      
[49] "fbodyaccjerk-mean-z"       "fbodyaccjerk-std-x"        "fbodyaccjerk-std-y"       
[52] "fbodyaccjerk-std-z"        "fbodygyro-mean-x"          "fbodygyro-mean-y"         
[55] "fbodygyro-mean-z"          "fbodygyro-std-x"           "fbodygyro-std-y"          
[58] "fbodygyro-std-z"           "fbodyaccmag-mean"          "fbodyaccmag-std"          
[61] "fbodybodyaccjerkmag-mean"  "fbodybodyaccjerkmag-std"   "fbodybodygyromag-mean"    
[64] "fbodybodygyromag-std"      "fbodybodygyrojerkmag-mean" "fbodybodygyrojerkmag-std" 

5.	Finally, the script creates a second tidy data set with the average of each measurement for each activity and each subject. The result is saved as dataset_step5.txt, a 180x68 data frame, where as before, the first column contains subject IDs, the second column contains activity names (see below), and then the averages for each of the 66 attributes are in columns 3...68. There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.

[1] "subject"                   "activity"                  "tbodyacc-mean-x"          
 [4] "tbodyacc-mean-y"           "tbodyacc-mean-z"           "tbodyacc-std-x"           
 [7] "tbodyacc-std-y"            "tbodyacc-std-z"            "tgravityacc-mean-x"       
[10] "tgravityacc-mean-y"        "tgravityacc-mean-z"        "tgravityacc-std-x"        
[13] "tgravityacc-std-y"         "tgravityacc-std-z"         "tbodyaccjerk-mean-x"      
[16] "tbodyaccjerk-mean-y"       "tbodyaccjerk-mean-z"       "tbodyaccjerk-std-x"       
[19] "tbodyaccjerk-std-y"        "tbodyaccjerk-std-z"        "tbodygyro-mean-x"         
[22] "tbodygyro-mean-y"          "tbodygyro-mean-z"          "tbodygyro-std-x"          
[25] "tbodygyro-std-y"           "tbodygyro-std-z"           "tbodygyrojerk-mean-x"     
[28] "tbodygyrojerk-mean-y"      "tbodygyrojerk-mean-z"      "tbodygyrojerk-std-x"      
[31] "tbodygyrojerk-std-y"       "tbodygyrojerk-std-z"       "tbodyaccmag-mean"         
[34] "tbodyaccmag-std"           "tgravityaccmag-mean"       "tgravityaccmag-std"       
[37] "tbodyaccjerkmag-mean"      "tbodyaccjerkmag-std"       "tbodygyromag-mean"        
[40] "tbodygyromag-std"          "tbodygyrojerkmag-mean"     "tbodygyrojerkmag-std"     
[43] "fbodyacc-mean-x"           "fbodyacc-mean-y"           "fbodyacc-mean-z"          
[46] "fbodyacc-std-x"            "fbodyacc-std-y"            "fbodyacc-std-z"           
[49] "fbodyaccjerk-mean-x"       "fbodyaccjerk-mean-y"       "fbodyaccjerk-mean-z"      
[52] "fbodyaccjerk-std-x"        "fbodyaccjerk-std-y"        "fbodyaccjerk-std-z"       
[55] "fbodygyro-mean-x"          "fbodygyro-mean-y"          "fbodygyro-mean-z"         
[58] "fbodygyro-std-x"           "fbodygyro-std-y"           "fbodygyro-std-z"          
[61] "fbodyaccmag-mean"          "fbodyaccmag-std"           "fbodybodyaccjerkmag-mean" 
[64] "fbodybodyaccjerkmag-std"   "fbodybodygyromag-mean"     "fbodybodygyromag-std"     
[67] "fbodybodygyrojerkmag-mean" "fbodybodygyrojerkmag-std" 

The following is a listing of the run_analysis.R code:

 *** set working directory ***
setwd("C:/data_science/getting_and_cleaning_data/project/UCI HAR Dataset")

 1. Merge training and test sets  
xTrainData <- read.table("./train/X_train.txt")
xTestData <- read.table("./test/X_test.txt")
xMergedData <- rbind(xTrainData, xTestData)
sTrainData <- read.table("./train/subject_train.txt")
sTestData <- read.table("./test/subject_test.txt")
sMergedData <- rbind(sTrainData, sTestData)
yTrainData <- read.table("./train/y_train.txt")
yTestData <- read.table("./test/y_test.txt")
yMergedData <- rbind(yTrainData, yTestData)

 2. Extract only the measurements on the mean and standard deviation for each measurement
featuresData <- read.table("./features.txt")
meanFeaturesData <- grep("-mean\\(\\)|-std\\(\\)", featuresData[, 2])
xMergedData <- xMergedData[, meanFeaturesData]
names(xMergedData) <- featuresData[meanFeaturesData, 2]
names(xMergedData) <- gsub("\\(|\\)", "", names(xMergedData))
names(xMergedData) <- tolower(names(xMergedData))

 3. Use descriptive activity names to name the activities in the data set
activityLabel <- read.table("activity_labels.txt")
activityLabel[, 2] = gsub("_", "", tolower(as.character(activityLabel[, 2])))
yMergedData[,1] = activityLabel[yMergedData[,1], 2]
names(yMergedData) <- "activity"

 4. Appropriately label the data set with descriptive activity names
names(sMergedData) <- "subject"
descriptiveData <- cbind(sMergedData, yMergedData, xMergedData)
write.table(descriptiveData, "dataset_step4.txt")

 5. Create second independent tidy data set with the average of each variable for each activity and each subject
uniqueSubjects = unique(sMergedData)[,1]
numSubjects = length(unique(sMergedData)[,1])
numActivities = length(activityLabel[,1])
numColumns = dim(descriptiveData)[2]
output = descriptiveData[1:(numSubjects*numActivities), ]
row = 1
for (i in 1:numSubjects) {
  for (j in 1:numActivities) {
    output[row, 1] = uniqueSubjects[i]
    output[row, 2] = activityLabel[j, 2]
    tempStore <- descriptiveData[descriptiveData$subject==i & descriptiveData$activity==activityLabel[j, 2], ]
    output[row, 3:numColumns] <- colMeans(tempStore[, 3:numColumns])
    row = row + 1
  }
}

write.table(output, "dataset_step5.txt")
