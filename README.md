This repository contains the results of a course project work of
[Getting and Cleaning Data of Coursera. ]
(https://class.coursera.org/getdata-033) This project works utilizes
original dataset of  

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

This project work includes the following files:

* README.md
* CodeBook.md
* run_analysis.R
* tidy_data_step4.csv
* means_by_subject_and_activity_step5.csv

The R-script "run_analysis.R" prepares a two tidy datasets from the
original dataset. The dataset "tidy_data_step4.csv" shows
accelerometer and gyroscope measurements acquired with a mobile phone
during different activities (WALKING, WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Only variables showing
mean and standard deviation are extracted from the original data to
this dataset. Each activity has been performed by 30 different persons
(variable subject in the dataset) and each row corresponds to a one measurement.

To run the script, do the following. The directory to the original
dataset has to be specified as a variable named "directory" in the script "run_analysis.R". 
The script can be run on a command line by giving a command "Rscript
run_analysis.R" or in R by command source("run_analysis.R").