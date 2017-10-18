# Map from Leaflet Library
GN  
October 17, 2017  



## Map

This utah state capitol is marked on the map



```r
library("leaflet")
```


```r
map <- leaflet() %>% 
  addTiles() %>% 
  addProviderTiles(providers$OpenStreetMap) %>% 
  setView(-111.890, 40.777, zoom = 12) %>%
  addMarkers(lng=-111.8883, lat=40.7774116, popup = "Utah State Capitol")
map
```

<!--html_preserve--><div id="htmlwidget-fc8a760356214f86ca2d" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-fc8a760356214f86ca2d">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"maxNativeZoom":null,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"continuousWorld":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":null,"unloadInvisibleTiles":null,"updateWhenIdle":null,"detectRetina":false,"reuseTiles":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addProviderTiles","args":["OpenStreetMap",null,null,{"errorTileUrl":"","noWrap":false,"zIndex":null,"unloadInvisibleTiles":null,"updateWhenIdle":null,"detectRetina":false,"reuseTiles":false}]},{"method":"addMarkers","args":[40.7774116,-111.8883,null,null,null,{"clickable":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},"Utah State Capitol",null,null,null,null,null,null]}],"setView":[[40.777,-111.89],12,[]],"limits":{"lat":[40.7774116,40.7774116],"lng":[-111.8883,-111.8883]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
