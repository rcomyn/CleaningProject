CodeBook.md

Human Activity Recognition Using Smartphones Data Set

Check the README.txt file in the data set for further details about the raw data set. The complete list of variables in the raw data is available in 'features.txt'.

The processing and transformations performed to produce the final data set are as follows:

1. From the "test" subdirectory, column bind the "X_test", "subject_test", "Y_test tables to create a "test" table. Set the "Y_test" column label to "activity_num".
2. From the "train" subdirectory, column bind the "X_train", "subject_test", "Y_train" tables to create a "train" table. Set the "Y_train" column label to "activity_num".
3. Row bind the combined "test" and "train" tables to create a "train_test" table.
4. Load the "activity_labels" and set the column names of "train_test" to the "activity_labels", "activity_num" and "activity".
5. Merge the "train_test" table with the "activity_labels" table on "activity_num" to create table "ds".

At this point we have a table with 10299 row and 564 columns (i.e., the original 561 features plus "activity_num", "activity", and "subject").

6. Extract only "activity", "subject", and the 66 columns that include "-mean()" or "-std()", grouping by "acivity" and "subject" and summarizing each column by its mean in its group.

At this point we have a table with 180 rows (30 subjects x 6 activities) and the 68 columns which is our final data set.

The variables that were selected for the final output of this project are listed below. The 66 features were selected because they contained "-mean()" or "-std()" and we interpreted that to fulfull the requirement of "measurements on the mean and standard deviation for each measurement" as opposed to measurements such as "gravityMean" which we did not interpret as fitting that definition.

Units are not given for the measurements because the units were not provided in the original data set and we have no way of confirming what they actually are.

 [1] "activity"                   
 [2] "subject"                    
 [3] "tBodyAcc-mean()-X"          
 [4] "tBodyAcc-mean()-Y"          
 [5] "tBodyAcc-mean()-Z"          
 [6] "tGravityAcc-mean()-X"       
 [7] "tGravityAcc-mean()-Y"       
 [8] "tGravityAcc-mean()-Z"       
 [9] "tBodyAccJerk-mean()-X"      
[10] "tBodyAccJerk-mean()-Y"      
[11] "tBodyAccJerk-mean()-Z"      
[12] "tBodyGyro-mean()-X"         
[13] "tBodyGyro-mean()-Y"         
[14] "tBodyGyro-mean()-Z"         
[15] "tBodyGyroJerk-mean()-X"     
[16] "tBodyGyroJerk-mean()-Y"     
[17] "tBodyGyroJerk-mean()-Z"     
[18] "tBodyAccMag-mean()"         
[19] "tGravityAccMag-mean()"      
[20] "tBodyAccJerkMag-mean()"     
[21] "tBodyGyroMag-mean()"        
[22] "tBodyGyroJerkMag-mean()"    
[23] "fBodyAcc-mean()-X"          
[24] "fBodyAcc-mean()-Y"          
[25] "fBodyAcc-mean()-Z"          
[26] "fBodyAccJerk-mean()-X"      
[27] "fBodyAccJerk-mean()-Y"      
[28] "fBodyAccJerk-mean()-Z"      
[29] "fBodyGyro-mean()-X"         
[30] "fBodyGyro-mean()-Y"         
[31] "fBodyGyro-mean()-Z"         
[32] "fBodyAccMag-mean()"         
[33] "fBodyBodyAccJerkMag-mean()" 
[34] "fBodyBodyGyroMag-mean()"    
[35] "fBodyBodyGyroJerkMag-mean()"
[36] "tBodyAcc-std()-X"           
[37] "tBodyAcc-std()-Y"           
[38] "tBodyAcc-std()-Z"           
[39] "tGravityAcc-std()-X"        
[40] "tGravityAcc-std()-Y"        
[41] "tGravityAcc-std()-Z"        
[42] "tBodyAccJerk-std()-X"       
[43] "tBodyAccJerk-std()-Y"       
[44] "tBodyAccJerk-std()-Z"       
[45] "tBodyGyro-std()-X"          
[46] "tBodyGyro-std()-Y"          
[47] "tBodyGyro-std()-Z"          
[48] "tBodyGyroJerk-std()-X"      
[49] "tBodyGyroJerk-std()-Y"      
[50] "tBodyGyroJerk-std()-Z"      
[51] "tBodyAccMag-std()"          
[52] "tGravityAccMag-std()"       
[53] "tBodyAccJerkMag-std()"      
[54] "tBodyGyroMag-std()"         
[55] "tBodyGyroJerkMag-std()"     
[56] "fBodyAcc-std()-X"           
[57] "fBodyAcc-std()-Y"           
[58] "fBodyAcc-std()-Z"           
[59] "fBodyAccJerk-std()-X"       
[60] "fBodyAccJerk-std()-Y"       
[61] "fBodyAccJerk-std()-Z"       
[62] "fBodyGyro-std()-X"          
[63] "fBodyGyro-std()-Y"          
[64] "fBodyGyro-std()-Z"          
[65] "fBodyAccMag-std()"          
[66] "fBodyBodyAccJerkMag-std()"  
[67] "fBodyBodyGyroMag-std()"     
[68] "fBodyBodyGyroJerkMag-std()" 

These variable names are the same names as in the raw data so they can be traced back to features_info.txt in the orginal data set.


