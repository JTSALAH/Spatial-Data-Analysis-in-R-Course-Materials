# Spatial Data Analysis in R
# Lab 1.2: Read CSV

# Ensure the 'here' and 'dplyr' packages are installed
install.packages("here")
install.packages("dplyr")

# Load the necessary libraries
library(here)
library(dplyr)

# Load the iris dataset
iris_data <- 

# Subset iris_data to contain rows 1 through 5 using a []
subset_rows <- iris_data[]
print(subset_rows)

# Subset iris_data to contain only the Sepal.Length column using a []
subset_columns <- iris_data[]
print(subset_columns)

# Subset iris_data to contain rows 1 through 5 from the Sepal.Length column using a []
subset_rows_columns <- iris_data[]
print(subset_rows_columns)

# Subset the Sepal.Length and Sepal.Width columns using a []
subset_many_columns <- iris_data[]
print(subset_many_columns)

# Subset only the Sepal.Length column using a $
sepal_length <- 
print(sepal_length)
