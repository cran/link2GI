% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/linkGDAL.R
\name{linkGDAL}
\alias{linkGDAL}
\title{Locate and set up 'GDAL' API bindings}
\usage{
linkGDAL(
  bin_GDAL = NULL,
  searchLocation = NULL,
  ver_select = FALSE,
  quiet = TRUE,
  returnPaths = TRUE
)
}
\arguments{
\item{bin_GDAL}{string contains path to where the gdal binaries are located}

\item{searchLocation}{string hard drive letter default is \code{C:/}}

\item{ver_select}{Boolean default is FALSE. If there is more than one 'GDAL' installation and \code{ver_select} = TRUE the user can select interactively the preferred 'GDAL' version}

\item{quiet}{Boolean  switch for suppressing messages default is TRUE}

\item{returnPaths}{Boolean if set to FALSE the paths of the selected version are written 
to the PATH variable only, otherwise all paths and versions of the installed GRASS versions ae returned.}
}
\value{
add gdal paths to the environment and creates global variables path_GDAL
}
\description{
Locate and set up  \href{https://gdal.org/}{'GDAL - Geospatial Data Abstraction Librar'} API bindings
}
\details{
It looks for the \code{gdalinfo(.exe)} file. If the file is found in a \code{bin} folder it is assumed to be a valid 'GDAL' binary installation.

if called without any parameter \code{linkGDAL()} it performs a full search over the hard drive \code{C:}. If it finds one or more 'GDAL' binaries it will take the first hit. You have to set \code{ver_select = TRUE} for an interactive selection of the preferred version.
}
\note{
You may also set the path manually. Using a 'OSGeo4W64' \url{https://trac.osgeo.org/osgeo4w/} installation it is typically \code{C:/OSGeo4W64/bin/}
}
\examples{
\dontrun{
# call if you do not have any idea if and where GDAL is installed
gdal<-linkGDAL()
if (gdal$exist) {
# call it for a default OSGeo4W installation of the GDAL
print(gdal)
}
}
}
\author{
Chris Reudenbach
}
