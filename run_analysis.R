# This script does the following:
# 1. Merges the training and the test sets to create one data set
# 2. 

# Download file from site
# This is the directory that gets created when file is unzipped
#  setwd(~/Desktop/Coursera/Downloads/data)
UCI_dir <- "data"

# file activity_labels.txt contains the description for the activity code
# file features.txt contains the list of variables measured
# file X_train.txt contains the observations for each variable
# file Y-train.txt contains the activity code at time of measurement
# file subject_train.txt contains the subject identifier

# get and store the activity label description
act_label <- read.table("activity_labels.txt", sep = "")
act_desc <- act_label$V2
# get and store the features
features <- read.table("features.txt", sep = "")
feature_names <- features$V2

# Load the X & Y files
train_X <- read.table("train/X_train.txt", sep = "")
train_y <- read.table("train/y_train.txt", sep = "")
# set column names equal to feature names
names(train_X) <- feature_names
names(train_y) <- "Activity"
train_y$Activity <- as.factor(train_y$Activity)
# each level corresponds to a particular activity description
levels(train_y$Activity) <- act_desc
# load subject file
subject_train <- read.table("train/subject_train.txt", sep = "")
names(subject_train) <- "subject"
subject_train$subject <- as.factor(subject_train$subject)
# create a combined training set combining observations, subjects and activity
train_set <- cbind(train_X, subject_train, train_y)

# Repeat same steps for the testing set
test_X <- read.table("test/X_test.txt", sep = "")
test_y <- read.table("test/y_test.txt", sep = "")
# set column names equal to feature names
names(test_X) <- feature_names
names(test_y) <- "Activity"
test_y$Activity <- as.factor(test_y$Activity)
# each level corresponds to a particular activity description
levels(test_y$Activity) <- act_desc
# load subject file
subject_test <- read.table("test/subject_test.txt", sep = "")
names(subject_test) <- "subject"
subject_test$subject <- as.factor(subject_test$subject)
test_set <- cbind(test_X, subject_test, test_y)

# merge the test and training sets
merge_set <- rbind(train_set, test_set)

# extract measurements only for the mean and standard deviation
# names(merge_set[grep("mean\\(\\)|std\\(\\)", names(merge_set))]) = 66
# There are 66 columns related to the mean and std. deviation and 2 columns
# for subject and Activity
keep_cols <- names(merge_set[grep("mean\\(\\)|std\\(\\)|subject|Activity", names(merge_set))])
mean_std_set <- merge_set[ , keep_cols]


