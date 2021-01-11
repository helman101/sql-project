-- 1. answer
SELECT name, continent, population FROM world

-- 2. answer
SELECT name
  FROM world
 WHERE population >= 200000000

-- 3. answer
SELECT name, gdp/population AS 'per capita GDP'
  FROM world
 WHERE population >= 200000000

-- 4. answer
SELECT name, population/1000000
FROM world
WHERE continent LIKE 'South America'

-- 5. answer
SELECT name, population FROM world WHERE name IN('France', 'Germany', 'Italy')

-- 6. answer
SELECT name FROM world WHERE name LIKE '%United%'

--7. answer
SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000

-- 8. answer
SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000

-- 9. answer
SELECT name, ROUND(population/1000000, 2) AS population_millions, ROUND(gdp/1000000000, 2) AS gdp_billions 
FROM world 
WHERE continent LIKE 'South America'

-- 10. answer
SELECT name, ROUND(gdp/population, -3) AS 'per-capita GDP'
FROM world
WHERE gdp >= 1000000000000

-- 11. answer
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)

-- 12. answer
SELECT name, capital
FROM world
WHERE capital LIKE CONCAT(LEFT(name, 1), '%') AND capital != name

--13. answer
SELECT name
FROM world
WHERE name LIKE '%a%' 
AND name LIKE '%e%' AND name LIKE '%i%' 
AND name LIKE '%o%' AND name LIKE '%u%'
AND name NOT LIKE '% %'

-- BBC QUIZ ANSWERS
-- 1. answer
SELECT name
  FROM world
 WHERE name LIKE 'U%'

-- 2. answer
SELECT population
  FROM world
 WHERE name = 'United Kingdom'

-- 3. answer
-- 'name' should be name

-- 4. answer 
-- Nauru | 990

-- 5. answer
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia')

-- 6. answer
SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')

-- 7. answer
--Brazil
--Colombia

