# Spatial Data Analysis in R
# Lab 5: Nontrivial Spatial Analysis

# The goal of this lab is to find the closest MBTA stop to each hospital for each unique line on the MBTA. 
# This is important for understanding accessibility to healthcare facilities via public transport.

# 0. Load Packages
require(sf)   
require(dplyr)
require(microbenchmark)
require(profvis)

# 1: Load Hospitals & Public Transport Layers
# MBTA Data: https://www.mass.gov/info-details/massgis-data-mbta-rapid-transit#downloads-
# Hospitals Data: https://www.mass.gov/info-details/massgis-data-acute-care-hospitals#downloads-
mbta_stops <- st_read(here::here('data', 'mbta_rapid_transit','MBTA_NODE.shp'))
hospitals  <- st_read(here::here('data', 'acute_care_hospitals', 'HOSPITALS_PT.shp'))

# Prepare Data - Clip Hospitals to Public Transport Extent
hospitals <- 

# 2: Find Closest MBTA Stop to Each Hospital - Loop Method
# 2.1: Create Custom Function to Calculate Closest Stop
# Custom function to find the closest stop to each hospital for a given LINE
# Note: This function does not aim to do the entire analysis at once,
#       it intends to anchor a basic calculation for a loop or lapply().
find_closest_stop_by_line <- function(hospitals, stops, line) {
  # 1. Subset stops for the current line in the loop

  # 2. Find the nearest stops for all hospitals with st_nearest_feature()

  # 3. Extract the closest stops using output from #2

  # 4. Create a return data frame for this MBTA line with:
  #    hospital NAME, closest STATION, and the station line

}

# 2.2: Initialize an empty data frame for the results
# Note: This should mirror the output dataframe from our custom function
closest_stops_df <- 

# 2.3: Loop through each unique line in the mbta_stops dataset
# Hint: The loop should:
  # 1. Apply the custom function for each line
  # 2. Append the results to our empty data frame


# 3: Apply the function to each hospital using lapply()
# Note: You will need to pass on the additional function arguments to find_closest_stop_by_line
#       This can be done by specifying hospital and stops as parameters of lapply()
#       Example: lapply(X, function, functionparam1 = Y, functionparam2 = Z...)
results_list <- lapply()

# Note: lapply() outputs a list, so we need to use do.call() to output a dataframe
closest_stops_df <- do.call()

# 4. Profile & Benchmark the loop and lapply() methods!
# Question: Which method is faster? Is it by a meaningful amount?




