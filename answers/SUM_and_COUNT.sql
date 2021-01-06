-- 1. answer 
SELECT SUM(population)
FROM world

-- 2. answer
SELECT DISTINCT continent FROM world

-- 3. answer
SELECT SUM(gdp) FROM world WHERE continent LIKE 'Africa'

-- 4. answer
SELECT COUNT(name) FROM world WHERE area >= 1000000

-- 5. answer
SELECT SUM(population) FROM world WHERE name IN('Estonia', 'Latvia', 'Lithuania')

-- 6. answer
SELECT continent, COUNT(name) FROM world GROUP BY continent

-- 7. answer
SELECT continent, COUNT(name) FROM world WHERE population>=10000000 GROUP BY continent

-- 8. answer
SELECT continent FROM world x WHERE 100000000 < ALL (SELECT SUM(population) FROM world y WHERE x.continent=y.continent ) GROUP BY continent

--SUM and COUNT QUIZ
-- 1. answer
 SELECT SUM(population) FROM bbc WHERE region = 'Europe'

-- 2. answer
 SELECT COUNT(name) FROM bbc WHERE population < 150000

-- 3. answer
-- AVG(), COUNT(), MAX(), MIN(), SUM()

-- 4. answer
-- No result due to invalid use of the WHERE function

-- 5. answer
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

-- 6. answer
SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

-- 7. answer
SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

-- 8. answer
-- Table-D