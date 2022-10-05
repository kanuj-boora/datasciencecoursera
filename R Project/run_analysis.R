setwd("Coursera/Getting and Cleaning Data/final_assignment/")

dir <- "./Dataset/"
library(data.table)

# Importing features and activities labels
features <- as.data.frame(fread(
    paste(dir, "features.txt", sep = ""),
    nrow = 561,
    ))
col_names <- c(features$V2, "Activity")

activities <- read.table(
    paste(dir, "activity_labels.txt", sep = ""),
    col.names = c("Code", "Activity")
)

# Importing dataset from train dir and assigning col names
df_train <- cbind(
        as.data.frame(
            fread(
                paste(dir, "train/X_train.txt", sep = ""),
                header = FALSE
            ),
            row.names = NULL),
        as.data.frame(
            fread(
                paste(dir, "train/y_train.txt", sep = ""),
                header = FALSE
            ),
            row.names = NULL
        )
        )
names(df_train) <- col_names
subject_train <- as.data.frame(
    fread(
        paste(dir, "train/subject_train.txt", sep = ""),
        header = FALSE
    ),
)
names(subject_train) <- "Subject"

nrow(df_train)
ncol(df_train)

# head(subject_train)
# head(df_train)

# Importing dataset from test dir and assigning col names
df_test <- cbind(
        as.data.frame(
            fread(
                paste(dir, "test/X_test.txt", sep = ""),
                header = FALSE
            ),
            row.names = NULL),
        as.data.frame(
            fread(
                paste(dir, "test/y_test.txt", sep = ""),
                header = FALSE
            ),
            row.names = NULL
        )
        )
subject_test <- as.data.frame(
    fread(
        paste(dir, "test/subject_test.txt", sep = ""),
        header = FALSE
    ),
)
names(subject_test) <- "Subject"
names(df_test) <- col_names

ncol(df_test)
nrow(df_test)

# Merging data from train and test together
subject <- rbind(subject_train, subject_test)
df_xy <- rbind(df_train, df_test)

df <- cbind(subject, df_xy)
nrow(df)
ncol(df)

# Extracting features containing mean and standard deviation data
library(dplyr)

vc <- grepl("mean()|std()", names(df))
final_data <- NULL
final_data <- df[vc]
final_data <- cbind(Subject = df$Subject, Activity = df$Activity, final_data)
# head(final_data)
ncol(final_data)

# Assigninig proper activity label
final_data$Activity <- activities[final_data$Activity, 2]
# head(final_data$Activity)

names(final_data)

names(final_data) <- gsub("Acc", "Accelerometer", names(final_data))
names(final_data) <- gsub("BodyBody", "Body", names(final_data))
names(final_data) <- gsub("Gyro", "Gyroscope", names(final_data))
names(final_data) <- gsub("Mag", "Magnitude", names(final_data))
names(final_data) <- gsub("^t", "Time", names(final_data))
names(final_data) <- gsub("^f", "Frequency", names(final_data))
names(final_data) <- gsub("-mean()", "Mean", names(final_data))
names(final_data) <- gsub("-std()", "StandardDeviation", names(final_data))
names(final_data) <- gsub("angle", "Angle", names(final_data))
names(final_data) <- gsub("MeanFreq()", "MeanFrequency", names(final_data))

tidy_data <- final_data %>%
    group_by(Subject, Activity) %>%
    summarise_all(mean)
tidy_data
write.table(tidy_data, "Tidy_Data.txt", row.names = FALSE)
