---
title: "Codebook"
output:
  html_document:
    keep_md: yes
---
## Project Description
This project uses the "Human Activity Recognition Using Smartphones Data Set" built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.


### Collection of the raw data
The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Notes on the original (raw) data 
The subjects who carried out the experiments were identified using numbers and was saved to the subject_train.txt and subject_test.txt files. The corresponding activities for each subject were saved to the y_train.txt and y_test.txt files respectively. The X_train.txt and X_test.txt files contain records of 561-feature vector with time and frequency domain variables as described in the "features.txt" that can be downloaded from the website:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

## Creating the tidy datafile

### Guide to create the tidy data file
1. Download the data from the provided link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip the data to a location where the R program can access for reading.
3. Merges the training and the test sets to create one data set.
4. Extracts only the measurements on the mean and standard deviation for each measurement.
5. Uses descriptive activity names to name the activities in the data set.
6. Appropriately labels the data set with descriptive variable names.
7. From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Cleaning of the data
The training and test data sets were first individually merged with the subject id, activity and measurements only on the mean and standard deviation from the 3 data files before both sets of data were merged into one data set. The data set was sorted by the subject id and activity before the average of each variable for each activity and each subject were computed for the tidy data set. Please refer to the [README](https://github.com/janidioth/GettingCleaningData/blob/main/README.md) file for more information.

## Description of the variables in the tidy_data_set.txt file
There are 180 observations and 68 variables in the tidy_data_set.txt file. The 180 observations were divided into 6 activities per subject. The 68 variables were the average of the XYZ mean and standard deviation measurements extracted from the time and frequency domain variables.

The domain variables in the file are:  
        
* Subject.Id <int> - identify the subject used in the experiment (1 - 30)  
* Activity <chr> - one of the 6 activities ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")  
*  avg_tBodyAcc.mean.X <dbl> - average of the time body accelerator mean for X  
* avg_tBodyAcc.mean.Y <dbl> - average of the time body accelerator mean for Y  
* avg_tBodyAcc.mean.Z <dbl> - average of the time body accelerator mean for Z  
* avg_tBodyAcc.std.X <dbl> - average of the time body accelerator std for X  
* avg_tBodyAcc.std.Y <dbl> - average of the time body accelerator std for Y  
* avg_tBodyAcc.std.Z <dbl> - average of the time body accelerator std for Z  
* avg_tGravityAcc.mean.X <dbl> - average of the time gravity accelerator mean for X  
* avg_tGravityAcc.mean.Y <dbl> - average of the time gravity accelerator mean for Y  
* avg_tGravityAcc.mean.Z <dbl> - average of the time gravity accelerator mean for Z  
* avg_tGravityAcc.std.X <dbl> - average of the time gravity accelerator std for X  
* avg_tGravityAcc.std.Y <dbl> - average of the time gravity accelerator std for Y  
* avg_tGravityAcc.std.Z <dbl> - average of the time gravity accelerator std for Z  
* avg_tBodyAccJerk.mean.X <dbl> - average of the time body accelerator jerk mean for X  
* avg_tBodyAccJerk.mean.Y <dbl> - average of the time body accelerator jerk mean for Y  
* avg_tBodyAccJerk.mean.Z <dbl> - average of the time body accelerator jerk mean for Z  
* avg_tBodyAccJerk.std.X <dbl> - average of the time body accelerator jerk std for X  
* avg_tBodyAccJerk.std.Y <dbl> - average of the time body accelerator jerk std for Y  
* avg_tBodyAccJerk.std.Z <dbl> - average of the time body accelerator jerk std for Z  
* avg_tBodyGyro.mean.X <dbl> - average of the time body gyro mean for X  
* avg_tBodyGyro.mean.Y <dbl> - average of the time body gyro mean for Y  
* avg_tBodyGyro.mean.Z <dbl> - average of the time body gyro mean for Z  
* avg_tBodyGyro.std.X <dbl> - average of the time body gyro std for X  
* avg_tBodyGyro.std.Y <dbl> - average of the time body gyro std for Y  
* avg_tBodyGyro.std.Z <dbl> - average of the time body gyro std for Z  
* avg_tBodyGyroJerk.mean.X <dbl> - average of the time body gyro jerk mean for X  
* avg_tBodyGyroJerk.mean.Y <dbl> - average of the time body gyro jerk mean for Y  
* avg_tBodyGyroJerk.mean.Z <dbl> - average of the time body gyro jerk mean for Z  
* avg_tBodyGyroJerk.std.X <dbl> - average of the time body gyro jerk std for X  
* avg_tBodyGyroJerk.std.Y <dbl> - average of the time body gyro jerk std for Y  
* avg_tBodyGyroJerk.std.Z <dbl> - average of the time body gyro jerk std for Z  
* avg_tBodyAccMag.mean <dbl> - average of the time body accelerator mag mean  
* avg_tBodyAccMag.std <dbl> - average of the time body accelerator mag std  
* avg_tGravityAccMag.mean <dbl> - average of the time gravity accelerator mag mean  
* avg_tGravityAccMag.std <dbl> - average of the time gravity accelerator mag std  
* avg_tBodyAccJerkMag.mean <dbl> - average of the time body accelerator jerk mag mean  
* avg_tBodyAccJerkMag.std <dbl> - average of the time body accelerator jerk mag std  
* avg_tBodyGyroMag.mean <dbl> - average of the time body gyro mag mean  
* avg_tBodyGyroMag.std <dbl> - average of the time body gyro mag std  
* avg_tBodyGyroJerkMag.mean <dbl> - average of the time body gyro jerk mag mean  
* avg_tBodyGyroJerkMag.std <dbl> - average of the time body gyro jerk mag std  
* avg_fBodyAcc.mean.X <dbl> - average of the frequency body accelerator mean X  
* avg_fBodyAcc.mean.Y <dbl> - average of the frequency body accelerator mean Y  
* avg_fBodyAcc.mean.Z <dbl> - average of the frequency body accelerator mean Z  
* avg_fBodyAcc.std.X <dbl> - average of the frequency body accelerator std X  
* avg_fBodyAcc.std.Y <dbl> - average of the frequency body accelerator std Y  
* avg_fBodyAcc.std.Z <dbl> - average of the frequency body accelerator std Z  
* avg_fBodyAccJerk.mean.X <dbl> - average of the frequency body accelerator jerk mean X  
* avg_fBodyAccJerk.mean.Y <dbl> - average of the frequency body accelerator jerk mean Y  
* avg_fBodyAccJerk.mean.Z <dbl> - average of the frequency body accelerator jerk mean Z  
* avg_fBodyAccJerk.std.X <dbl> - average of the frequency body accelerator jerk std X  
* avg_fBodyAccJerk.std.Y <dbl> - average of the frequency body accelerator jerk std Y  
* avg_fBodyAccJerk.std.Z <dbl> - average of the frequency body accelerator jerk std Z  
* avg_fBodyGyro.mean.X <dbl> - average of the frequency body gyro mean X  
* avg_fBodyGyro.mean.Y <dbl> - average of the frequency body gyro mean Y  
* avg_fBodyGyro.mean.Z <dbl> - average of the frequency body gyro mean Z  
* avg_fBodyGyro.std.X <dbl> - average of the frequency body gyro std X  
* avg_fBodyGyro.std.Y <dbl> - average of the frequency body gyro std Y  
* avg_fBodyGyro.std.Z <dbl> - average of the frequency body gyro std Z  
* avg_fBodyAccMag.mean <dbl> - average of the frequency body accelerator mag mean   
* avg_fBodyAccMag.std <dbl> - average of the frequency body accelerator mag std  
* avg_fBodyBodyAccJerkMag.mean <dbl> - average of the frequency body body accelerator jerk mag mean  
* avg_fBodyBodyAccJerkMag.std <dbl> - average of the frequency body body accelerator jerk mag std  
* avg_fBodyBodyGyroMag.mean <dbl> - average of the frequency body body gyro mag mean  
* avg_fBodyBodyGyroMag.std <dbl> - average of the frequency body body gyro mag std  
* avg_fBodyBodyGyroJerkMag.mean <dbl> - average of the frequency body body gyro jerk mag mean  
* avg_fBodyBodyGyroJerkMag.std <dbl> - average of the frequency body body gyro jerk mag std  

## Sources
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
