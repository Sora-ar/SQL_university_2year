SELECT name
FROM cities
WHERE name LIKE '%ськ'

SELECT name
FROM cities
WHERE name LIKE '%донец%'

SELECT CONCAT(name, ' (', region, ')') AS region
FROM cities
WHERE population > 100000
ORDER BY name ASC

SELECT name, population, (population / 40000000) * 100 AS population
FROM cities
ORDER BY population DESC
LIMIT 10

SELECT CONCAT (name, ' - ', (population * 100 / 40000000), '%')
FROM cities
WHERE (population * 100 / 40000000) >= 0.1
ORDER BY (population * 100 / 40000000)