-- Road density per county (robust + geography-correct + clipped geometry)

WITH county_roads AS (
    SELECT 
        a.name AS county_name,
        a.geom AS county_geom,
        r.geom AS road_geom
    FROM adminareas_a a
    JOIN roads r
        ON ST_Intersects(a.geom, r.geom)
    WHERE a.name IS NOT NULL
      AND r.geom IS NOT NULL
      AND r.fclass IN ('primary', 'secondary', 'tertiary')
)

SELECT 
    county_name,

    -- total road length inside county (accurate clipping)
    SUM(
        ST_Length(
            ST_Intersection(road_geom, county_geom)::geography
        )
    ) / 1000.0 AS total_road_km,

    -- county area in sq km
    (ST_Area(county_geom::geography) / 1000000.0) AS county_area_sq_km,

    -- final density metric
    (
        SUM(
            ST_Length(
                ST_Intersection(road_geom, county_geom)::geography
            )
        ) / 1000.0
    ) /
    NULLIF(
        (ST_Area(county_geom::geography) / 1000000.0),
        0
    ) AS road_density_km_per_sq_km,

    county_geom AS geom

FROM county_roads
GROUP BY county_name, county_geom
ORDER BY road_density_km_per_sq_km DESC;