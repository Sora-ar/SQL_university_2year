SELECT UPPER(name) AS name_upcase
FROM cities
ORDER BY name
LIMIT 5 OFFSET 5;

SELECT name, LENGTH(name) AS name_len
FROM cities
WHERE LENGTH(name) NOT IN (8, 9, 10)

SELECT region, SUM(population) AS population_sum
FROM cities
WHERE region IN ('C', 'S')
GROUP BY region

SELECT AVG(population) AS population_avg
FROM cities
WHERE region = 'W'

SELECT COUNT(*) AS city_cust
FROM cities
WHERE region = 'E'