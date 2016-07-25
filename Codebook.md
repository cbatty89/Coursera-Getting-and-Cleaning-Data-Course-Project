#Codebook for run_analysis.R


###The first step in the script is to load the library for dplyr.

###Once the library is loaded the text files activity_labels, features, X_test,y_test, subject_test, X_train, y_train, and subject_train are imported.

###The x_train and x_test are combined to create x_data_complete and a similar process is carried out for the y datasets and subject datasets.

###Using grepl we identify which columns we want to keep in the dataset through finding those that include the string mean() and std(). The output from grepl is stored in the object mean_std_col and then used to filter the data required from x_data_complete into the data frame x_filter.

###Once we restrict the columns required several steps are completed to make the column names more readable.

###The values within y_data_complete are replaced by their text equivalents contained within activity_labels, and the column in subject_data_complete is renamed to particpants.

###Once all of these steps are complete we combine the data into the data frame title final_dataset.  Next we group the data by particpant and activity.

###The final steps are to calculate the mean of each column by the grouping above and to then write the created table to a text file title Tidy_Data.txt.

###Below are the variables contained within Tidy_Data.txt:
###These signals were used to estimate variables of the feature vector for each pattern from the original datasets: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

####tBodyAcc-XYZ
####tGravityAcc-XYZ
####tBodyAccJerk-XYZ
####tBodyGyro-XYZ
####tBodyGyroJerk-XYZ
####tBodyAccMag
####tGravityAccMag
####tBodyAccJerkMag
####tBodyGyroMag
####tBodyGyroJerkMag
####fBodyAcc-XYZ
####fBodyAccJerk-XYZ
####fBodyGyro-XYZ
####fBodyAccMag
####fBodyAccJerkMag
####fBodyGyroMag
####fBodyGyroJerkMag

###The set of variables that were estimated from these signals are: 

####mean(): Mean value
####std(): Standard deviation


###The script rewrites t to stand for Time, f to FFT for Fast Fourier Transform.  It also rewrites mean() as Mean and std() as STD. These changes were made to aid in readability.


