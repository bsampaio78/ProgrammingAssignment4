## Entry function for analysis of Samsung data. It produces
## data set with the average of each variable for each activity and each subject 

## Parameters 
## dir: directory or URL containg Samsung data. Default value is the current working directory.
## If dir is a URL, It should point to a compressed zip file.

run_analysis <- function(dir = getwd()) {
    
    ## Load dependencies
    require(plyr)
    require(dplyr)
    require(assertthat)
    require(utils)
    
    ## INTERNAL HELPER FUNCTIONS START
    
    ## Function that creates clean feature names.
    ## Parameters 
    ## input: feature name.
    cleanLabel <- function(label) {
        label <- gsub("^t", "time", label)
        label <- gsub("^f", "frequency", label)
        label <- gsub("-mean\\(\\)", "Mean", label)
        label <- gsub("-std\\(\\)", "Std", label)
        label <- gsub("-meanFreq\\(\\)", "MeanFreq", label)
        label <- gsub("-", "", label)
        
        label
    }
    
    ## Data extraction from Samsung data files.
    ## Parameters 
    ## name: data type corresponding to data folders. Valid values are "train" or "test".
    buildSet <- function(name, dir) {
        
        ## Load files
        features <- read.table(paste0(dir, "/features.txt"))
        activityLabels <- read.table(paste0(dir, "/activity_labels.txt"))
        subjects <- read.table(paste0(dir, "/") %>% paste0(name) %>% paste0("/subject_") %>% paste0(name) %>% paste0(".txt"))
        xData <- read.table(paste0(dir, "/") %>% paste0(name) %>% paste0("/X_") %>% paste0(name) %>% paste0(".txt"))
        activities <- read.table(paste0(dir, "/") %>% paste0(name) %>% paste0("/y_") %>% paste0(name) %>% paste0(".txt"))
        
        ## Check if input data consistent
        assertthat::assert_that(nrow(features) == ncol(xData))
        assertthat::assert_that(nrow(subjects) == nrow(xData), nrow(activities) == nrow(xData))
        
        ## Uses descriptive activity names to name the activities in the data set 
        activities$V1 <- mapvalues(activities$V1, from = as.vector(activityLabels$V1), to = as.vector(activityLabels$V2))
        
        ## Extract list containing feature names
        ## Ensure that feature names are not duplicated
        ## Feature names will be used as columns. Duplicated column names make select() fuction failed.
        featureNames <- as.character(features$V2)
        if(length(which(duplicated(features$V2))) > 0) {
            repeatedNames <- features[duplicated(features$V2),]
            featureNames <- apply(features, 1, 
                                  function(x) {
                                      if(x[2] %in% repeatedNames$V2) paste0(x[2], x[1]) else x[2]
                                  })
        }
        
        ## Use feature names as column names
        colnames(xData) <- featureNames
        
        ## Extract mean and standard deviation meadurements
        ## Merge data sets
        data <- cbind(subjects,
                      activities,
                      select(xData, contains("-mean()")),
                      select(xData, contains("-std()")),
                      select(xData, contains("-meanFreq()")))
        
        ## Appropriately labels the data set with descriptive variable names
        colnames(data) <- simplify2array(lapply(colnames(data), cleanLabel))
        colnames(data)[1] <- "subject"
        colnames(data)[2] <- "activity"
        
        data
    }
    
    ## INTERNAL HELPER FUNCTIONS END
    
    ## If dir parameter is a URL, download and unzip the data set
    if(length(grep("?(f|ht)tp(s?)://(.*)[.][a-z]+", dir)) != 0) {
        fileName <- tempfile(fileext = ".zip")
        download.file(dir, fileName, method = "curl")
        unzip(fileName, exdir = ".")
        file.remove(fileName)
        
        dir <- "./UCI HAR Dataset"
    }
    
    ## R.1 - Merge the training and the test sets to create one data set
    ## R.2 - Extract only the measurements on the mean and standard deviation for each measurement
    ## R.3 - Uses descriptive activity names to name the activities in the data set
    ## R.4 - Appropriately labels the data set with descriptive variable names
    dataSet <- rbind(buildSet("train", dir), buildSet("test", dir))
    
    ## R.5 - From the data set, creates a second,
    ## independent tidy data set with the average of each variable for each activity and each subject
    result <- apply(dataSet[3:ncol(dataSet)], 2, function(x) {
        as.data.frame(
            ftable(
                tapply(x, list(as.factor(dataSet[,1]), as.factor(dataSet[,2])), mean)))
    })
    
    result <- join_all(result, by = c("Var1", "Var2"))
    
    ## In 5.5 columns were renamed to Var1/Var2/Freq
    ## Here we undo that using the desired  column names
    colnames(result) <- colnames(dataSet)
    
    ## Remove raw data
    if(dir.exists("./UCI HAR Dataset")) {
        unlink("./UCI HAR Dataset", recursive = TRUE)
    }
    
    result
}

## Run the script

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
write.table(run_analysis(url), "results.txt", row.names = FALSE)
