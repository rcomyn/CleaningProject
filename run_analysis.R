# Load the required libraries.
library(dplyr)
library(downloader)

# Download data and unzip.
download("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="project.data.zip")
dateDownloaded <- date()
unzip("project.data.zip")

# Set a pointer to the data directory.
data.dir <- "UCI HAR Dataset"

# TEST FILES
# Load the subjects and set appropriate column name.
file <- "subject_test.txt"
subject_test <- read.table(paste(data.dir, "test", file, sep="/"))
colnames(subject_test) <- "subject"

# Load X.
file <- "X_test.txt"
X_test <- read.table(paste(data.dir, "test", file, sep="/"))

# Load Y and set column name.
file <- "Y_test.txt"
Y_test <- read.table(paste(data.dir, "test", file, sep="/"))
colnames(Y_test) <- "activity_num"

# Bind the X, subject_test, and Y files together.
test <- cbind(X_test, subject_test, Y_test)


# TRAINING FILES
# Load the subjects and set appropriate column name.
file <- "subject_train.txt"
subject_train <- read.table(paste(data.dir, "train", file, sep="/"))
colnames(subject_train) <- "subject"

# Load X.
file <- "X_train.txt"
X_train <- read.table(paste(data.dir, "train", file, sep="/"))

# Load Y and set column name.
file <- "Y_train.txt"
Y_train <- read.table(paste(data.dir, "train", file, sep="/"))
colnames(Y_train) <- "activity_num"

# Bind the X, subject_test, and Y files together.
train <- cbind(X_train, subject_train, Y_train)

# Bind the training and testing tables together.
train_test <- rbind(train, test)

# Load the features labels
file <- "features.txt"
features <- read.table(paste(data.dir, file, sep="/"), 
                       stringsAsFactors=FALSE, check.names=FALSE)

# There are duplicate column names (e.g., rows 303, 317, 331).
# This causes problem with the merge so add a new column
# with features names plus the row index to make them unique.
features[,3] <- paste(features[,2], ",", features[,1], sep="")

# Load the activity labels and set appropriate column names.
file <- "activity_labels.txt"
activity_labels <- read.table(paste(data.dir, file, sep="/"))
colnames(activity_labels) <- c("activity_num", "activity")

# Merge the activity labels and train_test
ds <- merge(train_test, activity_labels, by="activity_num")
colnames(ds) <- c("activity_num", features[,3], "subject", "activity")

# Create local data frame for dplyr.
ds <- tbl_df(ds)

# Extract the subject, activity, and columns that represent means and std,
#   group them by activity and subject
#   and summarize by the mean of each activity and subject group
dsFinal <- ds %>%
    select(subject, activity, contains("-mean()"), contains("-std()")) %>% 
    group_by(activity, subject) %>% 
    summarise_each(funs(mean))

# Replace column names with indexes with original column names
#   because we removed the duplicates in selecting on columns with "mean" and "std"
# This step can be skipped if other data frames were to be created
#   that contained duplicated columns.
colnames(dsFinal) <- sapply(strsplit(colnames(dsFinal),","), "[[", 1)

# Write the table to a text file.
write.table(dsFinal, file="dsFinal.txt")

# Clean up.
rm("X_test", "subject_test", "Y_test")
rm("X_train", "subject_train", "Y_train")
rm("train", "test", "train_test", "activity_labels", "file")

