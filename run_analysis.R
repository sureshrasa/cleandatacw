#Load a data file containing y labels and name the values
loadYLabels <- function(filename, activity_labels_df)
{
  result <- read.table(filename, header = FALSE, skipNul = TRUE, col.names = c('Activity'))
  
  #Rename activity values with meaningful names
  result$Activity <- factor(result$Activity, levels=activity_labels_df$Level, labels = activity_labels_df$Label) 
  
  return (result)
}

#Load the Y labels
loadAllYLabels <- function()
{
  activity_labels_df <- read.table("activity_labels.txt", header = FALSE, skipNul = TRUE, col.names = c('Level', 'Label'))
  
  testY_df <- loadYLabels("./test/Y_test.txt", activity_labels_df)
  trainY_df <- loadYLabels("./train/Y_train.txt", activity_labels_df)
  
  return (rbind(trainY_df, testY_df))
}

#Load a data file containing features and label the columns with meaningul name
#Only select the columns of interest - mean and std calculations
loadXFeatures <- function(filename, feature_labels_df)
{
  result = read.table(filename, header = FALSE, skipNul = TRUE, col.names = feature_labels_df$Name)
  
  #Select only feautres with mean and std.
  result = select(result, contains('mean', ignore.case = TRUE), contains('std', ignore.case = TRUE))
  
  return (result)
}

#Load the features containing columns with contain mean and std
loadAllFeatures <- function()
{
  feature_labels_df = read.table("./features.txt", header = FALSE,skipNul = TRUE, col.names = c('Index', 'Name'))
  
  #Cleanup the column names
  feature_labels_df$Name <-
    feature_labels_df$Name %>%
    str_replace_all("\\(\\)", "") %>%
    str_replace_all("[()\\-,]", "_") %>%
    str_replace_all("_$", "") %>%
    str_replace_all("__", "_")
    
  testX_df <- loadXFeatures("./test/X_test.txt", feature_labels_df)
  trainX_df <- loadXFeatures("./train/X_train.txt", feature_labels_df)
  
  return (rbind(trainX_df, testX_df))
}

#Load a file containing test subject labels
loadSubjects <- function(filename, feature_labels_df)
{
  result <- read.table(filename, header = FALSE,skipNul = TRUE, col.names = c('Subject'))
  
  return (result)
}

#Load the subject labels
loadAllSubjects <- function()
{
  test_subjects_df <- loadSubjects("./test/subject_test.txt")
  train_subjects_df <- loadSubjects("./train/subject_train.txt")
  
  return (rbind(train_subjects_df, test_subjects_df))
}
                                 
#Load the required libraries
library(dplyr)
library(tidyr)

#Merge the subject labels, Y labels and X features
loadData <- function()
{
  y_df <- loadAllYLabels()
  X_df <- loadAllFeatures()
  subjects_df <- loadAllSubjects()

  return (cbind(subjects_df, X_df, y_df))
}

df <- loadData()

averages_df <-
  df %>%
  group_by(Activity, Subject) %>%
  summarise_all(funs(mean))

write.csv(df, "./data.csv", row.names = FALSE)
write.csv(averages_df, "./averages.csv", row.names = FALSE)