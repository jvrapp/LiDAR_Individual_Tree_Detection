# LiDAR for Individual Tree Detection

> Approximate time invested (from research to implementation): 45 hours 

&nbsp;

This data science pet project aims to utilize LiDAR data to identify and count individual trees in the ANA_A01 region of the Amazonian rainforest. The Popescu Local Filtering with Fixed Window Size algorithm will be implemented using Python.

### **Pet Project Objectives:**

1. "Hello world" for LiDAR data and forestry projects.
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

3. [GeoJSON](https://www.paisagenslidar.cnptia.embrapa.br/geoserver/wfs?srsName=EPSG%3A4326&typename=geonode%3Aana_a01_2018_plot_location&outputFormat=json&version=1.0.0&service=WFS&request=GetFeature&access_token=76f1f406d2ad11edb93d00163e1134a6) file containing the locations where tree data was gathered - The tree inventory was **NOT** conducted across the entire ANA_A01 region. Instead, data was collected from 32 sampled locations. The corresponding polygons are contained within this file. 

&nbsp;

### **Procedure Description (summary):**

1. Academic literature research: 
    
    As a self taught project, the first step was to conduct a thorough academic literature and software tools research on Individual Tree Detection (ITD) algorithms. 

2. Data Understanding:

    * _Inventory data:_   Count the number of inventoried trees and understand the recorded properties. Look for proportion correlations between height and crown width.
    * _LAS data:_ Understand the contained information besides the datapoint cloud (metadata), and comprehend the coordinate system used.

3. Canopy height Model (CHM) generation with `LidR`:
    * Load `.las` and `.shp` files to clip the coordinates of the designated locations, with the function `clip_roi`.
    * Height normalization: Normalize the digital terrain height by applying the  `tin` algorithm. 
    * CHM generation: Apply the `raster_canopy` over the nomalized digital terrain model, using the `Point2Raster` algorithm. 

4. Local Maxima with Fixed Window Size application:
    * Prepare data by loading the `.tif` file and clipped Gound Truth data for further evaluation. 
    * Apply functions (listed here some just of the main): 
        1. CHM smoothening with `ndimage.median_filter`
        2. Kernel generation with NumPy `np.ogrid` or `np.ones`
        3. Local maxima filter with `ndimage.maximum_filter`
    * Fine tune parameters, specifically _window sizes_ for smoothening and filtering to obtain better results.

5. Individual Tree Detection Evaluation:
    * Try to evaluate LM performance by applying the GeoPandas `.buffer()` over Ground Truth trees, then using the `.within()` function to check if detected trees are inside the Ground Truth buffered area.
    * Manual evaluation: Plot the results of Detected Trees against Ground Truth Trees and manually evaluate the accuracy.


### **Relevant Inisghts & Considerations:**

1. **No linear correlation between tree height and crown width to be taken:**
Despite looking for a linear model fitted for a variable window size model, the Amazon Rainforest has such a great species variety that it was not possible to use the coefficients without oversimplifying, therefore facilitating misleading results.

    The lack of a strong correlation is portrayed in the next graph:

<p align="center">
<img src=https://github.com/jvrapp/LiDAR_Individual_Tree_Detection/blob/main/images/Correlation-height-crown.png width="400" height="400">
</p>

2. R made CHM's were generated with a 0.5 resolution, giving `.tif` file similar to the next one. 

<p align="center">
<img src=https://github.com/jvrapp/LiDAR_Individual_Tree_Detection/blob/main/images/R_CHM.jpg width="400" height="400">
</p>

3. Within the ANA_A01 region there were multiple sampling locations for inventory data; still, for the purposes of this pet project, **just 3 sampling areas were selected to work with**, as shown below:

<p align="center">
<img src=https://github.com/jvrapp/LiDAR_Individual_Tree_Detection/blob/main/images/Samped_locations.png width="450" height="550">
</p>

### **Results**:

Explicar el show de densidad y geometría

| Zone      | Ground Truth # trees | LM correct trees| Overall Accuracy|
| --------- | :-----------------:  | :------------:  | :------------:  |
| 8         | 130                  | 33              | 25.38%          |
| 18        | 110                  | 19              | 17.27%          |
| 22        | 84                   | 20              | 23.81%          |


## Conclusions & Next Steps: