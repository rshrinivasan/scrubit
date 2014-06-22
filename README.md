Course Project: Coursera - Getting & Cleaning Data
=======

### Project Objectives: ###
* Demonstrate ability to collect, work with, and clean a data set. 
* Prepare a tidy data set than can be used for later analysis

### Project Background: ###
Download the data from the accelerometers from the Galaxy S smartphone. Data is split into the test and training data sets. Each data set contrains three files of interest and two files that are common between the data sets. Details of the files are:

1. file activity_labels.txt contains the description for the activity code
2. file features.txt contains the list of variables measured
3. file X_train.txt and X-test.txt contains the observations for each variable
4. file Y-train.txt and X-test.txt contains the activity code at time of measurement
5. file subject_train.txt and subject_test.txt contains the subject identifier

Once downloaded merge the training and test data sets, extract the measurements on the mean and standard deviation for each observation and create a tidy data set with the average of each variable for each activity and each subject.

### Project Submission: ###
1. Upload a tidy data set to the Coursera Getting and Cleaning Data course website.
2. Submit a link to a Github repository. The repository should have the following files:
   a) Readme.md - details working of the scripts
   b) CodeBook.md - code book describing the variables, data and any transformations
   c) run_analysis.R - cleanup and analysis script.

### run_analysis.R ###
This scripts sets the working directory to the folder *data* where the files were unzipped to, loads the test and training data set, merges them together, extracts the mean and standard deviation measurements for each observation and writes out a tidy set with the average of each variable for each activity and each subject.

*Pre-Requisites before running this script*

1. Download file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the file into a folder named data. After unzipping the folder data will have two sub-folders test and train which hold the test and train data set.

*Running run_analaysis.R*

The following is a high-level overview of the steps in the process:

1. Set the working directory to point to the data folder.
2. Load the file activity_labels.txt into a data frame.
3. Subset the data frame to extract the activity description in column V2.
4. Load the file features.txt into a data frame.
5. Subset the data frame to extract the feature description in column V2.
6. Load the files X_train.txt, X-test.txt, Y-train.txt and X-test.txt.
7. Set the column names on the X files to be equal to the feature names from **step 5**.
8. Set the column name on the Y files to be equal to the literal "Activity".
9. Encode the "Activity" column on the Y files as a factor.
10. Assign each level the Actvity description from **step 3**.
11. Load the files subject_train.txt and subject_test.txt into data frames.
12. Set the column names on the data frames to the literal "subject".
13. Encode the "subject" columns as factors.
14. Create a test_data_set and train_data_set data frames that include the columns Activity and subject in addition to all the features columns.
15. Merge the test and training data sets.
16. Extract the mean and standard deviation measurements for each observation into a data frame.
17. Get the mean of each observation in the data frame from **step 16** grouped by subject and activity.
18. Write out these observations into a file called tidy.txt.
