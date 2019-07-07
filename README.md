# Getting and Cleaning Data


This repository has the following main script: run_analysis.R.

The mentioned script intends to answer the exercise of the Getting and Cleaning Data final project.

This is planned to be used in order to process the datasets contained in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The resulting files are called Tidy_dataset.csv and Tidy_dataset.RData.
