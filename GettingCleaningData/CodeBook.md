#Code Book

## Data source
The dataset is derived from Human Activity Recognition Using Smartphones Data Set. Please refer here for more detailed information on the original dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Original feature set
Here is a quote from the feature set description of the original data (file "features_info.txt"):

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals 
> tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
> Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz 
> to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals 
> (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
> (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated 
> using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, 
> fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The new data set has slightly different naming convention, described in the "Features" section below.

## Data processing
The following processing was applied to the original data set:

* Test and Train datasets were merged together
* The data was joined with the activity names and subject IDs
* Only the features with mean and standard deviation data were selected
* The original feature names were replaced with cleaner versions
* For each activity and each subject an average was calculated and only those averages are included in the final dataset.

## Features
All features, except for "activity" and "subject"  have names that follow a certain naming convention:
* Prefix "time" means that the feature is a data directly captured from a device; "frequency" prefix denotes results of Fast Fourier Transform application to a signal.
* "Mean" signifies that the feature originally was a mean value; "Std" means "standard deviation.
* "X", "Y", and "Z" at the end mean axial data in X, Y and Z direction

"activity" feature contains an activity label, one of the following: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
"subject" has a numeric id of the test subject.

