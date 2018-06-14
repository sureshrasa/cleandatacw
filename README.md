## Data scince project coursework
Coursework submission

### Data files
There are two data files provided: data.csv and averages.csv

#### data.csv
This contains a merge of the clean and tidy version of the test and train datasets.

#### averages.csv
This contains the averages grouped by the activity and volunteer(subject) for the above data set.

### R Script
The R script (run_analysis.R) will produce the above mentioned data files, when run from the directory containing the coursework datasets; i.e., run the script with the current working directory/folder set to the "UCI HAR Dataset" directory/folder.

The script defines helper methods to tidy and clean the data. The main code is at the end, where the helper methods are invoked to build the required data frames. Each of the helper methods are described below in detail.

  * The script initially invokes the method "loadData" to produce the merged view of the data sets
  * Averages are computed on the merged data set grouped by the subject and activity
  * The data set and the computed data set are written to their respective files in CSV format
  
#### loadData
Loads the training and test data sets for the subject labels, X features and y labels. The columns from these data frames are combined into a single data frame and returned. It calls upon the methods loadAllYLabels, loadAllFeatures and loadAllSubjects to load the respective data frames.

#### loadAllYlabels
Merges the training and test y labels with activity names.
  1. Loads the activity labels from the file "activity_labels.txt" naming the columns "Level" and "Label"
  1. Loads the test y labels from "./test/Y_test.txt" using the method loadYLabels giving it the activity labels
  1. Repeat above step with file "./train/Y_train.txt" to load the training y labels
  1. Use rbind to merge the training and test labels

#### loadYLabels
Loads a single data set of y labels from a given file and replaces the label values with meaningful names
  1. Read the y labels from file, naming the column "Activity"
  1. Replace the "Activity" values using a factor based on the activity labels provided.
  
#### loadAllFeatures
Merges the training and test features and names the columns with meaningful names. Only selects mean and std columns
  1. Load all the feature names from "./features.txt" and name the columns "Index" and "Name"
  1. Clean the feature names to be human and CSV file format friendly
  1. Load the test features from "./test/X_test.txt" using method loadXFeatures providing it the column names above
  1. Repeat above step for file "./train/X_train.txt" to load the training features
  1. Use rbind to merge the training and test features
  
#### loadXFeatures
Loads the features from a given file and names the columns with given column names. Returns columns related to mean ad std calculations
  1. Load the features from file and name it with the column names provided
  1. Select columns relating to mean and std calculations by using column names that contain the word "mean" or "std"
  
#### loadAllSubjects
Merges the subject labels and names the column "Subject"
  1. Load the test subject labels from "./test/subject_test.txt" and name the column "Subject"
  1. Repeat the above for file "./train/subject_train.txt" to load the train subject labels
  1. Use rbind to merge the training and test subject labels

#### loadSubjects
Load the subject labels from a given file, and names the column "Subject"
