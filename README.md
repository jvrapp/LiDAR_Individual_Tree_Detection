# LiDAR Individual Tree Detection

> Approximate time invested 45 hours (from research to implementation)

This data science pet project utilizes LiDAR data to identify and count individual trees in the ANA_A01 region of the Amazonian rainforest, using Python to implement Popescu Local Filtering with Fixed Window Size algorithm.

&nbsp;

### **Pet Project Objectives:**

1. "Hello world" for LiDAR tree detection
2. Learn LiDAR and Raster data handling and coordinate systems
3. Use GeoPandas and Rasterio for data manipulation

&nbsp;

### **Data Description:**

The data used for this project was provided by the Sustainable Landscapes GeoNetwork Catalog. The contained files are the following:
1. [2018 LiDAR data](https://www.paisagenslidar.cnptia.embrapa.br/geonetwork/srv/por/catalog.search#/metadata/5119e5aa-ab6a-4bb8-a4b4-a3eff77fe564) collection for ANA_A01 region.

    *  **Filename:** ANAA01_L0002C0002.las / ANA_A01_2018_LAS_6.laz
    *  **Latitude:** 721917.4 - 721917.4
    *  **Longitude:** 9627871 - 9628871
    *  **CRS:** EPSG-32721
    *  **Density:** 28.85 points/units²

2. [2018 Tree inventory](https://www.paisagenslidar.cnptia.embrapa.br/geonetwork/srv/spa/catalog.search#/metadata/44d96974-77b0-4e22-9fce-79609604bfd3) for ANA_A01 region **(Ground Truth)**.

    * Descripción rápida
    * Variables of interest:
         * `htot`
         * `RN`, `RS`, `RE`, `RW`: 
         * `2015-18.dead`
         * `UTM. Easting & Northing`: 

3. [GeoJSON](https://www.paisagenslidar.cnptia.embrapa.br/geoserver/wfs?srsName=EPSG%3A4326&typename=geonode%3Aana_a01_2018_plot_location&outputFormat=json&version=1.0.0&service=WFS&request=GetFeature&access_token=76f1f406d2ad11edb93d00163e1134a6) of sampled locations for tree data gathering. 

    * 32 polygons

&nbsp;

### **Relevant Inisghts:**

1. No linear correlation to be taken
2. R made CHM's
3. Sampled inventory data


### **Procedure Description:**

1. Academic literature (Drive folder with papers) - Explain self taught
2. Data Understanding
3. CHM generation
4. Local Maxima with Fixed Window Size application
5. Individual Tree Detection Evaluation


### **Results**:

| Zone      | Ground Truth # trees | LM correct trees| Overall Accuracy|
| ----------- | :----:  | :----:  | :----:  |
| 8     | 130       | 33 | 25.38%
| 18   | Text        | |
| 22  | Title       | |


### Conclusions & Next Steps: