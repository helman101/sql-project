--TUTORIAL QUESTIONS
-- 1. answer
SELECT population FROM world
  WHERE name = 'Germany'

-- 2. answer
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3. answer
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- QUIZ QUESTIONS
-- 0. answer
SELECT name, population
  FROM world
WHERE population BETWEEN 1000000 AND 1250000

-- 1. answer
  --Table-E

-- 2. answer
SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'

-- 3. answer
SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'

-- 4. answer
/*name	| length(name)
  Italy	| 5
  Malta	| 5
  Spain	| 5
  */

-- 5. answer
-- Andorra | 936

-- 6. answer
SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000

-- 7. answer
SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')



