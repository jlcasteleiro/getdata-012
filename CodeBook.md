# Explanation for the <run_analysis.R>

The script is programed to use inside the directory in which the "*.zip" with the data was unzip. This directory should be the working directory.
The script enter in the especific directory to read the files and at finally it returns itself to the original working directory.

The original features and activities was read from the original files and store in as a variable in the case of, for a future upgrade of the script, anyone want to now the name of the features (and activities).

The transformations in the data to achieve the tidy data required are only the merge of all data (Train and Test), extract the  mean() and std() for each feature, and calculate the average for each subject and data.

The script working as follow to achieve the tidy data:
1- Read the Train data
2- Read the subjects and activities data from the Train data
3- Build a Train_dataset with the Train, the subjects and the activity data
4- Read the Test data
5- Read the subjects and activities data from the Test data
6- Build a Test_dataset with the Test, the subjects and the activity data
7- Combine the two dataset in only one (the subjects and activities is included before to have this variables asociated to each data)
8- Extract only the features that is important for the tidy data (the mean() and std() of each features, also the subjects and activities)
9- The tidy data is build by extracting the data for each subject in each activity, and calculating the average for each subset
10- Finally, the variable with the tidy data is reanamed and stored in a file

The variables created by the script are:
- Project_Dataset_Q5 - The tidy data that the project ask for in the step 5
- Project_Dataset_Q4 - The Dataset with only the mean() and std() of each feature
- Dataset - The complete dataset combining the Train and the Test data
- Train_dataset (Test_dataset) - The Train (Test) dataset with the subjects and activities
- Train_subjects (Test_subjects) - The info for the Train (Test) data subjects
- Train_actitivies (Test_activities) - The info for the Train (Test) data activities
- Train_data (Test_data) - The original Train (Test) data
- actitivies - The names for each activity
- features - The names for each feature
- Base_wd - The working directory in which the folders with Train and Test data are unzip
- Last_wd - The original working directory
