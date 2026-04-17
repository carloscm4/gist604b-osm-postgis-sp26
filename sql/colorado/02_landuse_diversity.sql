-- Count the number of unique land use types in each county

SELECT 
    a.name AS county_name,
    COUNT(DISTINCT l.fclass) AS landuse_type_count,
    a.geom
FROM adminareas_a a
JOIN landuse_a l
ON ST_Intersects(a.geom, l.geom)
GROUP BY a.name, a.geom
ORDER BY landuse_type_count DESC;