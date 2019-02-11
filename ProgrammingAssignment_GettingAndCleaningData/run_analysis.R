
# One of the most exciting areas in all of data science right now is wearable computing - see for example this article . 
# Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
# The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
# A full description is available at the site where the data was obtained:

#  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones






## =====================================================
#  Reads the dataset files 
#  The data is loaded from this site:
#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## =====================================================


# reads the features column names
column_names <- read.table("UCI HAR Dataset/features.txt", header=FALSE)
activity_names <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

# reads and merges X train and test files
X_data <- read.table(text = gsub("  ", " ", readLines("UCI HAR Dataset/train/X_train.txt")))
X_data <- rbind(X_data, read.table(text = gsub("  ", " ", readLines("UCI HAR Dataset/test/X_test.txt"))))

# reads and merges the Y train and test files
y_data <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
y_data <- rbind(y_data, read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE))

# reads and merges the subjects train and test files
subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
subjects <- rbind(subjects, read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE))
names(subjects) <- "subject"


## =====================================================
#  extracts only the columns related with the mean and standard deviation values
## =====================================================
final_column_names <- grep("mean|std", column_names[,2])
X_data <- X_data[, final_column_names]


## =====================================================
#  Appropriately labels the data set with descriptive variable names.
## =====================================================
names(X_data) <- column_names[final_column_names,2]


## =====================================================
#  Uses descriptive activity names to name the activities in the data set
## =====================================================
y_data[,2] <- apply(y_data, function(x) { activity_names[x,2]})
names(y_data) <- c("val", "act_name")



# merges the X, y and subjects data
final_data <- cbind(y_data$act_name, subjects, X_data )
names(final_data)[1] <- "act_name"


## =====================================================
#  independent tidy data set with the average of each variable for each activity and each subject
## =====================================================

tidy <- aggregate(x = final_data[,c(-1,-2)], by = list(final_data$act_name, final_data$subject), FUN = mean)



write.table(tidy, 'assigment_data_results.txt', row.names = FALSE) 