-- 1. answer
SELECT name FROM world
  WHERE name LIKE 'Y%'

-- 2. answer
SELECT name FROM world
  WHERE name LIKE '%y'

-- 3. answer
SELECT name FROM world
  WHERE name LIKE '%x%'

-- 4. answer
SELECT name FROM world
  WHERE name LIKE '%land'

-- 5. answer
SELECT name FROM world
  WHERE name LIKE 'C%ia'

-- 6. answer
SELECT name FROM world
  WHERE name LIKE '%oo%'

-- 7. answer
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

-- 8. answer
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

-- 9. answer
SELECT name FROM world
 WHERE name LIKE '%o__o%'

-- 10. answer
SELECT name FROM world
 WHERE name LIKE '____'

-- HARDER QUESTIONS
-- 11. answer
SELECT name
  FROM world
 WHERE name LIKE capital

-- 12. answer
SELECT name FROM world
 WHERE capital LIKE concat(name, ' City')

-- 13. answer
SELECT  capital, name FROM world
WHERE capital LIKE concat('%', name, '%')

-- 14. answer
SELECT  capital, name FROM world
WHERE capital LIKE concat('%', name, '%') AND length(capital) > length(name)

-- 15. answer
SELECT name, REPLACE(capital, name, '') AS Extension FROM world
WHERE capital LIKE concat('%', name, '%') AND length(capital) > length(name) 