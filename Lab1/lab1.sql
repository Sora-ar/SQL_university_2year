SELECT name, population
FROM cities
ORDER BY population DESC
LIMIT 20

SELECT name
FROM cities
ORDER BY name DESC
LIMIT 30

SELECT region, population
FROM cities
ORDER BY population DESC

SELECT DISTINCT region
FROM cities

SELECT name, region
FROM cities
ORDER BY region, name DESC

