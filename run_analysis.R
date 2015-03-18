## run_analysis.R
## -> Script to perform the project of the "Getting and cleaning data" course

# The script should be in a folder where the data from the course was unzip,
# and this folder should be the Working Directory (the unzip action should
# generate a folder)

# 1- Change to the apropiate Working Directory
Last_wd <- getwd() # This instruction allow to return to the original wd
setwd("./UCI HAR Dataset")
Base_wd <- getwd() # In this directory should be the test and train directory

# 2- Store the features and the activities names
features <- readLines("features.txt")
activities <- readLines("activity_labels.txt")

# 3- Load the Train Data
setwd("./train")
Train_data <- read.table("X_train.txt")
#Train_data <- read.table("X_train.txt",nrows=30)
Train_activities <- read.table("y_train.txt")
#Train_activities <- read.table("y_train.txt",nrows=30)
Train_subjects <- read.table("subject_train.txt")
#Train_subjects <- read.table("subject_train.txt",nrows=30)
Train_dataset <- data.frame(Train_data,Train_subjects,Train_activities)
names(Train_dataset) <- c(features,"562 Subject","563 Activity")

# 4- Load the Test Data
setwd(Base_wd)
setwd("./test")
Test_data <- read.table("X_test.txt")
#Test_data <- read.table("X_test.txt",nrows=30)
Test_activities <- read.table("y_test.txt")
#Test_activities <- read.table("y_test.txt",nrows=30)
Test_subjects <- read.table("subject_test.txt")
#Test_subjects <- read.table("subject_test.txt",nrows=30)
Test_dataset <- data.frame(Test_data,Test_subjects,Test_activities)
names(Test_dataset) <- c(features,"562 Subject","563 Activity")

# 5- Onces the Data has been loaded, it will be combined in only one variable
Dataset <- rbind(Train_dataset,Test_dataset)

# 6- The values to extrac is the mean() and std(), then, it is necesary to find
# the correct columns in the "features.txt" file
Columns_mean_std <- c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 82, 83, 84, 85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163, 164, 165, 166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266, 267, 268, 345, 346, 347, 348, 349, 350, 424, 425, 426, 427, 428, 429, 503, 504, 516, 517, 529, 530, 542, 543, 562, 563)
Project_Dataset_Q4 <- Dataset[,Columns_mean_std]

# 7- To calculate the average for each Activity and Subject, it is neccesary to
# make groups in the Data depending of the Subject and the Activity
for (i in 1:max(Project_Dataset_Q4[,65])){
    for (j in 1:max(Project_Dataset_Q4[,64])){
        if (i==1 & j==1){
            Project_Dataset_Q5 <- apply(Project_Dataset_Q4[Project_Dataset_Q4[,64]==j & Project_Dataset_Q4[,65]==i,],2,mean)
            next
        }
        Project_Dataset_Q5 <- rbind(Project_Dataset_Q5,apply(Project_Dataset_Q4[Project_Dataset_Q4[,64]==j & Project_Dataset_Q4[,65]==i,],2,mean),deparse.level= 1 )
    }
}

# 8- Finally, as the functions used in the previous step, stored the data in a
# "matrix" class, the necesary steps to re-class the variable will be perform
rownames(Project_Dataset_Q5) <- NULL
Project_Dataset_Q5 <- data.frame(Project_Dataset_Q5)
names(Project_Dataset_Q5) <- names(Project_Dataset_Q4)

# 9- Return to the original Working Directory
setwd(Last_wd)

# 10- Save the file to upload in the Coursera webpage
write.table(Project_Dataset_Q5, file = "Project_getdata-012_Casteleiro.txt", row.name = FALSE)
