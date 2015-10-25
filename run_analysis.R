library(readr)
library(dplyr)
options(stringsAsFactors = FALSE)

## This directory points to the UCI HAR Dataset directory
directory = "UCI HAR Dataset"

## Load feature names (variables)
features <- read.csv(file.path(directory,"features.txt"), header=FALSE, sep=" ")
mean.indices <- grep("mean()", features[,2], fixed=TRUE)
std.indices <- grep("std()", features[,2], fixed=TRUE)

## Load the sets
test.set <- read_fwf(file.path(directory,"test","X_test.txt"), fwf_widths(rep(16,561)), progress = interactive())
test.y <- read.csv(file.path(directory,"test","y_test.txt"), header=FALSE)
test.subject <- read.csv(file.path(directory, "test", "subject_test.txt"), header=FALSE)
train.set <- read_fwf(file.path(directory,"train","X_train.txt"), fwf_widths(rep(16,561)), progress = interactive())
train.y <- read.csv(file.path(directory,"train","y_train.txt"), header=FALSE)
train.subject <- read.csv(file.path(directory, "train", "subject_train.txt"), header=FALSE)

## Load in the activity names
activities <- read.csv(file.path(directory,"activity_labels.txt"),header=FALSE, sep=" ")


## Merge the data
merged.set <- rbind(test.set, train.set)
merged.y <- rbind(test.y, train.y)
merged.subject <- rbind(test.subject, train.subject)

## Take only the mean and std
merged.set <- cbind(merged.set[, mean.indices], merged.set[, std.indices])


## Change numeros to the activity labels
l <- levels(factor(merged.y[,1]))
for (i in l) {
    merged.y[merged.y == as.numeric(i)] <- activities[[as.numeric(i),2]]
}

## bind the subject and the activity label to data set
merged.set <- cbind(merged.y, merged.subject, merged.set)

## Correct variable names and sort by subject and activity
names(merged.set) <- c("Activity", "Subject", features[mean.indices,2], features[std.indices,2])
merged.set <- arrange(merged.set, Subject, Activity)

## Output the results of step 4
write.table(merged.set, "tidy_data_step4.txt", row.names=FALSE)

## Average of each variable for each activity
summary <- summarise_each(group_by(merged.set, Subject, Activity), funs(mean))

## Output the results of step 5
write.table(summary, "means_by_subject_and_activity_step5.txt", row.names=FALSE)