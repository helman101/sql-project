-- 1. answer
SELECT name FROM world
  WHERE population >
    (SELECT population FROM world
    WHERE name='Russia')

-- 2. answer
SELECT name FROM world
WHERE continent = 'Europe' 
AND gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom')

-- 3. answer
SELECT name, continent 
FROM world 
WHERE continent IN(SELECT continent FROM world WHERE name IN('Argentina', 'Australia'))
ORDER BY name

-- 4. answer
SELECT name, population 
FROM world 
WHERE population > (SELECT population FROM world WHERE name LIKE 'Canada') 
AND population < (SELECT population FROM world WHERE name LIKE 'Poland')

-- 5. answer
SELECT name, CONCAT(ROUND(population/((SELECT population FROM world WHERE name LIKE 'Germany')/100)), '%') 
FROM world 
WHERE continent LIKE 'Europe'

-- 6. answer
SELECT name 
FROM world
WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent LIKE 'Europe')

-- 7. answer
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent)

-- 8. answer
SELECT continent, name FROM world x
  WHERE name <= ALL
    (SELECT name FROM world y
        WHERE y.continent=x.continent)

-- 9. answer
SELECT name, continent, population 
FROM world x
WHERE 25000000>=ALL (SELECT population FROM world y WHERE x.continent=y.continent AND population>0)

--10. answer
SELECT name, continent
FROM world y
WHERE population > ALL(SELECT population*3 FROM world x WHERE y.continent=x.continent AND y.name!=x.name AND population>0)

--NESTED SELECT QUIZ
-- 1. answer
 SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)

-- 2. answer
 SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)

-- 3. answer
SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)

-- 4. answer
-- Table-D

-- 5. answer
SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')

-- 6. answer
SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')

-- 7. answer
-- Table-B
