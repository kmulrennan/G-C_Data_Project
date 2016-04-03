set working directory

Download the data from server

Unzip the files

Set the path to files in the data set

Read in the test and train data
The x files contain all of the feature data - This is known as the x data has 561 variables and the feature vector is described as a 561-feature vector with time and frequency domain variables from the README.txt file.

The subject files contain the subject data as identified by reading the README.txt file.

The y files contain the activity data


Use rbind to bind all x data together by rows
Use rbind to bind all y data together by rows
Use rbind to bind all subject data together by rows

Then give character names to all variables

1.This merges the training and the test sets to create one data set
Bind all x, y and subject data together by columns


Take the character names from the files which contain mean or stand dev data 


2.Extracts only the measurements on the mean and standard deviation for each measurement.

Create a data frame with only the mean & st dev of the test and train data as well as activity and subject data by subsetting ra_data2

3.Use descriptive activity names to name the activities in the data set

Read in the activity labels

Create a for loop which replaces the integer values for activity with character labels found in the activity_labels.txt file


4.Appropriately label the data set with descriptive variable names.

Replace all abbreviations with the full text - by leaving a space at the end
This makes the names much easier to read

5.From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

Use aggregate to split the data into subsets (subject + activity) and compute the mean for each variable under the subsets
Order the rows of the data frame by subject and then activity

Write the new clean data set to a .txt file. 


