-- 1. answer
SELECT lastName, party, votes
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC

-- 2. answer
SELECT party, votes,
       RANK() OVER (ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY party

-- 3. answer
SELECT yr,party, votes,
      RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000021'
ORDER BY party,yr

-- 4. answer
SELECT constituency,party, votes,
RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
FROM ge
WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
AND yr  = 2017
ORDER BY posn,constituency,votes DESC

-- 5. answer
SELECT constituency, party
FROM ge x
WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
AND yr = 2017
AND votes >= ALL
(SELECT votes FROM ge y
WHERE y.constituency = x.constituency
AND yr=2017 )
GROUP BY constituency

-- 6. answer
SELECT constituency, party
FROM ge x
WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
AND yr = 2017
AND votes > ALL
(SELECT votes FROM ge y
WHERE y.constituency = x.constituency
AND y.party != x.party
AND yr=2017 )
GROUP BY constituency
