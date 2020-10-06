---
title: "README"
output:
  html_document:
    keep_md: yes
---
## Getting and Cleaning Data Course Project
This project gets the data from the "Human Activity Recognition Using Smartphones Data Set" at UCI Machine Learning repository at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones to prepare tidy data that can be used for later analysis. 

The raw data were collected from experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, data for 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Original Raw data
The original raw data from the "UCI HAR Dataset" contains the following files:

* activity_labels.txt - This file contains the 6 activities used in the experiment with 2 variables
    + numeric value representation of the activity
    + corresponding descriptive character value representation of the activity
* features_info.txt - This file provides information on how the features were selected for the experiment
* feature.txt - This file specifies the 561-feature vector with time and frequency domain variables that were used as the measurements for the experiments

The training data sets which contain 70% of the volunteers' experiments are stored in the "train" directory of the "UCI HAR Dataset". The test data sets containing the remaining 30% of the volunteers' experiments are stored in the "test" directory. Each of the "train" and "test" directories has 3 files and a "Inertia Signals" directory.

The files are:

* subject_train.txt - This file contains 7352 observations and 1 variable. The variable define the subject Id (a number assigned to the volunteers)
* y_train.txt - This file contains 7352 observations with 1 variable. The variable define the activity number that can be mapped to the descriptive name in the activity_labels.txt file. 
* X_train.txt - This file contains contains 7352 observations and 561 variables (the variables as defined in the features.txt file). 
* subject_test.txt - his file contains 2947 observations and 1 variable. The variable define the subject Id (a number assigned to the volunteers)
* y_test.txt - This file also contains 2947 observations with 1 variable. The variable define the activity number that can be mapped to the descriptive name in the activity_labels.txt file. 
* X_test.txt - This file contains contains 2947 observations and 561 variables (the variables as defined in the features.txt file).

## Cleaning the data
As can be seen from the data in each of the 3 files for the training and testing data sets, the first step to cleaning the data is to merge the subject, y and X data for each of the train and test data sets to one individual train and test data set.

Since the project only requires the mean and standard deviation measurements from the X data sets, only the variables with these measurements were used in the tidy data set.

A R script called run_analysis.R is created to merge data in separate files for the specific extracted measurements from the raw data set.

**Steps to create the tidy_data_set.txt file**

1. Download the raw data files to a location where run_analysis.R can access.
2. A function called first_merge that takes a string to specify if the data is to be taken from the training ("train directory) or testing ("test" directory) is created in the run_analysis.R file to:
    a. read the data from each of the 3 files into dataframes
    b. The column name for the data extracted from the subject_*.txt was renamed as "Subject.Id"
    c. The column name for the data extracted from the y_*.txt was renamed as "Activity.num"
    d. Only the mean and standard deviation measurements were extracted from the X_*.txt file and its column names renamed to its corresponding name in the "features.txt" file
    e. The merged data from the 3 files, using cbind is returned from the function
3. The "train" and "test" data generated with the first_merge function are then merged row-wise using rbind to one data set.
4. The merged data are then sorted first by "Subject.Id" and then the "Activity.num" 
5. The sorted data set is then further tidied by grouping the "Subject.Id" and "Activity.num" to summarize the mean (average) of each variable for each activity and each subject to produce a final data set with 180 observations and 68 variables. The 68 variables is defined in the "Variables in the tidy_data_set.txt file" section below.
6. An activity vector with the descriptive name is then generated using the data from the "activity_labels.txt" file and the column 'Activity.num' from the final data set.
7. This activity vector is used to replace the 'Activity.num' column with a column name of 'Activity'. That is, the 'Activity' column is added and the 'Activity.num' column is removed from the final data set.
8. Finally, the final data is written out to the "tidy_data_set.txt" file using write.table with row.name=FALSE.

**Variables in the tidy_data_set.txt file**  

1. Subject.Id      
2. Activity     
3. avg_tBodyAcc.mean.X  
4. avg_tBodyAcc.mean.Y      
5. avg_tBodyAcc.mean.Z      
6. avg_tBodyAcc.std.X  
7. avg_tBodyAcc.std.Y
8. avg_tBodyAcc.std.Z
9. avg_tGravityAcc.mean.X
10. avg_tGravityAcc.mean.Y
11. avg_tGravityAcc.mean.Z
12. avg_tGravityAcc.std.X
13. avg_tGravityAcc.std.Y
14. avg_tGravityAcc.std.Z
15. avg_tBodyAccJerk.mean.X
16. avg_tBodyAccJerk.mean.Y
17. avg_tBodyAccJerk.mean.Z
18. avg_tBodyAccJerk.std.X
19. avg_tBodyAccJerk.std.Y
20. avg_tBodyAccJerk.std.Z
21. avg_tBodyGyro.mean.X
22. avg_tBodyGyro.mean.Y
23. avg_tBodyGyro.mean.Z
24. avg_tBodyGyro.std.X
25. avg_tBodyGyro.std.Y
26. avg_tBodyGyro.std.Z
27. avg_tBodyGyroJerk.mean.X
28. avg_tBodyGyroJerk.mean.Y
29. avg_tBodyGyroJerk.mean.Z
30. avg_tBodyGyroJerk.std.X
31. avg_tBodyGyroJerk.std.Y
32. avg_tBodyGyroJerk.std.Z
33. avg_tBodyAccMag.mean
34. avg_tBodyAccMag.std
35. avg_tGravityAccMag.mean
36. avg_tGravityAccMag.std
37. avg_tBodyAccJerkMag.mean
38. avg_tBodyAccJerkMag.std
39. avg_tBodyGyroMag.mean
40. avg_tBodyGyroMag.std
41. avg_tBodyGyroJerkMag.mean
42. avg_tBodyGyroJerkMag.std
43. avg_fBodyAcc.mean.X
44. avg_fBodyAcc.mean.Y
45. avg_fBodyAcc.mean.Z
46. avg_fBodyAcc.std.X
47. avg_fBodyAcc.std.Y
48. avg_fBodyAcc.std.Z
49. avg_fBodyAccJerk.mean.X
50. avg_fBodyAccJerk.mean.Y
51. avg_fBodyAccJerk.mean.Z
52. avg_fBodyAccJerk.std.X
53. avg_fBodyAccJerk.std.Y
54. avg_fBodyAccJerk.std.Z
55. avg_fBodyGyro.mean.X
56. avg_fBodyGyro.mean.Y
57. avg_fBodyGyro.mean.Z
58. avg_fBodyGyro.std.X
59. avg_fBodyGyro.std.Y
60. avg_fBodyGyro.std.Z
61. avg_fBodyAccMag.mean
62. avg_fBodyAccMag.std
63. avg_fBodyBodyAccJerkMag.mean
64. avg_fBodyBodyAccJerkMag.std
65. avg_fBodyBodyGyroMag.mean
66. avg_fBodyBodyGyroMag.std
67. avg_fBodyBodyGyroJerkMag.mean
68. avg_fBodyBodyGyroJerkMag.std

## Sources
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
