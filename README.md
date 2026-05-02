# Colorado OSM PostGIS Analysis

**Student:** Carlos Andres Castillo  
**Course:** GIST 604B – Open Source GIS  
**Module:** Module 5 – OSM and PostGIS Spatial Analysis 
**University of Arizona**

---

## Project Description

This project uses OpenStreetMap data stored in a PostGIS database to analyze spatial patterns across Colorado. The analysis focuses on hospitals, land use diversity, and road infrastructure at the county level. SQL queries are used to process spatial data, and results are visualized in Python using GeoPandas and Matplotlib.

---

## Tools and Technologies

- PostgreSQL + PostGIS  
- Python  
- GeoPandas  
- SQLAlchemy  
- Matplotlib  
- Jupyter Notebook  
- OpenStreetMap (Geofabrik data)

---

## What I Did

- Set up a PostGIS database using Colorado OpenStreetMap data  
- Wrote SQL queries to extract hospitals, land use diversity, and road density  
- Fixed spatial calculations using `ST_Intersection`, `ST_Area`, and `ST_Length` with `::geography` for accurate measurements  
- Filtered and cleaned administrative boundary data for correct county-level analysis  
- Visualized spatial results using GeoPandas and Matplotlib  
- Interpreted spatial patterns across Colorado counties  

---

## How to View / Run

- Open the notebook: `notebooks/osm_postgis_colorado.ipynb`  
- Ensure Docker and PostGIS are running  
- Confirm database `colorado` is active  
- Run notebook cells in order from top to bottom  
- SQL queries are stored in `sql/colorado/`  

To start the database if needed:

```bash
docker compose up -d
```

## Repository Structure

    
    ├── .devcontainer/
    │   ├── Dockerfile
    │   └── devcontainer.json
    ├── notebooks/
    │   ├── setup_osm_postgis.ipynb
    │   ├── osm_postgis_queries.ipynb
    │   └── osm_postgis_colorado.ipynb
    ├── sql/
    │   └── arizona/
    │       ├── 01_osm_restaurant_distribution.sql
    │       ├── 02_osm_park_area_by_county.sql
    │       ├── 03_osm_restaurants_near_streets.sql
    │       ├── 04_osm_railway_density_by_county.sql
    │       └── 05_osm_county_amenity_synthesis.sql
    │   └── colorado/
    │       ├── 01_hospitals.sql
    │       ├── 02_landuse_diversity.sql
    │       └── 03_road_density.sql
    ├── src/
    │   └── setup_osm_postgis.py
    ├── docker-compose.yml
    ├── pyproject.toml
    ├── uv.lock
    └── README.md
