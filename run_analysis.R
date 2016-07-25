

#Load Packages
library(dplyr)


########################
#Read in Necessary Data
########################

#Labels and Features
activity_labels<-read.table("activity_labels.txt")

features<-read.table("features.txt")


#Test Data

x_test<-read.table("./test/X_test.txt")

y_test<-read.table("./test/y_test.txt")

subject_test<-read.table("./test/subject_test.txt")


#Train Data

x_train<-read.table("./train/X_train.txt")

y_train<-read.table("./train/y_train.txt")

subject_train<-read.table("./train/subject_train.txt")


###########################
#Combine X Data and Y Data 
# and Subject Data
############################


#Note: Each Type needs to be combined in the same order so that merging will be accurate
#i.e. if train is first in x_data it must be first in y, and subject
x_data_complete<-rbind(x_train,x_test)

y_data_complete<-rbind(y_train,y_test)

subject_data_complete<-rbind(subject_train,subject_test)


#########################
#Remove Unnecessary 
#Columns in X Data and 
#Rename Remaining columns
#########################

#Identify Required Fields that include Mean or STD in their name

mean_std_col<-grepl("mean\\(\\)|std\\(\\)",features[,2])


x_filter<-x_data_complete[,mean_std_col]

#Rename Columns
names(x_filter)=features[mean_std_col,2]



names(x_filter)=sub("^t","Time",names(x_filter))
names(x_filter)=sub("^f","FFT",names(x_filter))
names(x_filter)=sub("mean\\(\\)","Mean",names(x_filter))
names(x_filter)=sub("std\\(\\)","STD",names(x_filter))


#################################
#Convert Y Data to Activity Name 
#Rather than Numeric Value

#Rename Subject Data
#################################

y_data_complete[,1]<-activity_labels[y_data_complete[, 1], 2]

names(y_data_complete)<-'Activity'


names(subject_data_complete)<-'Participant'
############################
#Combine All Data
############################

final_dataset<-cbind(subject_data_complete,y_data_complete,x_filter)


###########################
#Create Tidy Dataset
###########################

grp<-group_by(final_dataset,Participant,Activity)

Tidy_Data<-summarize_each(grp,funs(mean, "mean", mean(.)),3:ncol(final_dataset))

write.table(Tidy_Data,file="Tidy_Data.txt")
