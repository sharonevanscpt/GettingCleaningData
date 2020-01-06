# GettingCleaningData
Week 4 Project for Getting and Cleaning Data  

---  
title: "README"  
author: "sharonevanscpt"  
date: "13/12/2019"  
output: html_document  
---  

## Introduction

This is a README document to explain details on the project I've completed for the week 4 assignment for the module "Getting and Cleaning Data" for the Data Science Specialism couse run by Johns Hopkins University on Coursera. 

>"The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis."

>"One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone."

This README is intended to explain how all of my scripts work and how they're connected.

## Data Provided

Some data was provided: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> 

There is a description here: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

## My Code

There is only one code required to tidy the data provided and run all of the required steps.  It is called "run_analysis.R" and it does the following:

0. Imports data and organises it  
i) imports labels, then training data, then test data then adds headers, subject column and activity label column  
1. Merges the training and the test sets to create one data set  
i) the test set is added below the training set  
2. Extracts only the measurements on the mean and standard deviation for each measurement  
i) first columns with duplicated names are removed  
ii) second, the subject, activity, mean and std columns are kept in an "extract" dataset  
3. Uses descriptive activity names to name the activities in the data set  
i) replaces activity numbers with official label names  
4. Appropriately labels the data set with descriptive variable names  
i) to follow tidy data principles the brackets, dashes and underscores are removed  
ii) lowercase font is used  
iii) word contractions are expanded for clarity  
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject  
i) the dataset produced by my code is a "wide" tidy dataset and the mean of each variable has been calculated for each activity and subject, leaving 180 rows (as there are 6 activities and 30 subjects.  

The "run_analysis.R" code looks like this:

```{r samsungcleaner}
samsungcleaner <- function(directory,outputname) {
  # ------------------------------------------------------------------------------------
  # The purpose of this code is as follows:
  # 1) Merge the training and test sets to create one data set
  # 2) Extract ONLY the measurements on the mean and standard deviation for each measurement
  # 3) Use descriptive acivity names to name the activities in the data set
  # 4) Appropriately labels the data set with descriptive variable names
  # 5) From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
  # ------------------------------------------------------------------------------------
  library(dplyr, warn.conflicts=FALSE, quietly = TRUE)
  setwd(directory) # makes the working directory right
  all_files_list <- list.files(directory, pattern=".*\\.txt",full.names=TRUE, recursive=TRUE) ## lists dir/filename
  
  if(outputname%in%all_files_list) { rm(outputname) } # Checks for output file and deletes if already in existence
  
  ## read labels
  actlabel <- read.table("activity_labels.txt", header=FALSE, dec=".", na.strings = "NA") ## activity label
  actlabel$V2 <- factor(actlabel$V2, levels = actlabel$V2) ## fix level ordering
  features <- read.table("features.txt", header=FALSE, dec=".", na.strings = "NA") ## feature label
  ## read training data
  subjecttraindata <- read.delim("train/subject_train.txt", header=FALSE, sep="\t", dec=".") ## subject 1-30
  xtraindata <- read.table("train/X_train.txt", header=FALSE, dec=".", na.strings = "NA") 
  ytraindata <- read.delim("train/y_train.txt", header=FALSE, sep="\t", dec=".") 
  names(xtraindata) <- features$V2 ## sets label names for headers
  alltraindata <- cbind(subjecttraindata,ytraindata,xtraindata)  ## merge train data
  names(alltraindata)[1] <- "subject" ## sets label names for headers
  names(alltraindata)[2] <- "activitylabel" ## sets label names for headers
  
  ## read test data
  subjecttestdata <- read.delim("test/subject_test.txt", header=FALSE, sep="\t", dec=".") ## subject 1-30
  xtestdata <- read.table("test/X_test.txt", header=FALSE, dec=".", na.strings = "NA") 
  ytestdata <- read.delim("test/y_test.txt", header=FALSE, sep="\t", dec=".") 
  names(xtestdata) <- features$V2 ## sets label names for headers
  alltestdata <- cbind(subjecttestdata,ytestdata,xtestdata) ## merge test data
  names(alltestdata)[1] <- "subject" ## sets label names for headers
  names(alltestdata)[2] <- "activitylabel" ## sets label names for headers
  
  ## 1: Merge Data
  alldata <- rbind(alltraindata,alltestdata)
  
  ## 2: Extract ONLY the measurements on the mean and standard deviation for each measurement
  cleaned <- subset(alldata, select=which(!duplicated(names(alldata)))) ## remove duplicate columns
  extract <- select(cleaned,matches("subject|activitylabel|mean\\(\\)|std\\(\\)")) ## extract means and stds
  
  ## 3: Use descriptive acivity names to name the activities in the data set
  for (i in 1:6) { ## replaces activity numbers with official label names
    extract$activityname[extract$activitylabel==i] <- as.character(actlabel$V2[[i]])
  }
  extract <- select(extract,matches("subject|activityname|mean|std")) ## remove activity label
  
  ## 4: Appropriately labels the data set with descriptive variable names
  names(extract) <- gsub("\\(\\)|\\-|\\_","",names(extract),) ## remove brackets, dashes, underscores
  names(extract) <- sub("^t","Time",names(extract),) ## expand initial t to Time
  names(extract) <- sub("^f","Frequency",names(extract),) ## expand initial f to Frequency
  names(extract) <- sub("Acc","Accelerometer",names(extract),) ## expand Acc to Accelerometer
  names(extract) <- sub("Gyro","Gyroscope",names(extract),) ## expand Gyro to Gyroscope
  names(extract) <- sub("Mag","Magnitude",names(extract),) ## expand Mag to Magnitude
  names(extract) <- sub("std","standarddeviation",names(extract),) ## expand std to standarddeviation
  names(extract) <- tolower(names(extract)) ## change to lowercase for tidiness
  extract$activityname <- gsub("\\_","",extract$activityname,) ## remove underscores from activity names
  extract$activityname <- tolower(extract$activityname) ## change to lowercase for tidiness
  
  ## 5: From the data set in step 4, create a second, independent, tidy data set with the
  ##    average of each variable for each activity and each subject.
  enn <- length(names(extract))
  keepnames <- names(extract[3:enn-1]) ## select required variables to calculate the means
  
  output <- extract %>% 
    group_by(subject,activityname) %>% ## set group_by to set subject and activity
    summarize_at(vars(keepnames),list(~mean(., na.rm=TRUE))) ## calculate means
  write.table(output,outputname,row.names = FALSE) ## write output file
  output
}
```

