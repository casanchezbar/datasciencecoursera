# Programming Assigment
## Getting and cleaning data 


 The goal in this programming assigment is to get a tidy data that can be used for later analysis. 

 One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
 
 A full description is available at the site where the data was obtained:

   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
   
   
The R script "run_analysis.R" is goin to perform the following tasks:

 * Load the data previously download from:
      https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
      
 * Merge the test and training data 
 
 * For the measurements data we are only interested in the mean and std values
 
 * Transform the activity numeric factors into descriptive names
 
 * Data columns labeled
 
 * A second tidy data set is created, grouped by activity and subject. And each numeric 
   variable is aggregate by its mean value. This result is saved in a file named "assigment_data_results.txt"
   
   
  
The resulting file description is in the CodeBook.md

The resulting file is in assignment_data_results.txt
