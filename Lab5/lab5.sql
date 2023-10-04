SELECT region, SUM(population) AS total_population
FROM cities
GROUP BY region

SELECT SUM(population) AS total_population, region
FROM cities
GROUP BY region
HAVING COUNT(*) >= 10

SELECT cities.name, cities.population
FROM cities, regions
WHERE cities.region = regions.uuid AND regions.area_quantity >= 5
ORDER BY cities.population
LIMIT 5
OFFSET 10

SELECT regions.name, SUM(cities.population) AS total_population
FROM cities, regions
WHERE cities.population > 300000 AND cities.region = regions.uuid
GROUP BY regions.name

SELECT cities.name, cities.population
FROM regions, cities
WHERE regions.area_quantity <= 5 AND cities.region = regions.uuid
AND NOT population BETWEEN 150000 AND 500000
GROUP BY cities.population