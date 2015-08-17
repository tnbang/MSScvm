# MSScvm

An automated cloud and cloud shadow masking system for Landsat MSS imagery. It provides a means of more easily incorporating MSS imagery in large-area and time series analysis by providing an efficient way to prevent cloud and cloud shadow pixels from contaminating mosaics, composites, and time series analysis.

http://www.msscvm.jdbcode.com/

Overview
--------

MSScvm will take Landsat LPGS MSS images and preform the following processes:

-   Decompress
-   Stack individual image bands to a single 4-band file
-   Write image files for spectral units of DN, TOA radiance, and TOA reflectance
-   Help prepare a required DEM file by providing convenient functions to mosaic, reproject, and resample
-   Create cloud and cloud shadow masks

The program uses the R programming environment and GDAL to execute the work. Therefore you must install both R and GDAL, and we recommended that you use RStudio as the front-end to interact with the R environment. This guide will walk you through installing the required software and R packages, as well as demonstrate the use of MSScvm. Note that on the [Download] page the MSScvm R package manual can be downloaded. It contains standard R documentation for each function described below. In the R command prompt you can also type `?` followed by a function name to display the function’s help page. As in: `?MSSunpack`.

The basic order of operations for running MSScvm is:

1.  Download MSS image
2.  Unpack the image using the `MSSunpack` function
3.  Identify and download image-corresponding DEM(s)
4.  Run the `mosaicDEMs` or `reprojectDEM` functions to prepare the DEM(s)
5.  Create cloud and shadow mask using the `MSScvm` function

If working with many images from the same Landsat footprint you will go through the above steps only once and then just the following for each successive image:

1.  Unpack the image using the `MSSunpack` function
2.  Create cloud and shadow mask using the `MSScvm` function

MSScvm will automatically write outputs to the same directory location as the input image, with intuitive file names that include the original image ID and descriptions for each type (DN, TOA radiance, TOA reflectance, and mask). The images are in the GeoTIFF format in the native resolution and projection of the input image file, with background values set to NoData.

<span id="system_requirements"></span></a>
System requirements
-------------------

### Computer

MSScvm was developed and tested on computers running Windows 7 64-bit OS with &gt;= 8 GB of RAM.

### Software
