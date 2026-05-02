-- Land use diversity per administrative area

SELECT 
    a.name AS county_name,
    COUNT(DISTINCT l.fclass) AS landuse_type_count,
    a.geom
FROM adminareas_a a
JOIN landuse_a l
ON ST_Intersects(a.geom, l.geom)
WHERE a.name IS NOT NULL
GROUP BY a.name, a.geom
ORDER BY landuse_type_count DESC;