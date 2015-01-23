#README
This repository contains code and results for the "Getting and Cleaning Data" course project.

The `run_analysis.R` script is used to process UCI Human Activity Recognition Using Smartphones Data Set  and to create a new data set with average values. To use the script:

1. Make sure you have `dplyr` library installed.
2. Download the data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
3. Unpack it in this folder (the data will go into 'UCI HAR Dataset' folder)
4. Load `run_analysis.R` script into R and run it: `cleanSet <- runAnalysis()`

Please refer to the code book for detailed explanation of the produced data set as well as for the information on the applied data transformations.