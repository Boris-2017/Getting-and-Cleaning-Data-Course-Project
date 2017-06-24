## 18.06.2017: This is the R code for the Getting and Cleaning Data Course Project on coursera.org.
## The script below operates on the data collected from accelerometers and gyroscopes of Samsung Galaxy S II smartphones
##      taken from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##      and described at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##  The purpose of the scipt is to prepare a tidy data set from the raw data, suitable for further analysis.
##
##  The script stages, following the course project instructions, are:
##      1. Add activity and subject identifiers to each of training and test datasets (note that both data sets are
##              assumed to have been downloaded and unzipped without any filename/folder alterations into 
##              a folder (UCI HAR Dataset by default) and the working directory is assumed to have been set to that folder. 
##      2. Append the two data sets.
##      3. Extract only the mean and standard deviation of each measured variable in a standard 2.56s window.  
##      4. Remove any inadmissible values.
##      5. Give each activity in the data set a descriptive activity name.
##      6. Give each variable in the data set a descriptive variable name. 
##      7. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
##      8. Save this data set as a space-separated text file into the working directory.


run_analysis <- function() 
{
        
        ## Output:              Data frame with the following columns:
        ##                              1. Descriptive activity name (one of six activities)
        ##                              2. Subject_ID (1 through 30) 
        ##                              3. For each variable representing the mean of a measurement, its mean for that subject and activity
        ##                              4. For each variable representing the standard deviation of a measurement, its mean for that subject and activity
        ##                              Means and standard deviations in (3)--(4) appear in the same order as in the original data,
        ##                                      and not as first all means followed by all standard deviations.
        ##                      Note that the script exits with an error if any required file is not found in the expected location.

        
        # Read in the test data activity_IDs, subject_IDs and the data, and join them along the column dimension 
        Test_Data=cbind(Load_Text_File("test/y_test.txt"), Load_Text_File("test/subject_test.txt"), Load_Text_File("test/X_test.txt"))   
        # Same for the training data
        Training_Data=cbind(Load_Text_File("train/y_train.txt"), Load_Text_File("train/subject_train.txt"), Load_Text_File("train/X_train.txt"))   
        # Append the test and training data sets to form the full data set
        Full_Data=rbind(Test_Data, Training_Data)
        
        # Read in the descriptive variable names (second column) and ...
        Variable_Names=Load_Text_File("features.txt")
        # ... set the Full_Data data frame column names to be the descriptive names. For readability, the descriptive variable names are not converted to lowercase.
        # Note that the variable names must be strings and hence are converted from factors using as.character
        colnames(Full_Data)=c("Activity_ID", "Subject_ID", as.character(Variable_Names$V2))
        
        # The working data set is the subset of the full data columns representing only the means and standard deviations         
        Working_Data=Full_Data[, c(1, 2, grep("mean|std", colnames(Full_Data)))]
        
        # Now check if there are any inadmissible values within the data against the specifications provided with the data...
        # .. If any are found, they are replaced with NAs and excluded from the further analysis.
        Check_for_Inadmissible_Values_Set(Working_Data[, 1], 1:6, "Column Activity ID.")                         
        Check_for_Inadmissible_Values_Set(Working_Data[, 2], 1:30, "Column Subject ID.")
        for (i in 3:ncol(Working_Data))
                Check_for_Inadmissible_Values_Numeric(Working_Data[, i], -1, 1, paste0("Column ", colnames(Working_Data)[i], "."))
        
        # Read in the descriptive variable names and ...
        Activity_Names=Load_Text_File("activity_labels.txt")
        # ... merge the working data with the descriptive activity names (second column) 
        Working_Data=merge(Working_Data, Activity_Names, by.x="Activity_ID", by.y="V1")
        # Now remove the Activity_ID column and make Activity (descriptive name in lowercase for readability) the first column, ...
        #       ... followed by the rest of the variables. Note that the last column after the merge was ... 
        #       ... the descriptive activity names, which now has been moved to Column 1 and hence needs to be removed at the end.
        Working_Data=cbind(Activity=tolower(Working_Data$V2), Working_Data[, 2:(ncol(Working_Data)-1)])
        
        # The final tidy data is formed by first splittng the working data into groups defined by subject and activity, then ...
        Final_Tidy_Data=split(Working_Data[3:ncol(Working_Data)], Working_Data[, 1:2])
        # ... the mean of each group is computed and the results reassembled into the same columns as before.
        # Note that by default a list is returned by sapply here and the original columns become rows.
        Final_Tidy_Data=t(as.data.frame(sapply(Final_Tidy_Data, colMeans)))

        # The row names after the split are of the form Activity.Subject_ID. Hence split the row names at ".", convert to an appropriate ..
        # ... data frame format and prepend those to the calculated column means.
        Final_Tidy_Data=cbind(t(as.data.frame(strsplit(rownames(Final_Tidy_Data), ".", fixed=TRUE))), Final_Tidy_Data)
       
         # The resulting row names are not very useful, so remove them.
        rownames(Final_Tidy_Data)=NULL
        # Add the first two column names since these columns did not have names being derived from the split at "."
        colnames(Final_Tidy_Data)[1:2]=c("Activity", "Subject_ID")
        
        # Finally, for the user's convenience, sort the output by activity first and subject ID (as a number for more natural order) second ...
        Final_Tidy_Data=Final_Tidy_Data[order(Final_Tidy_Data[, 1], as.numeric(Final_Tidy_Data[, 2])), ]
        # ... and save it a .txt file as per the course project instructions
        write.table(Final_Tidy_Data, "Final_Tidy_Data.txt", row.name=FALSE)
        
}

        
## This function simply reads in a text file if it exists. Otherwise, aborts the execution of the entire script.

Load_Text_File <- function (File_Name)
{
        
        ## Input:
        ##      File_Name:      Name of the text file to be read in
        ##
        ## Output:              Data frame with the contents of the file, if file exists
  
              
        if (!file.exists(File_Name))
                stop(paste("File", File_Name, "not found. Execution aborted.", sep=" "))                
        read.table(File_Name)
        
}


## This function checks if inadmissible values are present, issues a warning if so and optionally replaces them with NAs.

Check_for_Inadmissible_Values_Set <- function (Values, Admissible_Set, Warning_Message, Replace_with_NA=TRUE)
{
        
        ## Input:
        ##      Values:                 Vector of values to check for admissibility
        ##      Admissible_Set:         Vector of admissible values
        ##      Warning_Message:        String forming a part of the warning message if inadmissible values are found
        ##      Replace_with_NAs:       If TRUE, any inadmissible values are replaced with NA. 
        ##
        ## Output:                      Vector listing indices of any inadmissible values within Values. Also output as part of the warning message.
        

        Inadmissible_Value_Indices=which(!(Values %in% Admissible_Set))
        if (sum(Inadmissible_Value_Indices)>0)
                print(paste(Warning_Message, "Inadmissible values found at indices:", Inadmissible_Value_Indices))
        Inadmissible_Value_Indices
        
}


## This function checks if inadmissible values are present, issues a warning if so and optionally replaces them with NAs.

Check_for_Inadmissible_Values_Numeric <- function (Values, Min, Max, Warning_Message, Replace_with_NA=TRUE)
{
        
        ## Input:
        ##      Values:                 Vector of values to check for admissibility
        ##      Min:                    Values must be >= Min to be admissible
        ##      Max:                    Values must be <= Max to be admissible        
        ##      Warning_Message:        String forming a part of the warning message if inadmissible values are found
        ##      Replace_with_NAs:       If TRUE, any inadmissible values are replaced with NA. 
        ##
        ## Output:                      Vector listing indices of any inadmissible values within Values. Also output as part of the warning message.
        
        
        Inadmissible_Value_Indices=which(!is.numeric(Values) | Values<Min | Values>Max)
        if (sum(Inadmissible_Value_Indices)>0)
                print(paste(Warning_Message, "Inadmissible values found at indices:", Inadmissible_Value_Indices))
        Inadmissible_Value_Indices
        
}
