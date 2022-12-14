# Getting and Cleaning Data R Project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

## Experiment Details

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## This repository contains: 

README.md, Overview of data and experiment performed for obtaining said data, Overview of files in the project.

CodeBook.md, Information regarding the data used including details about variables, transformation steps.

run_analysis.R, r script to perform the task of collecting the data, merging datasets of training and testing, cleaning the data and creating a final dataset with summary of cleaned data. (data set directory renamed to "Dataset" for working purpose, so it is reflected in r file)

Tidy_Data.txt, dataset containing average, according to subject and activity, of all original features(from training and testing data) that were mean or standard deviation data, obtained as a result of R-script. 



