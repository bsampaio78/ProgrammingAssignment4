### Files used for Analysis

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training activity labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test activity labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- ‘test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

### Results Table

Table containing the following variables:

subject - volunteer ID. Its range is from 1 to 30.  
activity - activity label. Possible values are [WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING]

Other variables have the following format: [time/frequency][type][Mean/Std][X/Y/Z]. From [1], the acceleration values are originally given in standard gravity units 'g' while angular velocity in radians/seconds. Derived values are in the time/frequency domain, normalised, and bounded within [-1,1].

For each combination subject x activity, the results table contains the average of the following variables:

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

| Variable Name |
| timeBodyAccMeanX |
| timeBodyAccMeanY
| timeBodyAccMeanZ
| timeGravityAccMeanX                 
| timeGravityAccMeanY
| timeGravityAccMeanZ
| timeBodyAccJerkMeanX                
| timeBodyAccJerkMeanY
| timeBodyAccJerkMeanZ
| timeBodyGyroMeanX                   
| timeBodyGyroMeanY
| timeBodyGyroMeanZ
| timeBodyGyroJerkMeanX               
| timeBodyGyroJerkMeanY
| timeBodyGyroJerkMeanZ
| timeBodyAccMagMean                  
| timeGravityAccMagMean
| timeBodyAccJerkMagMean
| timeBodyGyroMagMean                 
| timeBodyGyroJerkMagMean
| frequencyBodyAccMeanX
| frequencyBodyAccMeanY               
| frequencyBodyAccMeanZ
| frequencyBodyAccJerkMeanX
| frequencyBodyAccJerkMeanY           
| frequencyBodyAccJerkMeanZ
| frequencyBodyGyroMeanX
| frequencyBodyGyroMeanY              
| frequencyBodyGyroMeanZ
| frequencyBodyAccMagMean
| frequencyBodyBodyAccJerkMagMean     
| frequencyBodyBodyGyroMagMean
| frequencyBodyBodyGyroJerkMagMean
| timeBodyAccStdX                     
| timeBodyAccStdY
| timeBodyAccStdZ
| timeGravityAccStdX                  
| timeGravityAccStdY
| timeGravityAccStdZ
| timeBodyAccJerkStdX                 
| timeBodyAccJerkStdY
| timeBodyAccJerkStdZ
| timeBodyGyroStdX                    
| timeBodyGyroStdY
| timeBodyGyroStdZ
| timeBodyGyroJerkStdX                
| timeBodyGyroJerkStdY
| timeBodyGyroJerkStdZ
| timeBodyAccMagStd                   
| timeGravityAccMagStd
| timeBodyAccJerkMagStd
| timeBodyGyroMagStd                  
| timeBodyGyroJerkMagStd
| frequencyBodyAccStdX
| frequencyBodyAccStdY                
| frequencyBodyAccStdZ
| frequencyBodyAccJerkStdX
| frequencyBodyAccJerkStdY            
| frequencyBodyAccJerkStdZ
| frequencyBodyGyroStdX
| frequencyBodyGyroStdY               
| frequencyBodyGyroStdZ
| frequencyBodyAccMagStd
| frequencyBodyBodyAccJerkMagStd      
| frequencyBodyBodyGyroMagStd
| frequencyBodyBodyGyroJerkMagStd
| frequencyBodyAccMeanFreqX           
| frequencyBodyAccMeanFreqY
| frequencyBodyAccMeanFreqZ
| frequencyBodyAccJerkMeanFreqX       
| frequencyBodyAccJerkMeanFreqY
| frequencyBodyAccJerkMeanFreqZ
| frequencyBodyGyroMeanFreqX          
| frequencyBodyGyroMeanFreqY
| frequencyBodyGyroMeanFreqZ
| frequencyBodyAccMagMeanFreq         
| frequencyBodyBodyAccJerkMagMeanFreq
| frequencyBodyBodyGyroMagMeanFreq
| frequencyBodyBodyGyroJerkMagMeanFreq

### About Raw Data [1]

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

### References

[1] - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones