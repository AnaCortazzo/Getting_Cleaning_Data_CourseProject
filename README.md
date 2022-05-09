---
title: "Getting and Cleaning Data Course Project"
author: "Ana Cortazzo"
date: '2022-05-08'
output: html_document
---
# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The data were obtained from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Here you find the [data set for download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

##### Citation Request for Data Set

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

### Files

The repository contains the following files:

-   the tidy data set `tidyDataSet.txt`

-   a code book indicating the variables included in the tidy data set and their units, with a short explanation of the experiment `codebook.md`

-   the R script executed to get to the tidy data set `run_analysis.R`

### Analysis

1.  The necessary raw data is loaded into R Create a single data set with the raw values for training and test.
2.  Select only the mean and standard deviation values of the data set.
3.  Give descriptive names to the activities
4.  A tidy data set is created containing the mean values for each activity per subject.
