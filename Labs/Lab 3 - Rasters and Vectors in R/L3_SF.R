# Spatial Data Analysis in R
# Lab 3.2: Simple Features (SF)

# 0: Install and load the sf package
library(sf)
library(ggplot2)
library(leaflet)

# Exercise 1: Loading Data
# 1.1: Load Adelges_tsugae.csv with point data, and create an sf object from it
csv_data    <- read.csv()
points_sf   <- 

# 1.2: Load in Massachusetts state polygon shapefile (OUTLINE25K_POLY.shp)
polygon_sf  <- 

# 1.3: Load in the "EOTMAJROADS_RTE_MAJOR" layer from the MassDOT_Roads GDB
massdot_gdb <- here::here()
gdb_layers  <- st_layers()
gdb_layers
line_sf     <- 

# Exercise 2: Working with Projections
# 2.1: Identify points_sf projection
pts_crs <- st_crs()

# 2.2: Reproject MassGIS layers (polygon & line) to points_sf CRS
polygon_sf  <- 
line_sf     <- 

# 2.3: Assure matching projection with logical ==


# Exercise 3: Spatial Operations - Clips and Buffers
# Note: Some of these might take a while depending on your computer!
# 3.1: Ensure Valid Polygon with st_is_valid() & st_make_valid()
polygon_sf_valid <- 

# 3.2: Clip points using our polygon
clip_result <- st_intersection()
ggplot() +
  geom_sf(data = polygon_sf_valid, # Adjust name to match Mass Polygon object if necessary 
          fill = "lightblue", color = "darkblue") +
  geom_sf(data = clip_result, 
          fill = "red", alpha = 0.5) + 
  theme_minimal()

# 3.3: Buffer our clipped points to represent a larger region (600m diameter)
# Note: dist parameter is your radius
buffer_result <- st_buffer()
buffer_map <- leaflet() %>%
  addTiles() %>%
  addPolygons(data = buffer_result,
              fillOpacity = 0.3, # Set fill opacity
              color = "red",     # Border color
              weight = 1)        # Border thickness
buffer_map

# Exercise 4: Find a function of your interest and apply it to one or more of these datasets!
# Take a look at the sf reference manual, it shows you all the functions and how to use them :)
# https://cran.r-project.org/web/packages/sf/sf.pdf
