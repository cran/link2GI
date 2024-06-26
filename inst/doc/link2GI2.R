## ----eval=FALSE---------------------------------------------------------------
#  # find all SAGA GIS installations at the default search location
#  require(link2GI)
#  saga <- link2GI::findSAGA()
#  saga

## ----eval=FALSE---------------------------------------------------------------
#  require(link2GI)
#  grass <- link2GI::findGRASS()
#  grass
#  otb <- link2GI::findOTB(searchLocation = "~/")
#  otb

## ----eval=FALSE---------------------------------------------------------------
#  require(link2GI)
#  dirs = link2GI::createFolders(root_folder = tempdir(),
#                                  folders = c("data/",
#                                              "data/level0/",
#                                              "data/level1/",
#                                              "output/",
#                                              "run/",
#                                              "fun/")
#                                  )
#  dirs

## ----eval=FALSE, echo=FALSE, message=FALSE, warning=FALSE---------------------
#  require(link2GI)
#  # find all SAGA GIS installations and take the first one
#  saga1 <- link2GI::linkSAGA()
#  saga1
#  

## ----eval=FALSE---------------------------------------------------------------
#  # get meuse data as sp object and link it temporary to GRASS
#  require(link2GI)
#  require(sf)
#  require(sp)
#  crs = 28992
#  # get data
#  data(meuse)
#  meuse_sf = st_as_sf(meuse, coords = c("x", "y"), crs = crs, agr = "constant")
#  
#  # Automatic search and find of GRASS binaries
#  # using the meuse sp data object for spatial referencing
#  # This is the highly recommended linking procedure for on the fly jobs
#  # NOTE: if more than one GRASS installation is found the highest version will be selected
#  
#  linkGRASS(meuse_sf,epsg = crs)

## ----eval=FALSE---------------------------------------------------------------
#   require(link2GI)
#   require(sf)
#  
#   # get  data
#   nc <- st_read(system.file("shape/nc.shp", package="sf"))
#  terra::crs(nc)
#   # Automatic search and find of GRASS binaries
#   # using the nc sf data object for spatial referencing
#   # This is the highly recommended linking procedure for on the fly jobs
#   # NOTE: if more than one GRASS installation is found the highest version will be selected
#  
#   grass<-linkGRASS(nc,returnPaths = TRUE)

## ----eval=FALSE---------------------------------------------------------------
#    library(link2GI)
#   require(sf)
#  
#   # proj folders
#   root_folder<-tempdir()
#   paths<-link2GI::createFolders(root_folder = root_folder,
#                            folders = c("project1/"))
#  
#   # get  data
#   nc <- st_read(system.file("shape/nc.shp", package="sf"))
#  
#   # CREATE and link to a permanent GRASS folder at "root_folder", location named "project1"
#   linkGRASS(nc, gisdbase = root_folder, location = "project1")
#  
#   # ONLY LINK to a permanent GRASS folder at "root_folder", location named "project1"
#   linkGRASS(gisdbase = root_folder, location = "project1", gisdbase_exist = TRUE )
#  
#  
#   # setting up GRASS manually with spatial parameters of the nc data
#   epsg = 28992
#   proj4_string <- sp::CRS(paste0("+init=epsg:",epsg))
#  
#   linkGRASS(spatial_params = c(178605,329714,181390,333611,proj4_string@projargs),epsg=epsg)
#  
#   # creating a GRASS gisdbase manually with spatial parameters of the nc data
#   # additionally using a peramanent directory "root_folder" and the location "nc_spatial_params "
#   epsg = 4267
#   proj4_string <- sp::CRS(paste0("+init=epsg:",epsg))@projargs
#   linkGRASS(gisdbase = root_folder,
#              location = "nc_spatial_params",
#              spatial_params = c(-84.32385, 33.88199,-75.45698,36.58965,proj4_string),epsg = epsg)
#  

## ----eval=FALSE---------------------------------------------------------------
#  # Link the GRASS installation and define the search location
#   linkGRASS(nc, search_path = "~/")

## ----eval=FALSE---------------------------------------------------------------
#  findGRASS()
#       instDir version installation_type
#  1 /usr/lib/grass83   8.3.2             grass
#  
#  # now linking it
#  linkGRASS(nc,c("/usr/lib/grass83","8.3.2","grass"),epsg = 4267)
#  
#  # corresponding linkage running windows
#  linkGRASS(nc,c("C:/Program Files/GRASS GIS7.0.5","GRASS GIS 7.0.5","NSIS"))

## ----eval=FALSE---------------------------------------------------------------
#  linkGRASS(nc, ver_select = TRUE)

## ----eval=FALSE---------------------------------------------------------------
#  linkGRASS(x = nc,
#                       gisdbase = "~/temp3",
#                       location = "project1")

## ----eval=FALSE---------------------------------------------------------------
#  linkGRASS(gisdbase = "~/temp3", location = "project1",
#                       gisdbase_exist = TRUE)

## ----eval=FALSE---------------------------------------------------------------
#   linkGRASS(spatial_params = c(178605,329714,181390,333611,
#                                "+proj=sterea +lat_0=52.15616055555555
#                                 +lon_0=5.38763888888889 +k=0.9999079
#                                 +x_0=155000 +y_0=463000 +no_defs
#                                 +a=6377397.155 +rf=299.1528128
#                                 +towgs84=565.4171,50.3319,465.5524,
#                                  -0.398957,0.343988,-1.8774,4.0725
#                                 +to_meter=1"),epsg = 28992)

## ----eval=FALSE---------------------------------------------------------------
#  # link to the installed OTB Linux HOME directory
#  otblink<-link2GI::linkOTB(searchLocation = "~/apps/OTB-8.1.2-Linux64/")
#  
#  
#  # get the list of modules from the linked version
#  algo<-parseOTBAlgorithms(gili = otblink)

## ----eval=FALSE---------------------------------------------------------------
#  ## for the example we use the edge detection,
#  algoKeyword <- "EdgeExtraction"
#  
#  ## extract the command list for the selected algorithm
#  cmd <- parseOTBFunction(algo = algoKeyword, gili = otblink)
#  
#  ## print the current command
#  print(cmd)

## ----eval=FALSE---------------------------------------------------------------
#  require(link2GI)
#  require(terra)
#  require(listviewer)
#  
#  otblink <- link2GI::linkOTB(searchLocation = "~/apps/OTB-8.1.2-Linux64/")
#   root_folder<-tempdir()
#  
#  fn <- system.file("ex/elev.tif", package = "terra")
#  
#  ## for the example we use the edge detection,
#  algoKeyword<- "EdgeExtraction"
#  
#  ## extract the command list for the selected algorithm
#  cmd<-parseOTBFunction(algo = algoKeyword, gili = otblink)
#  
#  ## define the mandatory arguments all other will be default
#  cmd$help = NULL
#  cmd$input_in  <- fn
#  cmd$filter <- "touzi"
#  cmd$channel <- 1
#  cmd$out <- file.path(root_folder,paste0("out",cmd$filter,".tif"))
#  
#  ## run algorithm
#  retStack<-runOTB(cmd,gili = otblink)
#  
#  ## plot filter raster on the green channel
#  plot(retStack)
#  
#  

