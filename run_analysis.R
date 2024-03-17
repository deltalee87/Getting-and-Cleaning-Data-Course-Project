# Load required library
library(dplyr)

# Download the dataset
if(!file.exists("./getdata_projectfiles_UCI HAR Dataset")) {
  url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url1, destfile = "./getdata_projectfiles_UCI HAR Dataset.zip")
}

# Unzip the dataset
unzip(zipfile = "./getdata_projectfiles_UCI HAR Dataset.zip", exdir = "./data")

# Read in the training datasets
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Read in the test datasets
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Read in the feature vector
features <- read.table("./data/UCI HAR Dataset/features.txt")

# Read in the activity labels
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
colnames(activityLabels) <- c("activityID", "activityType")

# Assign variable names
colnames(x_train) <- features[, 2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

colnames(x_test) <- features[, 2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

# Merging data sets
trainingSet <- cbind(y_train, subject_train, x_train)
testingSet <- cbind(y_test, subject_test, x_test)
df <- rbind(trainingSet, testingSet)

# Extracting the mean and sd for each measurement
mean_std <- grepl("activityID|subjectID|mean\\(\\)|std\\(\\)", colnames(df))
MSTable <- df[, mean_std]

# Use descriptive activity names
swActivityNames <- merge(MSTable, activityLabels, by = "activityID", all.x = TRUE)

# Label the data set with descriptive variable names
colnames(swActivityNames) <- gsub("^t", "time", colnames(swActivityNames))
colnames(swActivityNames) <- gsub("^f", "frequency", colnames(swActivityNames))
colnames(swActivityNames) <- gsub("Acc", "Accelerometer", colnames(swActivityNames))
colnames(swActivityNames) <- gsub("Gyro", "Gyroscope", colnames(swActivityNames))
colnames(swActivityNames) <- gsub("Mag", "Magnitude", colnames(swActivityNames))
colnames(swActivityNames) <- gsub("BodyBody", "Body", colnames(swActivityNames))

# Creating a second, independent tidy data set with the avg of each variable for each activity and subject
TS <- swActivityNames %>%
  group_by(subjectID, activityID, activityType) %>%
  summarise_all(mean)

# Writing second tidy data set into a txt file
write.table(TS, "tidy.txt", row.names = FALSE)
