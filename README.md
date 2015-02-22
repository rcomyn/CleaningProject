README.md

This project takes a raw data set from the UCI Machine Learning Repository and transforms it into a tidy data. To create the tidy data set as a text file, run run_analysis.R. It will download the data and create the text file in your working directory.

This file describes how the run_analysis.R script in this repo transforms the raw data set according to the following requirements:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Here are the steps performed in run_analysis.R and what requirements each group of steps achieves:

1. Merges the training and the test sets to create one data set.
# Load the required libraries.
# Download data and unzip.
# Set a pointer to the data directory.
# TEST FILES
# Load the subjects and set appropriate column name.
# Load X.
# Load Y and set column name.
# Bind the X and Y files together.
# TRAINING FILES
# Load the subjects and set appropriate column name.
# Load X.
# Load Y and set column name.
# Bind the X and Y files together.
# Bind the training and testing tables together.

3. Uses descriptive activity names to name the activities in the data set
# Load the features labels
# There are duplicate column names (e.g., rows 303, 317, 331) as can be seen with:
sum(duplicated(features[,2]))
# 84 features are duplicated.
# This causes problem with the merge so add a new column
# with features names plus the row index to make them unique.

4. Appropriately labels the data set with descriptive variable names. 
# Load the activity labels and set appropriate column names.
# Merge the activity labels and train_test

2. Extracts only the measurements on the mean and standard deviation for each measurement.

We interpreted that to mean features that contained "-mean()" or "-std()" because these seemed to be "measurements on the mean and standard deviation for each measurement" as opposed to measurements such as "gravityMean" which we did not interpret as fitting that definition.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Create local data frame for dplyr.
# Extract the subject, activity, and columns that represent means and std,
#   group them by activity and subject
#   and summarize by the mean of each activity and subject group

3. Uses descriptive activity names to name the activities in the data set
# Replace column names with indexes with original column names
#   because we removed the duplicates in selecting on columns with "mean" and "std"
# This step can be skipped if other data frames were to be created
#   that contained duplicated columns.

The data set provided is tidy because:
1. Each variable is in one column.
2. Each different observation of that variable hold be in a different row.
3. There is only one table for each "kind" of variable.

# Write the table to a text file.
# Clean up.


The following analyses were performed while writing the script to better understand the data set.

# TEST FILES
head(X_test)
str(X_test)
dim(X_test) 
# 2947 x 561
head(Y_test)
str(Y_test)
dim(Y_test) 
# 2947 x 1

# TRAINING FILES
head(X_train)
str(X_train)
dim(X_train) 
# 7352 x 561
head(Y_train)
str(Y_train)
dim(Y_train) 
# 7352 x 1

dim(features)
# 561 x 3

dim(activity_labels)
# 6 x 2

dim(train_test)
# 10299 x 563
# This is correct. 
# 2947 + 7352 = 10299.
# 561 columns + activity_num + subject = 563 columns

dim(ds)
# 10299 x 564
# column for activity label added

dim(dsFinal)
# 180 x 68
# activity, subject, 66 features

# Are there any missing values?
sum(!complete.cases(ds))
# 0 -- No.

# Read final table back into memory for verification.
data <- read.table("dsFinal.txt", header = TRUE) 
View(data)


Citation:

This information was gathered from:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.








