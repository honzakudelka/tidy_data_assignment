# Codebook for tidy_averages.txt
## Dataset variables
The data set consists of the average (mean) of measurements taken during several activities, done by 30 subjects. Each subject is marked "XN", where N is the ID of the subject (1-30). 

There are 6 activities, that were recorded. Laying, Sitting, Standing, Walking, Walking upstairs, Walking downstairs. Each row of the data set represents one subject during one activity, corresponding to the name of the row (e.g. "X25.Walking"" represents the average measurements taken when subject 25 was walking.)

There are 561 columns in the data set, representing the 561 different measurements or calculations taken for each activity and subject. Variables are described in corresponding column names, they are in time and frequency domain.

## Transformations
The raw data, that was used to generate our tidy_averages is from the Human Activity Recognition Using Smartphones Data Set found in the UCI ML Repository (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The raw is found split into Test and Train data sets. The tidy_averages data set is generated in the following way:

1. Load the provided files (features.txt, X_train.txt, X_test.txt, y_train.txt, y_test.txt, activity_labels.txt, subject_train.txt, subject_test.txt) into data frames by calling read.delim2 with default values. These dataframes will be referenced by name, while omiting the .txt suffix (e.g. y_train refers to the dataframe generated from y_train.txt)
2. generate values data.frame by calling rbind on X_train and X_test. This data.frame has the numeric class.
3. generate labels data.frame by calling rbind on y_train and y_test.
4. generate subjects data.frame by calling rbind on subject_train and subject.test
5. generate data data.frame by calling cbind on values, labels and subject data frames.
6. set column names for data equal to c(features, "label", "subject")
7. split data according to data\$label and data\$subject
8. calculate the column mean for each split of the data
9. merge the lists, created during the splitting, by calling as.data.frame. 
10. take the transpose of the output in 9. to get tidier results
11. export the resulting dataframe from 10. as .txt



