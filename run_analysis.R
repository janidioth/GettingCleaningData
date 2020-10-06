run_analysis <- function() {
    
    first_merge <- function(setType) {
        data_dir = "UCI HAR Dataset"
        subject = paste("subject_", setType, ".txt", sep="")
        y_txt = paste("y_", setType, ".txt", sep="")
        x_txt = paste("X_", setType, ".txt", sep="")
        
        subject_df = read.table(paste(getwd(), data_dir, setType, subject, sep="/"))
        y_df = read.table(paste(getwd(), data_dir, setType, y_txt, sep="/"))
        x_df = read.table(paste(getwd(), data_dir, setType, x_txt, sep="/"))
        
        names(subject_df) <- c("Subject.Id")
        names(y_df) <- c("Activity.num")
        
        x_subdf <- select(x_df, c(V1, V2, V3, V4, V5, V6, 
                                  V41, V42, V43, V44, V45, V46, 
                                  V81, V82, V83, V84, V85, V86, 
                                  V121, V122, V123, V124, V125, V126, 
                                  V161, V162, V163, V164, V165, V166, 
                                  V201, V202, V214, V215, V227, V228, 
                                  V240, V241, V253, V254, V266, V267,
                                  V268, V269, V270, V271, V345, V346,
                                  V347, V348, V349, V350, V424, V425,
                                  V426, V427, V428, V429, V503, V504,
                                  V516, V517, V529, V530, V542, V543))
        
        colnames(x_subdf) = c("tBodyAcc.mean.X", "tBodyAcc.mean.Y", 
                              "tBodyAcc.mean.Z", "tBodyAcc.std.X", 
                              "tBodyAcc.std.Y", "tBodyAcc.std.Z",
                              "tGravityAcc.mean.X", "tGravityAcc.mean.Y", 
                              "tGravityAcc.mean.Z", "tGravityAcc.std.X", 
                              "tGravityAcc.std.Y", "tGravityAcc.std.Z", 
                              "tBodyAccJerk.mean.X", "tBodyAccJerk.mean.Y", 
                              "tBodyAccJerk.mean.Z", "tBodyAccJerk.std.X", 
                              "tBodyAccJerk.std.Y", "tBodyAccJerk.std.Z",
                              "tBodyGyro.mean.X", "tBodyGyro.mean.Y", 
                              "tBodyGyro.mean.Z", "tBodyGyro.std.X", 
                              "tBodyGyro.std.Y", "tBodyGyro.std.Z",
                              "tBodyGyroJerk.mean.X", "tBodyGyroJerk.mean.Y", 
                              "tBodyGyroJerk.mean.Z", "tBodyGyroJerk.std.X", 
                              "tBodyGyroJerk.std.Y", "tBodyGyroJerk.std.Z",
                              "tBodyAccMag.mean", "tBodyAccMag.std", 
                              "tGravityAccMag.mean", "tGravityAccMag.std", 
                              "tBodyAccJerkMag.mean", "tBodyAccJerkMag.std", 
                              "tBodyGyroMag.mean", "tBodyGyroMag.std", 
                              "tBodyGyroJerkMag.mean", "tBodyGyroJerkMag.std", 
                              "fBodyAcc.mean.X", "fBodyAcc.mean.Y",
                              "fBodyAcc.mean.Z", "fBodyAcc.std.X", 
                              "fBodyAcc.std.Y", "fBodyAcc.std.Z", 
                              "fBodyAccJerk.mean.X", "fBodyAccJerk.mean.Y",
                              "fBodyAccJerk.mean.Z", "fBodyAccJerk.std.X", 
                              "fBodyAccJerk.std.Y", "fBodyAccJerk.std.Z", 
                              "fBodyGyro.mean.X", "fBodyGyro.mean.Y",
                              "fBodyGyro.mean.Z", "fBodyGyro.std.X", 
                              "fBodyGyro.std.Y", "fBodyGyro.std.Z", 
                              "fBodyAccMag.mean", "fBodyAccMag.std",
                              "fBodyBodyAccJerkMag.mean", "fBodyBodyAccJerkMag.std", 
                              "fBodyBodyGyroMag.mean", "fBodyBodyGyroMag.std", 
                              "fBodyBodyGyroJerkMag.mean", "fBodyBodyGyroJerkMag.std") 

        result_df <- cbind(subject_df, y_df, x_subdf)
        return (result_df)
    }
    
    train_df <- first_merge("train")
    test_df <- first_merge("test")
    
    merged_df <- rbind(train_df, test_df)
    sorted_merged_df <- merged_df[order(merged_df$Subject.Id, merged_df$Activity.num),]
    
    final_df <- sorted_merged_df %>% group_by(Subject.Id, Activity.num) %>% 
        summarise(avg_tBodyAcc.mean.X = mean(tBodyAcc.mean.X), 
                  avg_tBodyAcc.mean.Y = mean(tBodyAcc.mean.Y), 
                  avg_tBodyAcc.mean.Z = mean(tBodyAcc.mean.Z), 
                  avg_tBodyAcc.std.X = mean(tBodyAcc.std.X), 
                  avg_tBodyAcc.std.Y = mean(tBodyAcc.std.Y), 
                  avg_tBodyAcc.std.Z = mean(tBodyAcc.std.Z), 
                  avg_tGravityAcc.mean.X = mean(tGravityAcc.mean.X), 
                  avg_tGravityAcc.mean.Y = mean(tGravityAcc.mean.Y), 
                  avg_tGravityAcc.mean.Z = mean(tGravityAcc.mean.Z), 
                  avg_tGravityAcc.std.X = mean(tGravityAcc.std.X), 
                  avg_tGravityAcc.std.Y = mean(tGravityAcc.std.Y), 
                  avg_tGravityAcc.std.Z = mean(tGravityAcc.std.Z), 
                  avg_tBodyAccJerk.mean.X = mean(tBodyAccJerk.mean.X), 
                  avg_tBodyAccJerk.mean.Y = mean(tBodyAccJerk.mean.Y), 
                  avg_tBodyAccJerk.mean.Z = mean(tBodyAccJerk.mean.Z), 
                  avg_tBodyAccJerk.std.X = mean(tBodyAccJerk.std.X), 
                  avg_tBodyAccJerk.std.Y = mean(tBodyAccJerk.std.Y), 
                  avg_tBodyAccJerk.std.Z = mean(tBodyAccJerk.std.Z), 
                  avg_tBodyGyro.mean.X = mean(tBodyGyro.mean.X), 
                  avg_tBodyGyro.mean.Y = mean(tBodyGyro.mean.Y), 
                  avg_tBodyGyro.mean.Z = mean(tBodyGyro.mean.Z), 
                  avg_tBodyGyro.std.X = mean(tBodyGyro.std.X), 
                  avg_tBodyGyro.std.Y = mean(tBodyGyro.std.Y), 
                  avg_tBodyGyro.std.Z = mean(tBodyGyro.std.Z), 
                  avg_tBodyGyroJerk.mean.X = mean(tBodyGyroJerk.mean.X), 
                  avg_tBodyGyroJerk.mean.Y = mean(tBodyGyroJerk.mean.Y), 
                  avg_tBodyGyroJerk.mean.Z = mean(tBodyGyroJerk.mean.Z), 
                  avg_tBodyGyroJerk.std.X = mean(tBodyGyroJerk.std.X), 
                  avg_tBodyGyroJerk.std.Y = mean(tBodyGyroJerk.std.Y), 
                  avg_tBodyGyroJerk.std.Z = mean(tBodyGyroJerk.std.Z), 
                  avg_tBodyAccMag.mean = mean(tBodyAccMag.mean), 
                  avg_tBodyAccMag.std = mean(tBodyAccMag.std), 
                  avg_tGravityAccMag.mean = mean(tGravityAccMag.mean), 
                  avg_tGravityAccMag.std  = mean(tGravityAccMag.std), 
                  avg_tBodyAccJerkMag.mean = mean(tBodyAccJerkMag.mean), 
                  avg_tBodyAccJerkMag.std = mean(tBodyAccJerkMag.std), 
                  avg_tBodyGyroMag.mean = mean(tBodyGyroMag.mean), 
                  avg_tBodyGyroMag.std = mean(tBodyGyroMag.std), 
                  avg_tBodyGyroJerkMag.mean = mean(tBodyGyroJerkMag.mean), 
                  avg_tBodyGyroJerkMag.std = mean(tBodyGyroJerkMag.std), 
                  avg_fBodyAcc.mean.X = mean(fBodyAcc.mean.X), 
                  avg_fBodyAcc.mean.Y = mean(fBodyAcc.mean.Y), 
                  avg_fBodyAcc.mean.Z = mean(fBodyAcc.mean.Z), 
                  avg_fBodyAcc.std.X = mean(fBodyAcc.std.X), 
                  avg_fBodyAcc.std.Y = mean(fBodyAcc.std.Y), 
                  avg_fBodyAcc.std.Z = mean(fBodyAcc.std.Z), 
                  avg_fBodyAccJerk.mean.X = mean(fBodyAccJerk.mean.X), 
                  avg_fBodyAccJerk.mean.Y = mean(fBodyAccJerk.mean.Y), 
                  avg_fBodyAccJerk.mean.Z = mean(fBodyAccJerk.mean.Z), 
                  avg_fBodyAccJerk.std.X = mean(fBodyAccJerk.std.X), 
                  avg_fBodyAccJerk.std.Y = mean(fBodyAccJerk.std.Y), 
                  avg_fBodyAccJerk.std.Z = mean(fBodyAccJerk.std.Z), 
                  avg_fBodyGyro.mean.X = mean(fBodyGyro.mean.X), 
                  avg_fBodyGyro.mean.Y = mean(fBodyGyro.mean.Y), 
                  avg_fBodyGyro.mean.Z = mean(fBodyGyro.mean.Z), 
                  avg_fBodyGyro.std.X = mean(fBodyGyro.std.X), 
                  avg_fBodyGyro.std.Y = mean(fBodyGyro.std.Y), 
                  avg_fBodyGyro.std.Z = mean(fBodyGyro.std.Z), 
                  avg_fBodyAccMag.mean = mean(fBodyAccMag.mean), 
                  avg_fBodyAccMag.std = mean(fBodyAccMag.std), 
                  avg_fBodyBodyAccJerkMag.mean = mean(fBodyBodyAccJerkMag.mean), 
                  avg_fBodyBodyAccJerkMag.std = mean(fBodyBodyAccJerkMag.std), 
                  avg_fBodyBodyGyroMag.mean = mean(fBodyBodyGyroMag.mean), 
                  avg_fBodyBodyGyroMag.std = mean(fBodyBodyGyroMag.std), 
                  avg_fBodyBodyGyroJerkMag.mean = mean(fBodyBodyGyroJerkMag.mean), 
                  avg_fBodyBodyGyroJerkMag.std = mean(fBodyBodyGyroJerkMag.std))
    
    activity_df = read.table(paste(getwd(), "UCI HAR Dataset", "activity_labels.txt", sep="/"))
    activity_vector <- sapply(final_df$Activity.num, function(x) { activity_df$V2[x] }) 
    
    final_df$Activity <- activity_vector
    final_df <- final_df %>% select(Subject.Id, Activity, everything())
    final_df$Activity.num <- NULL
    
    write.table(final_df, file = "tidy_data_set.txt", row.name=FALSE)
}
