-- 1. answer
SELECT COUNT(*) FROM stops

-- 2. answer
SELECT id FROM stops
WHERE name LIKE 'Craiglockhart'

-- 3. answer
SELECT id, name FROM stops
JOIN route ON id=stop
WHERE num=4
ORDER BY pos

-- 4. answer
SELECT company, num, COUNT(2) AS link
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING link LIKE 2


-- 5. answer
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops ON a.num=stops.id
WHERE a.stop=53 AND b.stop=(SELECT id FROM stops WHERE name LIKE 'London Road')

-- 6. answer
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'AND stopb.name='London Road'

-- 7. answer
SELECT a.company, a.num FROM route a
JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop=137
GROUP BY num,company

-- 8. answer
SELECT a.company, a.num FROM route a
JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopsa ON (a.stop=stopsa.id)
JOIN stops stopsb ON (b.stop=stopsb.id)
WHERE stopsa.name='Craiglockhart' AND stopsb.name='Tollcross'

-- 9. answer
SELECT stopsb.name, a. company, a.num FROM route a
JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopsa ON (a.stop=stopsa.id)
JOIN stops stopsb ON (b.stop=stopsb.id)
WHERE stopsa.name='Craiglockhart'

-- 10. answer
SELECT DISTINCT A.num, A.company, A.name, B.num, B.company
FROM
(SELECT DISTINCT a.num, a.company, stopsb.name FROM route a
JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopsa ON (a.stop=stopsa.id)
JOIN stops stopsb ON (b.stop=stopsb.id)
WHERE stopsa.name='Craiglockhart') A
JOIN
(SELECT DISTINCT a.num, a.company, stopsb.name FROM route a
JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopsa ON (a.stop=stopsa.id)
JOIN stops stopsb ON (b.stop=stopsb.id)
WHERE stopsa.name='Lochend') B
ON (A.name=B.name)
ORDER BY A.num,A.name,B.num

-- SELF JOIN QUIZ
-- 1. answer
SELECT DISTINCT a.name, b.name
  FROM stops a JOIN route z ON a.id=z.stop
  JOIN route y ON y.num = z.num
  JOIN stops b ON y.stop=b.id
 WHERE a.name='Craiglockhart' AND b.name ='Haymarket'

-- 2. answer
SELECT S2.id, S2.name, R2.company, R2.num
  FROM stops S1, stops S2, route R1, route R2
 WHERE S1.name='Haymarket' AND S1.id=R1.stop
   AND R1.company=R2.company AND R1.num=R2.num
   AND R2.stop=S2.id AND R2.num='2A'

-- 3. answer
SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Tollcross'
