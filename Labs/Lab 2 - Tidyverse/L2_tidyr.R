# Spatial Data Analysis in R
# Lab 2.2: tidyr

# Load packages
require(tidyr)

# Load L2_tidyr.rda with load()
load()

# 1. pivot_longer() - Used to convert wide data to long
# Problem: Wide format dataset
head(env_data_wide)

# Task: Use pivot_longer to make it more tidy
env_data_long <- pivot_longer()
head(env_data_long)

# 2. pivot_wider() - Used to make long data wide
# Problem: Long format dataset
head(temp_data_long)

# Task: Use pivot_wider to make it tidy
temp_data_wide <- pivot_wider()
head(temp_data_wide)

# 3. separate() - Used to split a column by a character string separator
# Problem: Combined year and season data
head(precip_data_combined)

# Task: Use separate to split YearSeason
# Hint: Year and Season are separated by a "_"
precip_data_tidy <- separate()
head(precip_data_tidy)

# 4. unite() - Used to united multiple columns into a single column
# Problem: Separate columns for year, month, and day
head(precip_data_separate)

# Task: Use unite to combine year, month, and day
precip_data_tidy <- unite()
head(precip_data_tidy)

# Optional Challenge: Notice how env_data_long is still not truly tidy?
#            Use what you've learned to finish the job!
env_data_tidy <- ...
head(env_data_tidy)
