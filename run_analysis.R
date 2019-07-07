##########################################################################################
######################### Getting and Cleaning Data Project ##############################
##########################################################################################
library(dplyr)
library(data.table)
################################ IMPORTING DATASETS ######################################

####### NAMES DATASETS ########
feature.names <- read.table("Project/UCI HAR Dataset/features.txt",header=FALSE,
                            sep="",dec=".")
activity.names <- read.table("Project/UCI HAR Dataset/activity_labels.txt",header = FALSE,
                             sep="",dec=".")

####### TRAINING DATASET ########
# Importing data
train.data <- read.table("Project/UCI HAR Dataset/train/X_train.txt",header=FALSE,
                         sep = "",dec=".")
train.subject<- read.table("Project/UCI HAR Dataset/train/subject_train.txt",header=FALSE,
                           sep="",dec=".")
activity <- read.table("Project/UCI HAR Dataset/train/y_train.txt",header=FALSE,
                       sep="",dec=".",colClasses = "factor")
activity <- factor(activity$V1,
                   levels = activity.names[,1],
                   labels = activity.names[,2])
# Naming variables and data
names(train.data) <- feature.names$V2
names(train.subject) <- "subject"
# Complete dataset: trainning
train.complete <- cbind(train.subject,activity,train.data)

# Drop not complete bases
rm(train.data,activity,train.subject)


####### TESTING DATASET ########

# Import data
test.data <- read.table("Project/UCI HAR Dataset/test/X_test.txt",header=FALSE,
                        sep="",dec=".")
test.subject <- read.table("Project/UCI HAR Dataset/test/subject_test.txt",header = FALSE,
                           sep = "",dec = ".")
activity <- read.table("Project/UCI HAR Dataset/test/y_test.txt",header = FALSE,
                       sep = "",dec=".",colClasses = "factor")
activity <- factor(activity$V1,
                   levels = activity.names[,1],
                   labels = activity.names[,2])
# Naming variables and data
names(test.data) <- feature.names$V2
names(test.subject) <- "subject"
# Complete datasets: testing
test.complete <- cbind(test.subject,activity,test.data)

# Drop not complete bases
rm(test.data,activity,test.subject,activity.names)

################################ MERGING DATASETS ######################################
DS_complete <- rbind.data.frame(train.complete,test.complete)

############################ EXTRACT INTEREST VARIABLES ################################
colselect.indicator <- grep("mean|std",feature.names$V2)+2
newDataset <- as.data.table(DS_complete[,c(1,2,colselect.indicator)])
rm(DS_complete,feature.names,test.complete,train.complete)
################################ FINAL TIDY DATASET ####################################
library(dplyr)
Tidy_ds <-newDataset %>% group_by(subject,activity) %>% summarize_all(.funs = mean)

################################# SAVING DATASET #######################################
save(Tidy_ds,file = "Project/Tidy_dataset.RData")
write.csv(Tidy_ds,"Project/Tidy_dataset.csv")

