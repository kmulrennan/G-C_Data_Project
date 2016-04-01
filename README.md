# G-C_Data_Project
This is for the course project for Getting and Cleaning Data on Coursera
# set working directory

# wd = working directory

# download data from server

# unzip the files

# set the path to files in the data set

# read in the test and train data
# x files contain all of the feature data - This is known as the x data has 561 variables
# A 561-feature vector with time and frequency domain variables (from README.txt)


# y files contain the activity data - Its activity label (from README.txt)


# subject files contain the subject data - 
# An identifier of the subject who carried out the experiment (from README.txt)


# bind all x data together, y data together and subject data together by rows

# give character names to all variables

# 1.This merges the training and the test sets to create one data set
# bind all x, y and subject data together by columns


# only take the character names from the files which contain mean or stand dev data 


# 2.Extracts only the measurements on the mean and standard deviation for each measurement.

# create a data frame with only the mean & st dev of the test and train data as well 
# as activity and subject data by subsetting ra_data2


# 3.Use descriptive activity names to name the activities in the data set

# read in the activity labels

# for loop which replaces the integer values for activity with character labels 
# found in the activity_labels.txt file


# 4.Appropriately label the data set with descriptive variable names.

# replace all abbreviations with the full text - by leaving a space at the end
# it makes the names much easier to read


# 5.From the data set in step 4, create a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

# aggregate splits the data into subsets (subject + activity) 
# and computes the mean for each variable under the subsets

# order the rows of the data frame by subject and then activity

# create a .txt file of the new tidy data set
