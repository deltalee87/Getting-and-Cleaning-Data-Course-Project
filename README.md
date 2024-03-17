# Getting-and-Cleaning-Data-Course-Project

This is a respository of scripts used for this project.It will cover how they work and how they are connected.

## Project Summary 
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project.

You will be required to submit a link to GitHub with the following information in the repository:

- A **tidy data set** as described below,
- A **code book** that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
- You should also include a **README.md** in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.


## Files in Resposity
1. **`run_analysis.R`** ; This R script executes the following steps:
 
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
2. **`CodeBook.md`** ; This describes the variables, the metrics and reasons for their choices and the data used in the first file.

3. **`tidy_data.txt`**: This is the final tidy data set with the average for each variable wihtin each activity. 


## Raw Data Source
* The data originates from the Human Activity Recognition Using Smartphone Data Set.
* This is a link to the [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
* More information can be found here:[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)