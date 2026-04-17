-- Extract all hospital locations in Colorado from OSM POIs

SELECT 
    osm_id,
    name,
    geom
FROM pois
WHERE fclass = 'hospital';