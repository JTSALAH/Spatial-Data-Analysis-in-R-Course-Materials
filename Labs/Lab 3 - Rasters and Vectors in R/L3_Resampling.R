# Spatial Data Analysis in R
# Lab 3.3: Resampling Raster Resolutions

# 0: Load Packages
require(terra)
set.seed(15) # This will make the rpois consistent!

# 0: Create a SpatRaster in terra
raster <- rast(ncol=6, nrow=6, xmin=1, xmax=6, ymin=1, ymax=6)
values(raster) <- rpois(ncell(raster), lambda=3)

# Plot raster
plot(raster, axes=FALSE)
text(raster, digits=2)

# Exercise 1: Inspect your raster
# Determine number of cells in the raster


# Return a summary of the raster


# Exercise 2: Increase the grain of our raster & calculate statistics
# 2.1: Increase the grain by a factor of 2 with the function as mean and modal separately.
raster_mean <-  # mean value
raster_maj  <-  # majority rule

# 2.2: Plot mean rule
plot(raster_mean)
text(raster_mean, digits=1)

# 2.3: Plot majority rule
plot(raster_maj)
text(raster_maj)

# 2.4: Contrast means and variances of mean vs majority rule using global()
# 2.4.1: Use global() on original raster
global() # same as global(raster_mean, mean)
global()
# 2.4.2: Use global() on raster_mean
global()
# 2.4.3: Use global() on raster_maj
global()
global()

# Question 1: What do you notice about the difference in
#             mean/var from the different methods?

# Exercise 3: Decrease the grain of our raster
# 3.1: Decrease grain of our raster with nearest & bilinear interpolation
raster_neardis2  <- 
raster_bilindis2 <- 

# Plot Nearest Resample
plot(raster_neardis2, axes=FALSE, box=FALSE)
plot(as.polygons(raster_neardis2), add=TRUE, border='gray50', lwd=1)
text(raster_neardis2, cex=0.9)

# Plot Bilinear Resample
plot(raster_bilindis2, axes=FALSE, box=FALSE)
plot(as.polygons(raster_bilindis2), add=TRUE, border='gray50', lwd=1)
text(raster_bilindis2, cex=0.9)

# Question 2: What looks different between the nearest and bilinear resample?

# Exercise 4: Do a raster calculations of your interest with app()
calc_raster <- 
plot(calc_raster)