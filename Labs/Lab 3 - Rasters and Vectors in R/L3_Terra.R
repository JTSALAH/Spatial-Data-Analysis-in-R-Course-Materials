# Spatial Data Analysis in R
# Lab 3.4: Terra Basics

# 0: Ensure the terra package is installed
require(tidyverse)
require(terra)
require(sf)

# Exercise 1: Read nlcd raster
nlcd <- rast()
plot(nlcd)

# Exercise 2: Spatial Operations & Projections
# 2.1: Read Clip/Mask Polygon of Massachusetts Counties
poly <- st_read()

# 2.2: Filter poly to only contain HAMPSHIRE county from the COUNTY column
hampshire_county <- 

# 2.3: Reproject the nlcd data to NAD83, which is the CRS of hampshire_county 
# Note: You cannot directly use the st_crs() output to project with terra.
#       st_cr() outputs a list which terra does not understand, so you
#       must use st_crs(hampshire_county)$wkt to subset the main details.
# Another Note: Remember, we don't want to interpolate, so set your method accordingly.
nlcd_nad83 <- project()

# Note the differences in output when clipping using crop() vs. mask()
# Crop the nlcd data
cropped_nlcd <- 
plot(cropped_nlcd)

# Mask the nlcd data
masked_nlcd <- 
plot(masked_nlcd)

# Exercise 4: Extract Calculated nlcd Values to Points
# 4.1: Bring in the Massachusetts clipped points_sf from Lab 3.2: Simple Features (SF)

# 4.2: Ensure points_sf has same CRS to hampshire_county & nlcd_nad83
points_nad83_sf <- st_transform()

# 4.3: Clip newly transformed points_
points_nad83_sf <- 

# 4.3: Extract Values to Points
# Note: Ensure you specifically call terra when using extract (terra::extract())
extracted_values <- terra::extract()

# 4.4: Append the extracted values to the points data
points_nad83_sf$nlcd_val <- extracted_values[,2]
