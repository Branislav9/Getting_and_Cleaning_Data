# Code Book

This is a code book that describes the variables, the data, and transformation of raw data to clean data. 
Raw data are coming from Human Activity Recognition database built from the recordings of 30 subjects 
performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial 
sensors [1].

## Raw Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments 
have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two 
sets, where 70% of the volunteers was selected for generating the training data and 30% the test data [2]. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled 
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore 
a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating 
variables from the time and frequency domain [2]. 

**The dataset includes the following files [2]:**

* 'README.txt'

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

**The following files are available for the train and test data. Their descriptions are equivalent [2]:**

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 
   Its range is from 1 to 30. 

* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis 
   in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 
  'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity 
   from the total acceleration. 

* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each 
   window sample. The units are radians/second.

## Transformation and Variables

The raw data sets are processed with run_analisys.R script to create a tidy data set. Before Transformation raw data 
about test and training are read into following variables:

* X_train: Training set data
* Y_train: Training labels data
* Sub_train: Data about subject who performed activity in training
* X_test: Test set data
* Y_test: Test labels data
* Sub_test: Data about subject who performed activity in test
* var_names: List of all features
* activity_labels: Links the class labels with their activity name.

### Step 1: Merge the training and the test sets to create one data set.

Read data are merged and stored in a new variables:

* X_set: Training and Test set data
* Y_set: Training and Test labels data
* Sub_set: Training and Test data about subject who performed activity

### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

All measurements from raw data related to mean and standard deviation are extracted and stored in following variables:

* extracted_var: extraction of columns with mean and standard deviation
* X_set: ovewrites merged data to contain only extracted data 

### Step 3: Uses descriptive activity names to name the activities in the data set.

Renaming of column containing acitivity data and naming of activities in activity data set variable:

* acitivity: labels data named according to activity.

### Step 4: Appropriately labels the data set with descriptive variable names.

For data stored in variable X_set were read data from variable extracted_var which contain descriptive names. Label 
in Sub_set variable was renamed.

### From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
### for each activity and each subject.

Tidy data set was created and a set of data containing mean for each variable for each activity and each subject and stored
in following variables:

* tidydata: tidy data with all measurements
* tidydata_mean: tidy data containing only means

## References

[1] URL: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]. Accessed 06/17/2017

[2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition 
    on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
    Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012