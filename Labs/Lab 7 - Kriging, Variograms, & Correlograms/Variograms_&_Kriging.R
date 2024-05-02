# Spatial Data Analysis in R
# Lab 6.1: Variograms & Kriging

# HEADS UP: It is highly recommended to use the lecture slides to complete this analysis!

# 0. Load in Packages

require(sf)
require(terra)
require(gstat)
require(spdep)
require(units)
require(ggplot2)
require(wesanderson)

# 1. Load in & Inspect Dataset
ca_cnty  = 
ca_ozone = 
# Ensure matching CRS of ca_cnty & ca_ozone with st_transform()
ca_ozone = 
st_crs(ca_ozone) == st_crs(ca_cnty)

# Calculate the bounding box for plotting
buffer = 2
min_x <- min(st_bbox(ca_cnty)$xmin) - buffer
max_x <- max(st_bbox(ca_cnty)$xmax) + buffer
min_y <- min(st_bbox(ca_cnty)$ymin) - buffer
max_y <- max(st_bbox(ca_cnty)$ymax) + buffer

# Take a look at our data
ggplot() +
  geom_sf(data = ca_cnty, lwd = 0.1, fill = gray(0.5, 0.5)) +
  geom_sf(data = ca_ozone, 
          mapping = aes(colour = AQI),
          size = 2,
          show.legend = "point") +
  coord_sf(xlim = c(min_x, max_x), ylim = c(min_y, max_y), expand = FALSE) +
  scale_color_gradientn(colours = wes_palette("Rushmore1", type = "continuous"), name = "AQI") +
  theme_minimal() +
  ggtitle("CA Annual AQI: 2017 Map")

# 2. Create an Empirical, Exponential, & Spherical Variogram
# 2.1: Create gstat object with AQI as the variable of interest
oz_gs = 

# 2.2: Build an empirical variogram! 
# Note: This is your 'real' variogram, while the exponential and spherical are your 'sample' variograms.
vgm_emp =

# 2.3: Take a look at your unfitted points, what is your best guess on what the nugget and range are? 
# Hint: Look at the first point to determine nugget, and plateau area of range.
# Note: Expected nugget & range at the end of this script, you will need these values for 3.4
plot(vgm_emp, pch = 16, cex = 1.2, main = "AQI Empirical Variogram")

# 2.4: Parameterize initial Exponential & Spherical Variogram
vgm_mod_exp = 

vgm_mod_sph = 

# 2.5: Parameterize initial Exponential & Spherical Variogram
vgm_fit_exp = 
vgm_fit_sph = 

# Plot your Variograms!
plot(vgm_emp, vgm_fit_exp, main = "AQI Exponential Variogram")  
plot(vgm_emp, vgm_fit_sph, main = "AQI Spherical Variogram") 

# 3. Use our Variograms to Krige!
# 3.1 Create a template raster grid for our outputs
temp_rast = rast(ca_cnty, nrow = 200, ncol = 180)

# 3.2: Project temp_rast to match ca_cnty CRS
# Note: Remember the trick from lab 3 to match CRS between terra and sf datasets!
temp_rast = project(temp_rast, st_crs(ca_cnty)$wkt)

# 3.3: Convert the raster to points, and then SF
krige_pts <- as.points(temp_rast)
krige_pts <- st_as_sf(krige_pts)

# Perform an intersection to have krige_pts align with ca_cnty
krige_pts <- st_intersection(krige_pts, ca_cnty)
plot(krige_pts[2])

# 3.4: Krige AQI using the Exponential & Spherical Variograms
AQI_krig_exp = 

AQI_krig_sph = 

# 3.5: Plot your Kriged CA Maps
plot(AQI_krig_exp)
plot(AQI_krig_sph)
