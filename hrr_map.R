library("rgdal")
library("maptools")

gpclibPermit()
shape <- readOGR(dsn = "hrr_bdry/.", layer = "HRR_Bdry")
shape.fort <- fortify(shape)
shape.df <- join(shape.fort, shape@data, by = "id")
ggplot(shape.df, aes(long, lat, group = group)) + geom_polygon()
