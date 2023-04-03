library(lidR)
library(rlang)
library(raster)
library(dplyr)
library(sf)

# Set local drive
setwd("C:/Users/Pachama")

#Load LiDAR data file
las <- readLAS("ANAA01_L0002C0002.las")

#Load inventory sample shape files
geom_zone1 <- st_read("inventory_geometry_0.shp") #Zone 8
geom_zone2 <- st_read("inventory_geometry_1.shp") #Zone 18
geom_zone3 <- st_read("inventory_geometry_2.shp") #Zone 22


chm_generator <- function(las_file, geometry, res, zone_name){
 
   # Clip LiDAR data to coordinates or interest
  las <- las_file %>% lidR::clip_roi(geometry = geometry)
  
  # Nomalize the digital terrain height
  nlas = lidR::normalize_height(las,tin())
  
  # Create Canopy Height Model (CHM) for clipped coordinates
  chm <- raster::raster(rasterize_canopy(nlas, res = res,
                                         algorithm = p2r(0.2)))
  # Define file name
  chm_name <- paste0("CHM_", zone_name, ".tif")
  
  #Write Raster file into local drive
  writeRaster(chm,chm_name, options=c('TFW=YES'))
}
 
# Generate .tiff files and save in local drive
chm_generator(las_file = las, geometry = geom_zone1, res = 0.5, zone_name = "8")
chm_generator(las_file = las, geometry = geom_zone2, res = 0.5, zone_name = "18")
chm_generator(las_file = las, geometry = geom_zone3, res = 0.5, zone_name = "22")
