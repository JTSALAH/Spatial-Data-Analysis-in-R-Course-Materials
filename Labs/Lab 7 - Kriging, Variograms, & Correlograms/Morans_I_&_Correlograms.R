# Spatial Data Analysis in R
# Lab 6.2: Moran's I & Correlograms

# HEADS UP: It is highly recommended to use the lecture slides to complete this analysis!

# 0. Load in Packages

require(sf)
require(terra)
require(gstat)
require(spdep)
require(units)
require(ggplot2)

# 1. Load in Dataset
ca_cnty  = 
ca_ozone = 
# Ensure matching CRS of ca_cnty & ca_ozone with st_transform()
ca_ozone = 
st_crs(ca_ozone) == st_crs(ca_cnty)

# 2. Inspect the residual error of ozone & AQI
# Background: A linear model is a predicted fit of values based on some data.
#             A residual error is the difference between the expected value (prediction), and the actual values observed.
#             We are interested in this residual error to account for it in our correlogram.
# 2.1: Create your linear model with lm()
aqi_lm = lm(ozone ~ AQI, data = ca_ozone)

# 2.2: Inspect the residuals by looking at the fitted residuals & QQPlot
par(mfrow = c(1,2))
plot(aqi_lm, which = 1)
plot(aqi_lm, which = 2)

# 2.3: Extract residuals to ca_ozone from the model fit!
# Note: We will use this later...
ca_ozone$resids = residuals(aqi_lm)

# 3. ## Moran's Residuals Correlogram
# 3.1: Determine Maximum & Minimum Distances between California Ozone points
distmat_ca = 
# Since CA is an elongated shape, use 1/2 the max distance
maxdist_ca = 
mindist_ca = 

# 3.2: Make a sequence of 10 distance classes between the min and max distances: 
# This is setting bins for the correlogram, which are the distance classes!
n_dist_class = 10
ca_nb_dists = # create bins for correlogram here

# 3.3: Calculate Euclidean distance between neighbors
# dnearneigh() : Identifies neighbors of region points by Euclidean distance.
# Note: d1 and d2 need to be numeric, not units like ca_nb_dists is


# 3.4: Make a weights object using our euclidean distances
# nb2listw() : Supplements a neighbors list with spatial weights 


# 3.5: Create a Moran's I test with normal approximation versus Monte Carlo (999 reps) permutation test
# 3.5.1: Create a Moran's I Normal Distribution Test
mor_norm_ca = 
  
# 3.5.2: Create a Moran's I test with 999 Monte Carlo Repetitions
# Hint: Take a look at the moran.mc() function
mor_mc_ca = 

# 4. Generate a Distance Correlogram
# 4.1: Call in Correlogram_Function.R using source('path/to/Correlogram_Function.R')
# Hint: Open Correlogram_Function.R and look at what parameter inputs you need for 4.2 & 5.1!

  
# 4.2: Run calculate_morans_i()
ca_correlog_oz <- calculate_morans_i()

# 4.3: Plot Distance Correlogram
ggplot(ca_correlog_oz) +
  geom_smooth(aes(x = dist, y = Morans.i), se = FALSE) +
  geom_point(aes(x = dist, y = Morans.i)) +
  geom_ribbon(aes(
    x = dist,
    ymin = Null.lcl,
    ymax = Null.ucl),
    fill = adjustcolor("steelblue", 0.2)) +
  ggtitle("SPDEP CA Ozone Correlogram")

# 5.Generate a Residual Correlogram
# 5.1: Run calculate_morans_i() with variable_name = "resids"
ca_resid_correlog_oz <- calculate_morans_i()

# 5.2: Plot Residual Correlogram
ggplot(ca_resid_correlog_oz) +
  geom_smooth(aes(x = dist, y = Morans.i), se = FALSE) +
  geom_point(aes(x = dist, y = Morans.i)) +
  geom_ribbon(aes(
    x = dist,
    ymin = Null.lcl,
    ymax = Null.ucl),
    fill = adjustcolor("steelblue", 0.2)) +
  ggtitle("SPDEP CA Residual Correlogram")

# Use the lecture slides to confirm that your results are correct!
