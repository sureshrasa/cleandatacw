## Data Science Course Codebook
Please refer to [this](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) to obtaib further details of the features and the original source of the data.

The orignal data has been processed and cleaned in the following manner:
  1. All integer activity labels have been replaced with their corresponding name equivalent
  2. All column names have been obtained by replacing all special and CSV non friendly characters in the feature names (e.g., "tBodyAcc-mean()-X" has been renamed as "tBodyAcc_mean_X")
  3. The data from the original test and training have been merged into a single data set
  4. Only columns relating to mean and standard deviation calculations are included
  
The complete list of variables of each feature vector is available in 'features.txt' in the original data source

### Columns
- The mean and standard deviation of Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- The mean and standard deviation of Triaxial Angular velocity from the gyroscope. 
- A 88-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Data files
- "data.csv" contains the entire data set
- "averages.csv" contains the mean of the columns of the above data set