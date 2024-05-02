# Species Distribution Modeling in R - Tutorial

# ---- 0. Load in Packages ----

  require(here)
  require(dismo)
  require(sf)
  require(terra)
  require(tidyverse)

# ---- 1. Prepare Input Layers ----

  # Load in PTS & Subset to meet dismo input requirement
  occ_df = read.csv('data', 'Adelges_tsugae_occ.csv')
  occ_sp = occ_df[, c("Longitude", "Latitude")]
  
  # Read Bioclim Folder Rasters
  bioclim_dir = here::here("data", "bioclim")    # Adjust path accordingly
  bioclim_files = list.files(path = bioclim_dir
                             , pattern = "\\.tif$", full.names = TRUE)
  
  # Convert to RasterStack for dismo::maxent()
  env_rs = raster::stack(bioclim_files)
  
  # Prepare Prediction Extent - Native Range, Japan
  worldbound  = st_read(here::here('data', 
                                   'world-administrative-boundaries', 
                                   'world-administrative-boundaries.shp'))
  japan_bndry = worldbound %>% filter(name == "Japan")
  env_rs_jp   = mask(env_rs, japan_bndry)

# ---- 2. Run Bioclimatic Species Distribution Model ----

  # Run biolcim()
  at_bioclim = bioclim(env_rs, occ_sp)
  
  # Predict Adelges tsugae distribution in Japan
  at_sdm = dismo::predict(at_bioclim, env_rs_jp)
  
  # Convert raster to a dataframe
  at_sdm_df <- as.data.frame(rasterToPoints(at_sdm), stringsAsFactors = FALSE)
  # Basic plot
  ggplot() +
    geom_tile(data = at_sdm_df, aes(x = x, y = y, fill = layer)) +
    coord_fixed(ratio = 1) +  # Preserve aspect ratio
    labs(fill = "Value", x = "Longitude", y = "Latitude", title = "Adelges tsugae Species Distribution Model") +
    scale_fill_viridis_c()


# ---- 3. Run MaxEnt Species Distribution Model ----

  # Run ENMevaluate
  enmeval_results = ENMevaluate(occ_sp, env_rs_jp, 
                                bg = NULL, 
                                tune.args = list(fc = c("L",
                                                        "LQ",
                                                        "H", 
                                                        "LQH", 
                                                        "LQHP", 
                                                        "LQHPT"), 
                                                 rm = 1:5), 
                                partitions = "randomkfold", 
                                partition.settings = list(kfolds = 2), 
                                algorithm = "maxnet", 
                                taxon.name = "Adelges tsugae") 
  
  # Extract results from ENMevaluate
  enmeval_df = enmeval_results@results
  
  # Selecting specified columns
  enmeval_cond <- enmeval_df %>% 
    select(fc, rm, tune.args, AICc, delta.AICc, w.AIC)
  
  
  # Subset the ENMeval results to get the best model
  enmeval_bestm = subset(enmeval_df, delta.AICc == 0)
  
  # Extract the best model values from enmeval_bestm
  maxent_feats = as.character(enmeval_bestm$fc)
  maxent_rm = as.character(enmeval_bestm$rm)
  
  # Run MaxEnt Model!!!
  at_maxent = dismo::maxent(env_rs_jp, as.matrix(occ_sp), 
                            features = maxent_feats, 
                            betamultiplier = maxent_rm)
  
  # Predict Adelges tsugae distribution in Japan
  at_sdm = dismo::predict(at_maxent, env_rs_jp)
  
  # Convert raster to a dataframe
  at_sdm_df <- as.data.frame(rasterToPoints(at_sdm), stringsAsFactors = FALSE)
  # Basic plot
  ggplot() +
    geom_tile(data = at_sdm_df, aes(x = x, y = y, fill = layer)) +
    coord_fixed(ratio = 1) +  # Preserve aspect ratio
    labs(fill = "Value", x = "Longitude", y = "Latitude", title = "Adelges tsugae Species Distribution Model") +
    scale_fill_viridis_c()