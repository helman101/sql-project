-- 1. answer
SELECT name, DAY(whn),
 confirmed, deaths, recovered
 FROM covid
WHERE name = 'Spain'
AND MONTH(whn) = 3
ORDER BY whn

-- 2. answer
SELECT name, DAY(whn), confirmed,
LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY confirmed)
FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3
ORDER BY whn

-- 3. answer
SELECT name, DAY(whn), confirmed-LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3
ORDER BY whn

-- 4. answer
SELECT name, DATE_FORMAT(whn,'%Y-%m-%d'), confirmed-LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND WEEKDAY(whn) = 0
ORDER BY whn


-- 5. answer
SELECT tw.name, DATE_FORMAT(tw.whn,'%Y-%m-%d'), tw.confirmed-lw.confirmed AS new
FROM covid tw
--LEFT JOIN covid lw ON (DATE_ADD(lw.whn, INTERVAL 1 WEEK) = tw.whn AND tw.name=lw.name)
--WHERE tw.name = 'Italy' AND WEEKDAY(tw.whn)=0
ORDER BY tw.whn


-- 6. answer
SELECT 
   name,
   confirmed,
   RANK() OVER (ORDER BY confirmed DESC) rc,
   deaths,
   RANK() OVER (ORDER BY deaths DESC) rk
  FROM covid
WHERE whn = '2020-04-20'
ORDER BY confirmed DESC

-- 7. answer
SELECT world.name,
ROUND(100000*confirmed/population,0) AS rate,
RANK() OVER (ORDER BY confirmed/population) rk
FROM covid JOIN world ON covid.name=world.name
WHERE whn = '2020-04-20' AND population >= 10000000
ORDER BY population DESC

-- 8. answer
SELECT name, DATE_FORMAT(whn,'%Y-%m-%d'), new FROM
(SELECT name, whn, new, RANK() OVER (PARTITION BY name ORDER BY new DESC) AS rank FROM 
(SELECT name, whn, confirmed-LAG(confirmed,1) OVER (PARTITION BY name ORDER BY whn) AS new FROM covid) A ) B 
WHERE rank=1 AND new>=1000
ORDER BY whn


