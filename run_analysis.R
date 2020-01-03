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
  extract <- select(cleaned,matches("subject|activitylabel|mean|std")) ## extract
  
  ## 3: Use descriptive acivity names to name the activities in the data set
  for (i in 1:6) {
    extract$activityname[extract$activitylabel==i] <- as.character(actlabel$V2[[i]])
  }
  extract <- select(extract,matches("subject|activityname|mean|std")) ## remove activity label
  
  ## 4: Appropriately labels the data set with descriptive variable names
  names(extract) <- sub("\\(\\)","",names(extract),)
  names(extract) <- gsub("\\-","",names(extract),)
  names(extract) <- gsub("\\_","",names(extract),)
  names(extract) <- sub("^t","Time",names(extract),)
  names(extract) <- sub("^f","Frequency",names(extract),)
  names(extract) <- sub("Acc","Acceleration",names(extract),)
  names(extract) <- tolower(names(extract))
  
  ## 5: From the data set in step 4, create a second, independent, tidy data set with the
  ##    average of each variable for each activity and each subject.
  keepnames <- names(extract[2:87]) ## select required variables to calculate the means
  
  output <- extract %>% 
    group_by(subject,activityname) %>% ## set group_by to set subject and activity
    summarize_at(vars(keepnames),list(~mean(., na.rm=TRUE))) ## calculate means
  write.table(output,outputname,row.names = FALSE) ## write output file
  output
}
