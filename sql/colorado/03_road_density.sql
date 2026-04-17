-- Calculate total road length and road density (km per sq km) for each county

SELECT 
    a.name AS county_name,
    SUM(ST_Length(r.geom)) / 1000.0 AS total_road_km,
    (SUM(ST_Length(r.geom)) / 1000.0) 
        / (ST_Area(a.geom) / 1000000.0) AS road_density_km_per_sq_km,
    a.geom
FROM adminareas_a a
JOIN roads r
ON ST_Intersects(a.geom, r.geom)
WHERE r.fclass IN ('primary', 'secondary', 'tertiary')
GROUP BY a.name, a.geom
ORDER BY road_density_km_per_sq_km DESC;