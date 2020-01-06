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

The original code book (features_info.txt) is quoted from below to provide context of what information was used.

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.  
These time domain signals (prefix 't' to denote time) [...].  
Similarly, the acceleration signal was then separated into body and gravity acceleration signals [...].  
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).  
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm [...].  
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing [...] 'f' to indicate frequency domain signals). 

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
~~angle(): Angle between to vectors.~~  

>Notes  
>* Features are normalized and bounded within [-1,1].  
>* Each feature vector is a row on the 'X' and 'y' files.  
>* The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).  
>* The gyroscope units are rad/seg.

## Code Book for FINAL Dataset

The table below describes each variable in the final tidy dataset:

Accleration units = m/seg^2^  
Gyroscrope Units = rad/seg

There are 180 rows and 68 columns in the final *wide* tidy dataset

 | names | class | unit |   
 | ---- | ---- | ---- |
 | subject | integer |   |   
 | activityname | character |   |   
 | timebodyaccelerometermeanx | numeric | m/seg^2^ |   
 | timebodyaccelerometermeany | numeric | m/seg^2^ |   
 | timebodyaccelerometermeanz | numeric | m/seg^2^ |   
 | timebodyaccelerometerstandarddeviationx | numeric | m/seg^2^ | 
 | timebodyaccelerometerstandarddeviationy | numeric | m/seg^2^ | 
 | timebodyaccelerometerstandarddeviationz | numeric | m/seg^2^ | 
 | timegravityaccelerometermeanx | numeric | m/seg^2^ | 
 | timegravityaccelerometermeany | numeric | m/seg^2^ | 
 | timegravityaccelerometermeanz | numeric | m/seg^2^ | 
 | timegravityaccelerometerstandarddeviationx | numeric | m/seg^2^ | 
 | timegravityaccelerometerstandarddeviationy | numeric | m/seg^2^ | 
 | timegravityaccelerometerstandarddeviationz | numeric | m/seg^2^ | 
 | timebodyaccelerometerjerkmeanx | numeric | m/seg^2^ | 
 | timebodyaccelerometerjerkmeany | numeric | m/seg^2^ | 
 | timebodyaccelerometerjerkmeanz | numeric | m/seg^2^ | 
 | timebodyaccelerometerjerkstandarddeviationx | numeric | m/seg^2^ | 
 | timebodyaccelerometerjerkstandarddeviationy | numeric | m/seg^2^ | 
 | timebodyaccelerometerjerkstandarddeviationz | numeric | m/seg^2^ | 
 | timebodygyroscopemeanx | numeric | rad/seg | 
 | timebodygyroscopemeany | numeric | rad/seg | 
 | timebodygyroscopemeanz | numeric | rad/seg | 
 | timebodygyroscopestandarddeviationx | numeric | rad/seg | 
 | timebodygyroscopestandarddeviationy | numeric | rad/seg | 
 | timebodygyroscopestandarddeviationz | numeric | rad/seg | 
 | timebodygyroscopejerkmeanx | numeric | rad/seg | 
 | timebodygyroscopejerkmeany | numeric | rad/seg | 
 | timebodygyroscopejerkmeanz | numeric | rad/seg | 
 | timebodygyroscopejerkstandarddeviationx | numeric | rad/seg | 
 | timebodygyroscopejerkstandarddeviationy | numeric | rad/seg | 
 | timebodygyroscopejerkstandarddeviationz | numeric | rad/seg | 
 | timebodyaccelerometermagnitudemean | numeric | m/seg^2^ | 
 | timebodyaccelerometermagnitudestandarddeviation | numeric | m/seg^2^ | 
 | timegravityaccelerometermagnitudemean | numeric | m/seg^2^ | 
 | timegravityaccelerometermagnitudestandarddeviation | numeric | m/seg^2^ | 
 | timebodyaccelerometerjerkmagnitudemean | numeric | m/seg^2^ | 
 | timebodyaccelerometerjerkmagnitudestandarddeviation | numeric | m/seg^2^ | 
 | timebodygyroscopemagnitudemean | numeric | rad/seg | 
 | timebodygyroscopemagnitudestandarddeviation | numeric | rad/seg | 
 | timebodygyroscopejerkmagnitudemean | numeric | rad/seg | 
 | timebodygyroscopejerkmagnitudestandarddeviation | numeric | rad/seg | 
 | frequencybodyaccelerometermeanx | numeric | m/seg^2^ | 
 | frequencybodyaccelerometermeany | numeric | m/seg^2^ | 
 | frequencybodyaccelerometermeanz | numeric | m/seg^2^ | 
 | frequencybodyaccelerometerstandarddeviationx | numeric | m/seg^2^ | 
 | frequencybodyaccelerometerstandarddeviationy | numeric | m/seg^2^ | 
 | frequencybodyaccelerometerstandarddeviationz | numeric | m/seg^2^ | 
 | frequencybodyaccelerometerjerkmeanx | numeric | m/seg^2^ | 
 | frequencybodyaccelerometerjerkmeany | numeric | m/seg^2^ | 
 | frequencybodyaccelerometerjerkmeanz | numeric | m/seg^2^ | 
 | frequencybodyaccelerometerjerkstandarddeviationx | numeric | m/seg^2^ | 
 | frequencybodyaccelerometerjerkstandarddeviationy | numeric | m/seg^2^ | 
 | frequencybodyaccelerometerjerkstandarddeviationz | numeric | m/seg^2^ | 
 | frequencybodygyroscopemeanx | numeric | rad/seg | 
 | frequencybodygyroscopemeany | numeric | rad/seg | 
 | frequencybodygyroscopemeanz | numeric | rad/seg | 
 | frequencybodygyroscopestandarddeviationx | numeric | rad/seg | 
 | frequencybodygyroscopestandarddeviationy | numeric | rad/seg | 
 | frequencybodygyroscopestandarddeviationz | numeric | rad/seg | 
 | frequencybodyaccelerometermagnitudemean | numeric | m/seg^2^ | 
 | frequencybodyaccelerometermagnitudestandarddeviation | numeric | m/seg^2^ | 
 | frequencybodybodyaccelerometerjerkmagnitudemean | numeric | m/seg^2^ | 
 | frequencybodybodyaccelerometerjerkmagnitudestandarddeviation | numeric | m/seg^2^ | 
 | frequencybodybodygyroscopemagnitudemean | numeric | rad/seg | 
 | frequencybodybodygyroscopemagnitudestandarddeviation | numeric | rad/seg | 
 | frequencybodybodygyroscopejerkmagnitudemean | numeric | rad/seg | 
 | frequencybodybodygyroscopejerkmagnitudestandarddeviation | numeric | rad/seg | 
