## LOAD DATA
names <- read.delim2("./data/features.txt", header = FALSE, sep = " ")[,2]
train_features <- read.delim2("./data/train/X_train.txt", header = FALSE, sep = "")
test_features <- read.delim2("./data/test/X_test.txt", header = FALSE, sep = "")
train_labels <- read.delim2("./data/train/y_train.txt", header = FALSE, sep = "")
test_labels <- read.delim2("./data/test/y_test.txt", header = FALSE, sep = "")

## CREATE ONE DATASET "data" BY MERGING TEST AND TRAIN SETS

features <- apply(rbind(train_features, test_features), 2, as.numeric)
labels <- rbind(train_labels, test_labels)
data <- cbind(features, labels)

## EXTRACT MEAN AND STD ON MEASUREMENTS   
column_means <- colMeans(features)
column_sds <- apply(features, 2, sd)


## USE DESCRIPTIVE ACTIVITY NAMES
label_names <- read.delim2("./data/activity_labels.txt", header = FALSE, sep = "")[2]


## APPROPRIATELY LABEL THE DATA /W DESCRIPTIVE VARIABLE NAMES 
colnames(data) <- c(names, "label")
data$label <- label_names[[1]][as.numeric(data$label)]

## CREATE AN INDEPENDENT TIDY DATASET WITH AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
train_subjects <- read.delim2("./data/train/subject_train.txt", header = FALSE, sep = "")
test_subjects <- read.delim2("./data/test/subject_test.txt", header = FALSE, sep = "")
subjects <- rbind(train_subjects, test_subjects)
data <- cbind(data, subjects)
colnames(data) <- c(names, "activity", "subject")
split_data <- split(data[,1:561], list(data$subject, data$activity))
extracted_values <- lapply(split_data, colMeans)
tidy_averages <- t(as.data.frame(extracted_values))
write.table(tidy_averages,"tidy_averages.txt", row.names = FALSE)