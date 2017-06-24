# Codebook for Getting and Cleaning Data Course Project on Coursera.org: Samsung Wearable Data

## Introduction

The variables described below are the IDs and summaries of data collected from accelerometers and gyroscopes of Samsung Galaxy S smartphones during execution of six different types of activity by 30 volunteers. The original data set is taken from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and is fully described at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and in the following publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## Original Data Feature Selection (from README.txt and features_info.txt supplied with the data set)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

## This Tidy Data Set

The current tidy data set was obtained by:
1. Combining the test and training data sets described above.
2. Averaging each mean and each standard deviation variable described above for every combination of activity type and subject. 
3. Adding subject IDs, descriptive acitvity and variable labels.

The variables below are described in the order in which they appear in the tidy data set. Note that none of these variables have any units: the ID variables are categorical and the Doubleal variables are all normalised between -1 and 1. For the Doubleal variables, a separate decsription is not given as they are all means of the quantity specified by the name of column and described above under Original Data Feature Selection.

#Column No. - #Name - #Type - #Description
1 | Activity | Category | Subject activity type: one of "laying", "sitting", "standing", "walking", "walking downstairs" and "walking upstairs"
2 | Subject_ID | Category | Subject identifier: an integer between 1 and 30
3	|	tBodyAcc-mean()-X	|	Double	|	Between -1 and 1
4	|	tBodyAcc-mean()-Y	|	Double	|	Between -1 and 1
5	|	tBodyAcc-mean()-Z	|	Double	|	Between -1 and 1
6	|	tBodyAcc-std()-X	|	Double	|	Between -1 and 1
7	|	tBodyAcc-std()-Y	|	Double	|	Between -1 and 1
8	|	tBodyAcc-std()-Z	|	Double	|	Between -1 and 1
9	|	tGravityAcc-mean()-X	|	Double	|	Between -1 and 1
10	|	tGravityAcc-mean()-Y	|	Double	|	Between -1 and 1
11	|	tGravityAcc-mean()-Z	|	Double	|	Between -1 and 1
12	|	tGravityAcc-std()-X	|	Double	|	Between -1 and 1
13	|	tGravityAcc-std()-Y	|	Double	|	Between -1 and 1
14	|	tGravityAcc-std()-Z	|	Double	|	Between -1 and 1
15	|	tBodyAccJerk-mean()-X	|	Double	|	Between -1 and 1
16	|	tBodyAccJerk-mean()-Y	|	Double	|	Between -1 and 1
17	|	tBodyAccJerk-mean()-Z	|	Double	|	Between -1 and 1
18	|	tBodyAccJerk-std()-X	|	Double	|	Between -1 and 1
19	|	tBodyAccJerk-std()-Y	|	Double	|	Between -1 and 1
20	|	tBodyAccJerk-std()-Z	|	Double	|	Between -1 and 1
21	|	tBodyGyro-mean()-X	|	Double	|	Between -1 and 1
22	|	tBodyGyro-mean()-Y	|	Double	|	Between -1 and 1
23	|	tBodyGyro-mean()-Z	|	Double	|	Between -1 and 1
24	|	tBodyGyro-std()-X	|	Double	|	Between -1 and 1
25	|	tBodyGyro-std()-Y	|	Double	|	Between -1 and 1
26	|	tBodyGyro-std()-Z	|	Double	|	Between -1 and 1
27	|	tBodyGyroJerk-mean()-X	|	Double	|	Between -1 and 1
28	|	tBodyGyroJerk-mean()-Y	|	Double	|	Between -1 and 1
29	|	tBodyGyroJerk-mean()-Z	|	Double	|	Between -1 and 1
30	|	tBodyGyroJerk-std()-X	|	Double	|	Between -1 and 1
31	|	tBodyGyroJerk-std()-Y	|	Double	|	Between -1 and 1
32	|	tBodyGyroJerk-std()-Z	|	Double	|	Between -1 and 1
33	|	tBodyAccMag-mean()	|	Double	|	Between -1 and 1
34	|	tBodyAccMag-std()	|	Double	|	Between -1 and 1
35	|	tGravityAccMag-mean()	|	Double	|	Between -1 and 1
36	|	tGravityAccMag-std()	|	Double	|	Between -1 and 1
37	|	tBodyAccJerkMag-mean()	|	Double	|	Between -1 and 1
38	|	tBodyAccJerkMag-std()	|	Double	|	Between -1 and 1
39	|	tBodyGyroMag-mean()	|	Double	|	Between -1 and 1
40	|	tBodyGyroMag-std()	|	Double	|	Between -1 and 1
41	|	tBodyGyroJerkMag-mean()	|	Double	|	Between -1 and 1
42	|	tBodyGyroJerkMag-std()	|	Double	|	Between -1 and 1
43	|	fBodyAcc-mean()-X	|	Double	|	Between -1 and 1
44	|	fBodyAcc-mean()-Y	|	Double	|	Between -1 and 1
45	|	fBodyAcc-mean()-Z	|	Double	|	Between -1 and 1
46	|	fBodyAcc-std()-X	|	Double	|	Between -1 and 1
47	|	fBodyAcc-std()-Y	|	Double	|	Between -1 and 1
48	|	fBodyAcc-std()-Z	|	Double	|	Between -1 and 1
49	|	fBodyAcc-meanFreq()-X	|	Double	|	Between -1 and 1
50	|	fBodyAcc-meanFreq()-Y	|	Double	|	Between -1 and 1
51	|	fBodyAcc-meanFreq()-Z	|	Double	|	Between -1 and 1
52	|	fBodyAccJerk-mean()-X	|	Double	|	Between -1 and 1
53	|	fBodyAccJerk-mean()-Y	|	Double	|	Between -1 and 1
54	|	fBodyAccJerk-mean()-Z	|	Double	|	Between -1 and 1
55	|	fBodyAccJerk-std()-X	|	Double	|	Between -1 and 1
56	|	fBodyAccJerk-std()-Y	|	Double	|	Between -1 and 1
57	|	fBodyAccJerk-std()-Z	|	Double	|	Between -1 and 1
58	|	fBodyAccJerk-meanFreq()-X	|	Double	|	Between -1 and 1
59	|	fBodyAccJerk-meanFreq()-Y	|	Double	|	Between -1 and 1
60	|	fBodyAccJerk-meanFreq()-Z	|	Double	|	Between -1 and 1
61	|	fBodyGyro-mean()-X	|	Double	|	Between -1 and 1
62	|	fBodyGyro-mean()-Y	|	Double	|	Between -1 and 1
63	|	fBodyGyro-mean()-Z	|	Double	|	Between -1 and 1
64	|	fBodyGyro-std()-X	|	Double	|	Between -1 and 1
65	|	fBodyGyro-std()-Y	|	Double	|	Between -1 and 1
66	|	fBodyGyro-std()-Z	|	Double	|	Between -1 and 1
67	|	fBodyGyro-meanFreq()-X	|	Double	|	Between -1 and 1
68	|	fBodyGyro-meanFreq()-Y	|	Double	|	Between -1 and 1
69	|	fBodyGyro-meanFreq()-Z	|	Double	|	Between -1 and 1
70	|	fBodyAccMag-mean()	|	Double	|	Between -1 and 1
71	|	fBodyAccMag-std()	|	Double	|	Between -1 and 1
72	|	fBodyAccMag-meanFreq()	|	Double	|	Between -1 and 1
73	|	fBodyBodyAccJerkMag-mean()	|	Double	|	Between -1 and 1
74	|	fBodyBodyAccJerkMag-std()	|	Double	|	Between -1 and 1
75	|	fBodyBodyAccJerkMag-meanFreq()	|	Double	|	Between -1 and 1
76	|	fBodyBodyGyroMag-mean()	|	Double	|	Between -1 and 1
77	|	fBodyBodyGyroMag-std()	|	Double	|	Between -1 and 1
78	|	fBodyBodyGyroMag-meanFreq()	|	Double	|	Between -1 and 1
79	|	fBodyBodyGyroJerkMag-mean()	|	Double	|	Between -1 and 1
80	|	fBodyBodyGyroJerkMag-std()	|	Double	|	Between -1 and 1
81	|	fBodyBodyGyroJerkMag-meanFreq()	|	Double	|	Between -1 and 1
