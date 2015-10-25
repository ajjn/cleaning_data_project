##Library dependencies
The script run_analysis.R uses two external R-libraries, namely *readr* and *dplyr*.

##Process steps
1. The original data is divided into two datasets, namely trainning and
testing datasets. This scripts merges the datasets together using
rbind function for the data.frames.
2. The original data contains 561 variables derived
from accelerometer and gyroscope measurements. In this script the
standard deviation and mean variables are extracted from the original
data by using case sensitive grep-function filtering variables
having words "mean()" or "std()" from the variable names and subsetting
the corresponding columns from the dataset.
3. The activity id has been replaced from the original dataset by the
corresponding activity name. Then the activity and subject names have been added to the
dataset by function cbind.
4. The resulting tidy dataset has been sorted by
activity and subject and saved as a text file "tidy_data_step4.txt".
5. Mean of each variable has been calculated over the measurements of
the same activities and presented separately for each subject.

##Variables
The varbles are mean and standard deviation estimates from the
accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and
tGyro-XYZ. These time domain signals (prefix 't' to denote time) were
captured at a constant rate of 50 Hz. Then they were filtered using a
median filter and a 3rd order low pass Butterworth filter with a
corner frequency of 20 Hz to remove noise. Similarly, the acceleration
signal was then separated into body and gravity acceleration signals
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth
filter with a corner frequency of 0.3 Hz.  

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).  

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to
indicate frequency domain signals).  

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z
directions. The additional mean() and std() in the variable names
indicate, mean and standard deviation values, respectively.

The variable names are:
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The units for accelerations "acc" are in standard gravity units
'g'. The units for the  angular velocity measurements "gyro" are in
radians/seconds.

Moreover the variables are normalized and bounded within [-1,1].
