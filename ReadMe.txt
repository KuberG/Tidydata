This program gives a tidy data set for the observations gathered for the data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

========================================
HOW TO USE THIS PROGRAM
========================================

1. Download the zip file from the above link
2. Unzip it and store it in your working directory
3. Run this program to:
   	a.merges all the test and train data sets including observations, labels, subjects
	b.extracts the measurements related to mean and standard deviation
	c.Make the given variables valid and attach the variable names to the dataset
	d.Tidyup the data and include mean values of the varaibles for each subject and each activity 
	
========================================
HOW THIS PROGRAM OPERATES
========================================

1. Reads all the data sets (measurements, activity and Subject data set) from train and test folders using read.table and rbind into a data frame
2. Reads the variabe names and assigns them to the data frame
3. Filters the mean and standard variation related variable names i.e. all the variable names that have mean or std in them, using union, grep commands
4. Converts all the R incomatible column names to valid ones using make.names() function
5. Finally combines Subject and Activity and their related measurements so that it finally becomes a tidy data set
