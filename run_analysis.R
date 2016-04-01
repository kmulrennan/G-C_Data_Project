# set working directory
setwd("C:/Users/kmulrennan/Desktop/Data Science/Getting and cleaning data/Week 4/")

#wd = working directory
wd <- setwd("C:/Users/kmulrennan/Desktop/Data Science/Getting and cleaning data/Week 4/")

# download data from server
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "ra.zip")

#unzip the files
ra <- unzip("ra.zip", exdir = wd)

#path to files in the data set
ra <- file.path(wd, "UCI HAR Dataset")

#read in the test and train data
#x files contain all of the feature data - This is known as the x data has 561 variables
#A 561-feature vector with time and frequency domain variables (from README.txt)
xtest  <- read.table(file.path(ra, "test" , "X_test.txt" ),header = FALSE)
xtrain  <- read.table(file.path(ra, "train" , "X_train.txt" ),header = FALSE)

#y files contain the activity data - Its activity label (from README.txt)
ytest  <- read.table(file.path(ra, "test" , "Y_test.txt" ),header = FALSE)
ytrain  <- read.table(file.path(ra, "train" , "Y_train.txt" ),header = FALSE)

#subject files contain the subject data - 
#An identifier of the subject who carried out the experiment (from README.txt)
subject_test  <- read.table(file.path(ra, "test" , "subject_test.txt" ),header = FALSE)
subject_train  <- read.table(file.path(ra, "train" , "subject_train.txt" ),header = FALSE)


#bind all x data together, y data together and subject data together by rows
x_test_train <- rbind(xtrain, xtest)
y_test_train <- rbind(ytrain, ytest)
subject_test_train <- rbind(subject_train, subject_test)

#give character names to all variables
names(subject_test_train) <- c("subject")
names(y_test_train) <- c("activity")
xnames <- read.table(file.path(ra, "features.txt"),head=FALSE)
names(x_test_train) <- xnames$V2

#1. This merges the training and the test sets to create one data set

#bind all x, y and subject data together by columns
ra_data1 <- cbind(y_test_train, subject_test_train)
ra_data2 <- cbind(x_test_train, ra_data1)




#only take the character names from the files which contain mean or stand dev data 
new_xnames <- xnames$V2[grep("mean\\(\\)|std\\(\\)", xnames$V2)]
names_to_subset <- c(as.character(new_xnames), "subject", "activity" )

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

#create a data frame with only the mean & st dev of the test and train data as well 
#as activity and subject data by subsetting ra_data2
ra_data <- subset(ra_data2, select = names_to_subset)




#3. Use descriptive activity names to name the activities in the data set

#read in the activity labels
activities <- read.table(file.path(ra, "activity_labels.txt"),header = FALSE)

#for loop which replaces the integer values for activity with character labels 
#found in the activity_labels.txt file
activity.id = 1
for (activity_label in activities$V2) {
        ra_data$activity <- gsub(activity.id, activity_label, ra_data$activity)
        activity.id <- activity.id + 1
}




#4. Appropriately label the data set with descriptive variable names.

#replace all abbreviations with the full text - by leaving a space at the end
#it makes the names much easier to read

names(ra_data) <- gsub("^t", "time ", names(ra_data))
names(ra_data) <- gsub("^f", "frequency ", names(ra_data))
names(ra_data) <- gsub("Acc", "Accelerometer ", names(ra_data))
names(ra_data) <- gsub("Gyro", "Gyroscope ", names(ra_data))
names(ra_data) <- gsub("Mag", "Magnitude ", names(ra_data))
names(ra_data) <- gsub("BodyBody", "Body ", names(ra_data))
names(ra_data) <- gsub("Body", "Body ", names(ra_data))
names(ra_data) <- gsub("Gravity", "Gravity ", names(ra_data))
names(ra_data) <- gsub("Jerk", "Jerk ", names(ra_data))


#5. From the data set in step 4, create a second, independent tidy data set with 
#the average of each variable for each activity and each subject.

#aggregate splits the data into subsets (subject + activity) 
#and computes the mean for each variable under the subsets
new_ra_data <- aggregate(. ~subject + activity, ra_data, mean)
#this orders the rows of the data frame by subject and then activity
new_ra_data <- new_ra_data[order(new_ra_data$subject,new_ra_data$activity),]


write.table(new_ra_data, file = "tidydata.txt",row.name=FALSE)
