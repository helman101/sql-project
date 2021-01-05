-- 1. answer
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- 2. answer
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

-- 3. answer
SELECT yr, subject 
FROM nobel
WHERE winner = 'Albert Einstein'

-- 4. answer
SELECT winner
FROM nobel
WHERE yr >= 2000 AND subject LIKE 'Peace'

-- 5. answer
SELECT * FROM nobel
WHERE subject = 'Literature' AND yr >= 1980 AND yr <= 1989

-- 6. answer
SELECT * FROM nobel
WHERE winner IN ('Barack Obama','Jimmy Carter','Woodrow Wilson', 'Theodore Roosevelt')

-- 7. answer
SELECT winner FROM nobel
WHERE winner LIKE 'John%'

-- 8. answer
SELECT * FROM nobel
WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = 1984

-- 9. answer
SELECT * FROM nobel
WHERE yr = 1980 AND subject != 'Chemistry' AND subject != 'Medicine'

-- 10. answer
SELECT * FROM nobel
WHERE yr < 1910 AND subject = 'Medicine' OR yr >= 2004 AND subject = 'Literature'

-- 11. answer
SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG'

-- 12. answer
SELECT * FROM nobel
--WHERE winner = 'EUGENE O\'NEILL'

-- 13. answer
SELECT winner, yr, subject FROM nobel 
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC

-- 14. answer
SELECT winner, subject 
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'),subject,winner

-- NOBEL QUIZ ANSWERS
-- 1. answer
SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'

-- 2. answer
SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960

-- 3. answer
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

-- 4. answer
-- Medicine	| Sir John Eccles
-- Medicine	| Sir Frank Macfarlane Burnet

-- 5. answer
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))

-- 6. answer
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

-- 7. answer
-- Chemistry	| 1
-- Literature	| 1
-- Medicine	  | 2
-- Peace	    | 1
-- Physics	  | 1



