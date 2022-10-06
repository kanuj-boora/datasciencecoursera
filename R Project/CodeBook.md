This is codebook for the data set in Tidy_Data.txt

Refer to README.md for information pertaining to the original data set

### Sections :
1. Data
2. Variables
3. Transformation

## Data
Tidy_Data.txt is a space-seperated data file.
The first row has the names of variable.
Data in the respective columns is average of the data in original dataset.

### Variables
Subject 
- Number assigned to subject
- Range: 1 - 30

Activity
- Activity performed while recording data
- factors

All values are normalised in original dataset i.e. in range [-1, 1].

Acceleration values has units in g's(9.8 ms^-2) and gyroscope data has units in radians per sec.

TimeBody (Accelerometer/Gyroscope) (Mean()/StandardDeviation()) - X,Y,Z
- Average of Mean and standard deviation of filtered time body signals captured by acceleromater and gyroscope in XYZ axis

TimeGravity (Accelerometer/Gyroscope) (Mean()/StandardDeviation()) - X,Y,Z
- Average of Mean and standard deviation of filtered time gravity signals captured by acceleromater and gyroscope in XYZ axis

TimeBody (Accelerometer/Gyroscope) Jerk (Mean/StandardDeviation) - X,Y,Z
- Average of Mean and standard deviation of jerk(acceleration derived in time) for time body signals

TimeGravity (Accelerometer/Gyroscope) Jerk (Mean/StandardDeviation) - X,Y,Z
- Average of Mean and standard deviation of jerk(angular velocity derived in time) for time gravity signals

TimeBody (Accelerometer/Gyroscope) (Jerk) Magnitude (Mean/StandardDeviation)
- Average of magnitude of three-dimensional signals using Euclidean norm of time body signals

TimeGravity (Accelerometer/Gyroscope) (Jerk) Magnitude (Mean/StandardDeviation)
- Average of magnitude of three-dimensional signals using Euclidean norm of time gravity signals

FrequencyBody (Acceleromater/Gyrocope) (Jerk) (Mean/StandardDeviation) - X,Y,Z
- Average of data obtained by applying Fast Fourier Transform to some signals
- Frequency Domain Signals

## Transformation
Link to Original dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data from train and test directory is merged to a single dataset with values from x, y and subject datasets from both dir.

From all the data, fields with mean and standard deviation data were selected.
Proper activity labels were placed in their respective values.

Variable names replaced with their descriptive names or Expanded for more clarity.

Finally, a dataset (Tidy_Data) was created which was average of fields thus obtained according to each subject and each activity.

Implementation for each step is in run_analysis.R file.
