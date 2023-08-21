-- JANE USE-CASE SCENARIO 1

-- Find vet clinics with 1700 meters
SELECT vet.name, vet.low_cost, vet.dogs, vet.open_wk, vet.open_wkds, vet.full_srvc
FROM madison_vet as vet
WHERE ST_DWithin(geom, ST_GeomFromText('POINT (305582.7152225829 4772189.289749355)',32616), 1700);

-- Find Bus stops within 100 meters
SELECT metro.stop_name, metro.route
FROM madison_metro as metro
WHERE ST_DWithin(geom, ST_GeomFromText('POINT (305582.7152225829 4772189.289749355)',32616), 100);

-- Find No Vehicle Ownership, median income, Gini index of income inequality of Jane's Census Tracts
SELECT msn_demo.geoid, msn_demo.noveh1620_est as No_vehicle_perc, msn_demo.gini1620_est as Gini_index, msn_demo.medincacs1620_est as Median_income
FROM madison_census_tracts as ct
JOIN madison_demographics as msn_demo
ON ct.geoid = msn_demo.geoid
WHERE ST_Within(ST_GeomFromText('POINT (305582.7152225829 4772189.289749355)',32616), ct.geom);

-- Find Census tracts with highest vet clinics
SELECT COUNT(vet.name) as vet_clinics, ct.geoid
FROM madison_vet as vet
JOIN madison_census_tracts as ct
ON ST_Intersects(vet.geom, ct.geom)
GROUP BY ct.geoid
ORDER BY COUNT(vet.name) DESC;

-- Find Census tracts with highest vet clinics
SELECT COUNT(vet.name) as vet_clinics, ct.geoid
FROM madison_vet as vet
JOIN madison_census_tracts as ct
ON ST_Intersects(vet.geom, ct.geom)
GROUP BY ct.geoid
ORDER BY COUNT(vet.name) DESC;
