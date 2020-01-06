---  
title: "CodeBook"  
author: "sharonevanscpt"  
date: "02/01/2020"  
output: html_document  
---  

## Introduction

This is an R Markdown document to describe the variables, data and any transformations or work that I've done to clean up the data for this project.

## Study Design

Some data was provided as part of the Getting and Cleaning Data module of the Data Science course: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> 

There is a description of the data here: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

30 volunteers (subjects) performed six activities (walking, walking upstairs, walking downstairs, sitting, standing and laying) whilse wearing a Samsung Galaxy S II on their waists.  The data was provided in two sets, one labelled "training" and one labelled "test".  All types of data were provided in different *.txt files, with README, information on measurements, subject numbers, activity labels, measurement feature labels (such as "tBodyAcc-mean()-X") and the measurements.

#### Citations: 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.  

Use of this dataset in publications is acknowledged by referencing the following publication [1]  
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

#### Declaration:

I have not used this data for commercial purposes.

## Original Code Book

The original code book (features_info.txt) is quoted from below to provide context of what information was used.  ~~strikethrough~~ indicates that the information was not used in the final dataset.

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

>tBodyAcc-XYZ  
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

>The set of variables that were estimated from these signals are: 

>mean(): Mean value  
std(): Standard deviation  
~~mad(): Median absolute deviation~~  
~~max(): Largest value in array~~  
~~min(): Smallest value in array~~  
~~sma(): Signal magnitude area~~  
~~energy(): Energy measure. Sum of the squares divided by the number of values.~~  
~~iqr(): Interquartile range~~  
~~entropy(): Signal entropy~~  
~~arCoeff(): Autorregresion coefficients with Burg order equal to 4~~  
~~correlation(): correlation coefficient between two signals~~  
~~maxInds(): index of the frequency component with largest magnitude~~  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
~~skewness(): skewness of the frequency domain signal~~  
~~kurtosis(): kurtosis of the frequency domain signal~~  
~~bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.~~  
angle(): Angle between to vectors.  

>Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  
>gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

>Notes:  
>======  
>* Features are normalized and bounded within [-1,1].  
>* Each feature vector is a row on the 'X' and 'y' files.  
>* The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).  
>* The gyroscope units are rad/seg.

## Code Book for FINAL Dataset

The tables below describe each variable in the final tidy dataset:

I'd like to also provide units - but there were no units provided in the original data, so all I know is what I've done to modify the data.

There are 180 rows and 88 columns in the final dataset


