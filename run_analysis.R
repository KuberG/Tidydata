#-----------------------------------
#This program assumes that the zip file (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
#has been downloaded and unzipped 
#-----------------------------------

#-----------------------------------
#Task1: merge test and train datasets
#-----------------------------------

# measurement data
train<-read.table("./UCI HAR Dataset/train/X_train.txt" ) #read train data
test<-read.table("./UCI HAR Dataset/test/X_test.txt" )    #read test data
alldata<-rbind(train,test)              #merge the two data sets

#Activity data
act_train<-read.table("./UCI HAR Dataset/train/y_train.txt" ) #read train Activity Numbers
act_test<-read.table("./UCI HAR Dataset/test/y_test.txt" )    #read test Activity Numbers
act_alldata<-rbind(act_train,act_test)      #collect all the Activity Numbers

#subject data
sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt") #Read the subject data for training
sub_test<-read.table("./UCI HAR Dataset/test/subject_test.txt") #Read the subject data for test
sub_alldata<-rbind(sub_train,sub_test)

#-----------------------------------
#Task2: Extracts only the measurements on the mean and standard deviation for each measurement
#-----------------------------------
features<-read.table("./UCI HAR Dataset/features.txt" ) #Read the variable names

colnames(alldata)<-features[,2]       #Assign variable names the merged data
cols_mean<-as.character(features[grep("mean", features[,"V2"]),"V2"]) #find the mean variable names
cols_std<-as.character(features[grep("std", features[,"V2"]),"V2"]) #find the std variable names
cols<-union(cols_mean,cols_std)        #find the union of all mean and std variable names

mean_std_data<-alldata[,cols]         #extract only the masurements on mean and std variables

#-----------------------------------
#Task3: Uses descriptive activity names to name the activities in the data set
#-----------------------------------

act_labels<-read.table("./UCI HAR Dataset/activity_labels.txt") #Read the Actvity names
act_alldata$Activity<-as.character(act_labels$V2[match(act_alldata$V1, act_labels$V1)]) #Convert the Activity Numbers to Descriptive Activity Names

mean_std_data$Activity<-act_alldata$Activity # Now attache the descriptive activity names to the data set 

#-----------------------------------
#Task4: Makes the variable names valid
#-----------------------------------

colnames(mean_std_data)<-make.names(colnames(mean_std_data), unique=TRUE)

#-----------------------------------
#Task5: creates a second, independent tidy data set with the average of each variable for each activity and each subject
#-----------------------------------

data_mean<-mean_std_data[,c(make.names(cols_mean),"Activity")]  #extract only mean data

data_mean$Subject<-sub_alldata[,"V1"]               #add subject variable

