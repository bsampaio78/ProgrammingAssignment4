### Introduction

This is the course project for the Getting and Cleaning Data Course, part of
Data Science specialisation offered by Johns Hopkins Bloomberg School of Public Health
through Coursera.

The main outcome of this project is the analysis of collected data from the accelerometers from the Samsung Galaxy S smartphone. The data set result of the analysis is clean and tidy. Tidy data has the following traits:

1. Each measured variable is in one column
2. Each different observation of that variable should be in a different row
3. There should be one table for each “kind” of variable
4. In case of multiple tables, they should include a column in the table that allows them to be linked

The data for this project was downloaded from [1].

This repository contains the following artefacts:

1. run_analysis.R - R script that analyses Samsung data
2. CodeBook.md - it describes the contents, structure, and layout of a data collection
The contained information is intended to be complete and self-explanatory for each variable in the data file.
3. README.md - this file

### Running the Analysis Script

It is recommended to use the project root directory as working directory. The script can then be loaded with the following command - source('run_analysis.R')

The script can be run in three different ways:

1. run_analysis() - data set is supposed to be in the working directory
2. run_analysis(DIRECTORY) - DIRECTORY contains the path to the data set. Used if working and data set directories do not match
3. run_analysis(URL) - if a url is provided, the script will download the data set and store in a temporary file and then run the analysis.

### View and Storing Results

Assuming that result of the analysis is stored in a variable called result, it can be viewed with the following R command:

> View(result)

And this command can be used to store in a file:

> write.table(result, "result.txt", row.names = FALSE)

### What the run_analysis() does

Here are the steps performed by the script:

1. If dir parameter is a URL, download and unzip the data set
2. Merge the training and the test sets to create one data set (Assignment requirement 1)
3. Extract only the measurements on the mean and standard deviation for each measurement (Assignment requirement 2)
4. Uses descriptive activity names to name the activities in the data set (Assignment requirement 3)
5. Appropriately labels the data set with descriptive variable names (Assignment requirement 4)
6. Create a tidy data set with the average of each variable for each activity and each subject (Assignment requirement 5)

run_analysis() contains two helper functions: buildSet() and cleanLabel(). buildSet functions builds each data set - train and test. cleanLabel improves the variable names.

### Running times

> system.time(run_analysis())

   user  system elapsed 
 15.340   0.129  15.466

### References

[1] - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
