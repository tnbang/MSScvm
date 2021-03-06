% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/MSSunpack.r
\name{MSSunpack}
\alias{MSSunpack}
\title{Decompress and stack Landsat LPGS MSS images}
\usage{
MSSunpack(imgFile, toaRad = FALSE, toaRefl = FALSE, useL1G = FALSE)
}
\arguments{
\item{imgFile}{filename (character). Full path to compressed LPGS Landsat MSS image file provided by USGS.}

\item{toaRad}{logical. If TRUE, a TOA radiance image will be created.}

\item{toaRefl}{logical. If TRUE, a TOA reflectance image will be created.}

\item{useL1G}{logical. If TRUE, L1G images will be processed.}
}
\value{
A 4-band Landsat MSS GeoTIFF raster image file in DN units. If optional 'toaRad' and/or 'toaRefl'
parameters are set to TRUE, then similar TOA radiance and reflectance image files will created. The files will be places in
the same location as the 'imgFile' with the name equal to the image ID plus an appended descriptor. Descriptors
include 'dn' (digital number), 'toa_radiance' (TOA radiance), and 'toa_reflectance' (TOA reflectance).
}
\description{
Decompresses and stacks Landsat LPGS MSS images provided by USGS as *.tar.gz files. Optionally
outputs top-of-atmosphere (TOA) radiance and reflectance files.
}
\details{
It is important that the 'imgFile' be an unaltered tar.gz-compressed LPGS image file that you receive
from USGS through \href{http://rstudio.com}{EarthExplorer}. Note that DN values <= 1 are set to NA across all bands.
This mitigates a problem caused by bad columns on the east and west edge of images when mosaicing adjacent images together.
}
\examples{
\dontrun{

MSSunpack(imgFile = "C:/mss/LM10360321973191AAA04.tar.gz")
MSSunpack(imgFile = "C:/mss/LM10360321973191AAA04.tar.gz",
          toaRad = FALSE, toaRefl = TRUE, useL1G = TRUE)
}
}
\seealso{
\code{\link{MSSdn2rad}}, \code{\link{MSSdn2refl}}
}

