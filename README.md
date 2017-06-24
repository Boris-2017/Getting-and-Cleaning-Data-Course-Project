# README for Getting and Cleaning Data Course Project on Coursera.org: Samsung Wearable Data

## Purpose

The purpose of this project is to obtain a final tidy data set suitable for further analysis from the data collected from accelerometers and gyroscopes of Samsung Galaxy S II smartphones during execution of six different types of activity by 30 volunteers. 

## Original Data 

The original data set is taken from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

The original data are fully described at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and in the following publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The original data feature selection is described in CodeBook.md.

## Files Included

File Name | Type | Description
----------|------|------------
README.md | Markdown document | This file describing everything in the submission and sequence of operations from start to finish.
CodeBook.md | Markdown document | Codebook for the final tidy data set, covering original data, initial processing applied prior to this project and the processing done to obtain the final tidy data set.
run_analysis.R| R code | R script producing the final tidy data set from the original data.
Final_Tidy_Data.txt| Space-separated text file | Final tidy data set - the outcome of this project. It is described in CodeBook.md.

## Sequence of Steps to Produce Final Tidy Data Set and Further Information

1. Unzip original data set into a directory that must then be made the R working directory for the run_analysis.R code generating the tidy data set to operate correctly.
2. Run run_analysis.R. It will, following the course project instructions:
	1. Add activity and subject identifiers to each of training and test datasets
	2. Append the two data sets.
	3. Extract only the mean and standard deviation of each measured variable in a standard 2.56s window.  
	4. Remove any inadmissible values.
	5. Give each activity in the data set a descriptive activity name.
	6. Give each variable in the data set a descriptive variable name. 
	7. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
	8. Save this data set as a space-separated text file into the working directory as Final_Tidy_Data.txt.

run_analysis.R also returns the final tidy data set for further analysis.