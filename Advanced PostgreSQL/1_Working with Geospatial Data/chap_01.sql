CREATE TABLE geometries (name text, geom geometry);

-- data
INSERT INTO geometries VALUES
  ('Point', 'POINT(0 0)'),
  ('Point', 'POINT(1 1)'),
  ('Point', 'POINT(1 2)'),
  ('Simple line', 'LINESTRING(1 2, 2 2)'),
  ('Linestring', 'LINESTRING(0 0, 1 1, 2 0, 1 0, 2 1, 3 0)'),
  ('Square', 'POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))'),
  ('Rectangle', 'POLYGON((1 2, 3 2, 3 1, 1 1, 1 2))'),
  ('PolygonWithHole', 'POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(1 1, 1 2, 2 2, 2 1, 1 1))'),
  ('Collection', 'GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0, 1 0, 1 1, 0 1, 0 0)))');


-- examine WKB format
SELECT *, ST_AsText(geom) FROM geometries;

-- 
SELECT ST_X(geom), ST_Y(geom)
FROM geometries
WHERE name = 'Point';

-- 
SELECT ST_asText(geom), ST_Length(geom)
FROM geometries
WHERE name = 'Simple line';

SELECT ST_asText(geom), ST_Length(geom)
FROM geometries
WHERE name = 'Linestring';

-- We can also get the start and end point using the following query
SELECT ST_asText(geom), 
	 ST_Length(geom), 
 ST_asText(ST_StartPoint(geom)), 
 ST_asTEXT(ST_EndPoint(geom))
FROM geometries
WHERE name = 'Linestring';

-- have 3 different polygons
SELECT name, ST_AsText(geom), ST_Area(geom), geom
FROM geometries
WHERE name LIKE 'Polygon%' or name LIKE 'Square' or name LIKE 'Rectangle';

-- 
DROP TABLE IF EXISTS UKPlaces;

CREATE TABLE UKPlaces (
  sensor_id VARCHAR(50) PRIMARY KEY NOT NULL,
  name TEXT,
  longitude VARCHAR(50),
  latitude VARCHAR(50),
  country TEXT,
  sensorLocation GEOMETRY
);


INSERT INTO UKPlaces (sensor_id, name, longitude, latitude, country, sensorLocation) VALUES 
('S1', 'York', -1.080278, 53.958332, 'UK', ST_GeomFromText('POINT(-1.080278 53.958332)',4326)),
('S2', 'Worcester', -2.220000, 52.192001, 'UK', ST_GeomFromText('POINT(-2.220000 52.192001)',4326)),
('S3', 'Winchester', -1.308000, 51.063202, 'UK', ST_GeomFromText('POINT(-0.138702 51.063202)',4326)),
('S4', 'Wells', -2.647000, 51.209000, 'UK', ST_GeomFromText('POINT(-2.647000 51.209000)',4326)),
('S5', 'Wakefield', -1.490000, 53.680000, 'UK', ST_GeomFromText('POINT(-1.490000 53.680000)',4326)),
('S6', 'Truro', -5.051000, 50.259998, 'UK', ST_GeomFromText('POINT(-5.051000 50.259998)',4326)),
('S7', 'Sunderland', -1.381130, 54.906101, 'UK', ST_GeomFromText('POINT(-1.381130 54.906101)',4326));


-- query the table
SELECT * FROM UKPlaces;


-- Query for specific places
SELECT sensorLocation FROM UKPlaces 
WHERE name='Wells' OR name='Truro';

-- # We can calculae the distance between the two places using the following query
SELECT ST_Distance(geometry(a.sensorLocation), geometry(b.sensorLocation))
FROM UKPlaces a, UKPlaces b
WHERE a.name='Wells' AND b.name='Truro';

-- # Let's calculate it using geography
SELECT ST_Distance(geography(a.sensorLocation), geography(b.sensorLocation))
FROM UKPlaces a, UKPlaces b
WHERE a.name='Wells' AND b.name='Truro';

-- Find all places within 250kms of London (the coordinate value is for London)
SELECT name FROM UKPlaces 
WHERE ST_DWithin(sensorLocation, 
                 ST_GeomFromText('POINT(-0.138702 51.501220)',4326)::geography, 
                 250000);

-- Now lets check the distance between some other place and verify the value
-- We can also plot the line between these two places
SELECT ST_Distance(geography(a.sensorLocation), geography(b.sensorLocation)), 
       ST_MakeLine(a.sensorLocation, b.sensorLocation)
FROM UKPlaces a, UKPlaces b
WHERE a.name='Winchester' AND b.name='Wells';

--# From the query we also get the sitance between the two places in meters
SELECT ST_Distance(geography(a.sensorLocation), geography(b.sensorLocation)),
      ST_MakeLine(a.sensorLocation, b.sensorLocation)
FROM UKPlaces a, UKPlaces b
WHERE a.name='York' AND b.name='Sunderland';


--# Then run the following command 
-- on terminal [need to use brew install..]
-- shp2pgsql -I -s 4269 ./cb_2017_us_state_20m.shp public.us_state_20 | psql -d loonydb -p 5432
-- had to add "" -U postgres "" to spwcify the USER
SELECT * FROM us_state_20;


--
SELECT stusps, name, geom from us_state_20 where stusps in ('CA', 'NY', 'WA', 'TX');