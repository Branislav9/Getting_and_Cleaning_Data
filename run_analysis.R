library(dplyr)	

# read train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# read test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# read data description
var_names <- read.table("./UCI HAR Dataset/features.txt")

# read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Q1: Merges the training and the test sets to create one data set.

X_set <- rbind(X_train, X_test)
Y_set <- rbind(Y_train, Y_test)
Sub_set <- rbind(Sub_train, Sub_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

extracted_var <- var_names[grep("mean\\(\\)|std\\(\\)",var_names$V2),]
X_set <- X_set[,extracted_var$V1]

# 3. Uses descriptive activity names to name the activities in the data set

colnames(Y_set) <- "activity"
Y_set$activitylabel <- factor(Y_set$activity, labels = as.character(activity_labels$V2))
activity<-Y_set[,2]

# 4. Appropriately labels the data set with descriptive variable names.

colnames(X_set) <- var_names[extracted_var$V1,2]
colnames(Sub_set) <- "subject"

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.

# creating tidy data set 
tidydata <- cbind(activity, Sub_set, X_set)

# calculating average of each variable for each activity and each subject
tidydata_mean <- tidydata %>% 
        group_by(activity, subject) %>% 
        summarize_each(funs(mean))

# creating file tidydata.txt
write.table(tidydata_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
