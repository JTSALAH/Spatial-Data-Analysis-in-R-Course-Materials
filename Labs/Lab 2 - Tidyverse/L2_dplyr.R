# Spatial Data Analysis in R
# Lab 2.1: dplyr

# Load dplyr package
require(dplyr)

# View the first few rows of the iris dataset
head(iris)
unique(iris$Species)

# 1. select() - Used to select columns from a dataframe
# Task: Select only the Sepal.Length and Species columns from iris
selected_data <- select()
head(selected_data)

# 2. filter() - Used to filter rows based on a condition
# Task: Filter the iris dataset for species setosa
filtered_data <- filter()
head(filtered_data)

# Task: Filter the iris dataset for Sepal.Width larger than 2.5
filtered_data2 = filter()
head(filtered_data2)

# 3. mutate() - Used to add new columns or modify existing ones
# Task: Adding a new column that shows Sepal.Area (Sepal.Length * Sepal.Width)
mutated_data <- mutate()
head(mutated_data)

# 4. group_by() and summarize() - Used to perform summary operations on grouped data
# Task: Group by Species and calculating average Sepal.Length
grouped_data <- group_by()
grouped_summary <- summarize()
print(grouped_summary)

# 5. inner_join() - Used to merge two dataframes by common columns, keeping only matching rows
# 5.1: Prepare two datasets for join operations
data1 <- select(iris, Species, Sepal.Length)
data2 <- select(iris, Species, Sepal.Width)
# 5.2: Conduct an inner join between the two datasets by Species
inner_joined_data <- inner_join()
head(inner_joined_data)

# Now, let's perform a similar analysis using a string of pipes:
  # 1 Select Sepal.Length and Species, 
  # 2 Filter for species versicolor and setosa, 
  # 3 Add a new column Petal.Area (Petal.Length * Petal.Width), 
  # 4 Group by Species and summarize the average Petal.Area
# Hint: piped_analysis <- iris %>% ...

print(piped_analysis)
