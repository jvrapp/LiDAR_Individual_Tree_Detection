# LiDAR for Individual Tree Detection

> Approximate time invested (from research to implementation): 45 hours 

&nbsp;

This data science pet project aims to utilize LiDAR data to identify and count individual trees in the ANA_A01 region of the Amazonian rainforest. The Popescu Local Filtering with Fixed Window Size algorithm will be implemented using Python.

### **Pet Project Objectives:**

1. "Hello world" for LiDAR tree detection.
2. Learn LiDAR/Raster data handling and the use of coordinate systems.
3. Use GeoPandas and Rasterio for data manipulation


### **Data Description:**

The data used for this project was provided by the Sustainable Landscapes GeoNetwork Catalog. The contained files are the following:
1. [2018 LiDAR data](https://www.paisagenslidar.cnptia.embrapa.br/geonetwork/srv/por/catalog.search#/metadata/5119e5aa-ab6a-4bb8-a4b4-a3eff77fe564) collection for ANA_A01 region.

    *  **Filename:** ANAA01_L0002C0002.las / ANA_A01_2018_LAS_6.laz
    *  **Latitude range:** 721917.4 - 721917.4
    *  **Longitude range:** 9627871 - 9628871
    *  **CRS:** EPSG-32721
    *  **Density:** 28.85 points/units²

2. [2018 Tree inventory](https://www.paisagenslidar.cnptia.embrapa.br/geonetwork/srv/spa/catalog.search#/metadata/44d96974-77b0-4e22-9fce-79609604bfd3) for ANA_A01 region **(Ground Truth)**.

    * CSV file with individual information for the trees in inventory (years 2015 and 2018).
    * Variables of interest:
         * `htot` - Total height of trees in inventory.
         * `RN`, `RS`, `RE`, `RW` - Crown radius measured from the tree log to North, South, East and West.
         * `2015-18.dead` - Trees labeled as dead in 2015 and 2018 inventory.
         * `UTM. Easting & Northing` - UTM Latitude and Longitude coordinates of each tree in inventory.

3. [GeoJSON](https://www.paisagenslidar.cnptia.embrapa.br/geoserver/wfs?srsName=EPSG%3A4326&typename=geonode%3Aana_a01_2018_plot_location&outputFormat=json&version=1.0.0&service=WFS&request=GetFeature&access_token=76f1f406d2ad11edb93d00163e1134a6) file containing the locations where tree data was gathered - The tree inventory was NOT conducted across the entire ANA_A01 region. Instead, data was collected from 32 sampled locations. The corresponding polygons are contained within this file. 

&nbsp;

### **Procedure Description (summary):**

1. Academic literature (Drive folder with papers) - Explain self taught
2. Data Understanding:
    * Inventory data
    * LAS data
3. Canopy height Model (CHM) generation:
    * Load and clip
    * Height normalization
    * Point to raster 
4. Local Maxima with Fixed Window Size application:
    * Prepare data
    * Apply functions
    * Fine tune parameters
5. Individual Tree Detection Evaluation


### **Relevant Inisghts:**

1. No linear correlation to be taken
2. R made CHM's
3. Sampled inventory data


### **Results**:

Explicar el show de densidad y geometría

| Zone      | Ground Truth # trees | LM correct trees| Overall Accuracy|
| ----------- | :----:  | :----:  | :----:  |
| 8     | 130       | 33 | 25.38%
| 18   | 19        | 110| 17.27%
| 22  | 20       | 84 | 23.81%





![Ejemplo CV 2](/img/Ejemplo_Cv_2.jpg "Ejemplo CV 2")

## Conclusions & Next Steps: