# Spatial Data Analysis in R
# Lab 6: Point Pattern Analysis & Envelopes

# Spatial Data Analysis in R
# Lab 6.1: Point Pattern Analytics

require(spatstat)
require(spatstat.data)
require(spdep)
require(sf)
require(here)

# 1. Prepare Data
# 1.1: Load in Data
cactus <- read.csv(here("data", "cactus.csv"))
boundary <- read.csv(here("data", "cactus_boundaries.csv"),header=T)

# 1.2: Create a spatstat object  with our cactus data
# Note: This is typically accomplished by just putting in your sf object to ppp(), but this data is weird...
ppp.window <- owin(xrange=c(boundary$Xmin, boundary$Xmax),
                   yrange=c(boundary$Ymin, boundary$Ymax))
ppp.cactus <- ppp(cactus$East, cactus$North, window=ppp.window)


# 2. Plot raw data and density
par(mfrow = c(1,2), oma=c(0,0,0,1))
plot(ppp.cactus)
plot(density(ppp.cactus,1))  #the 1 alters the smoothing parameter

# 3. Take a look at the data's ppp summary
summary(ppp.cactus)

# 4 - 9 Task: For each subsequent analysis, I want you to interpret the graphs! ****
# 1) What do these results tell you about the data?
# 2) What do the correction graphs tell us (compared to no correction)?

# 4. Create plotting template
ppp_plot = function(fun_name, none, iso, trans) {
  par(mfrow = c(1,4))
  plot(none, main = paste(fun_name, "none"),legend=F)         
  plot(none, . - r~r, main = paste(fun_name, "none"), legend=F)  
  plot(iso, . - r~r, main = paste(fun_name, "iso"), legend=F)
  plot(trans, . - r~r, main = paste(fun_name, "trans"), legend=F)
}

# 5. Ripleys K with various corrections
# 5.0: All lines
Kall <- 

# 5.1: 1:1 expectation (no correction)
Knone <- 

# 5.2: Isotropic edge correction
Kiso <- 

# 5.3: Translate (toroidal) edge correction
Ktrans <- 

# 5.4: Plot!
ppp_plot("K", Knone, Kiso, Ktrans)

# 6. L with various corrections
# 6.1: 1:1 expectation (no correction)
Lnone <-

# 6.2: Isotropic edge correction
Liso <- 

# 6.3: Translate (toroidal) edge correction
Ltrans <- 

# 6.4: Plot!
ppp_plot("L", Lnone, Liso, Ltrans)

# 7. Pair correlation function, g, with various corrections
# 7.1: 1:1 expectation (no correction)
Pnone <- 

# 7.2: Isotropic edge correction
Piso <- 

# 7.3: Translate (toroidal) edge correction
Ptrans <-

# 7.4: Plot!
par(mfrow = c(1,3))
plot(Pnone, main = "Pnone",legend=F, ylim=c(0,3))         
plot(Piso, main = "Piso", legend=F, ylim=c(0,3))
plot(Ptrans, main = "Ptrans", legend=F, ylim=c(0,3))

# 8. Basic G function
# Note: G & F don't have an isometric or trans correction, but they have similar corrections.
# Let's try some of the new ones.
# 8.1: 1:1 expectation (no correction)
Gnone <-

# 8.2: Reduced sample or border correction
Grs <- 

# 8.3: Best (determines best correction for dataset)
Gbest = 

# 8.4: Plot!
par(mfrow = c(1,3))
plot(Gnone, main = "Gnone",legend=F)         
plot(Grs, main = "Grs", legend=F)
plot(Gbest, main = "Gbest", legend=F)

# 9. Basic F function
# 9.1: 1:1 expectation (no correction)
Fnone <-

# 9.2: Reduced sample or border correction
Frs <- 

# 9.3: Best (determines best correction for dataset)
Fbest =

# 9.4: Plot!
par(mfrow = c(1,3))
plot(Fnone, main = "Fnone",legend=F)         
plot(Frs, main = "Frs", legend=F)
plot(Fbest, main = "Fbest", legend=F)

# ---- ppp_envelopes ----

# You will want to look at the slides for this part especially!

# 1. Create a Lest envelope of global and pointwise confidence under CSR with 99 simulations
# 1.1: Create a global & pointwise (non-global) Envelope
# Hint: Use the global= parameter!
Lcsr   <- 
Lcsr.g <- 

# 1.2: Plot point-wise envelope
plot(Lcsr, . - r~r, shade=c("hi", "lo"), legend=F)

# 1.3: Plot global envelope
plot(Lcsr.g, . - r~r, shade=c("hi", "lo"), legend=F)

# 2. Create a pcf simulated envelope of pointwise confidence under CSR
# 2.1: Create a fine envelope
# Hint: stoyan = 0.15
Penv <- 

# 2.2: Create a coarse envelope
# Hint: stoyan = 0.3
Penv.coarse <- 

# 2.3: Plot!
# 2.3.1: Plot no-envelope Ptrans
plot(Ptrans, legend=FALSE, ylim = c(0,3))

# 2.3.2: Plot our fine envelope
plot(Penv, shade=c("hi", "lo"), legend=FALSE, ylim = c(0,3))

# 2.3.3: Plot our coarse envelope
plot(Penv.coarse, shade=c("hi", "lo"), legend=F, ylim = c(0,3))

# Question: How do the fine vs. coarse envelopes differ?

# 3. Create a Gest envelope of pointwise confidence under CSR with 99 simulations
# 3.2: Create a pointwise Gest envelope
Genv <- 

# 3.3: Create a nearest neighbor distance variable for our plot
nn.dist <- nndist(ppp.cactus)
max(nn.dist)

# 3.4: Plot our trans G
plot(Gtrans, legend=F)

# 3.5: Plot G with our pointwise envelope & nearest neighbor distances
plot(Genv, shade=c("hi", "lo"), legend=F)
plot(ecdf(nn.dist), add=T)

# 4. Mark-Correlation Analysis Demo
data(spruces)

# 4.1: Create an envelope for spruces
MCFenv <- envelope(spruces, markcorr, nsim=99, correction="iso", global=F)

# 4.2: Plot envelope
plot(MCFenv,  shade=c("hi", "lo"), legend=F)
