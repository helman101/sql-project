-- 1. answer
SELECT id, title
FROM movie
WHERE yr=1962

-- 2. answer
SELECT yr FROM movie
WHERE title='Citizen Kane'

-- 3. answer
SELECT id,title,yr FROM movie
WHERE title LIKE '%Star%Trek%' 
ORDER BY yr

-- 4. answer
SELECT id FROM actor
WHERE name LIKE 'Glenn Close'

-- 5. answer
SELECT id FROM movie
WHERE title LIKE 'Casablanca'

-- 6. answer
SELECT name FROM actor
JOIN casting ON actor.id=casting.actorid
WHERE movieid=11768

-- 7. answer
SELECT name FROM actor
JOIN casting ON actor.id=casting.actorid
JOIN movie ON casting.movieid=movie.id
WHERE movie.title = 'Alien'

-- 8. answer
SELECT title FROM movie
JOIN casting ON movie.id=casting.movieid
JOIN actor ON casting.actorid=actor.id
WHERE name='Harrison Ford'

-- 9. answer
SELECT title FROM movie
JOIN casting ON movie.id=casting.movieid
JOIN actor ON casting.actorid=actor.id
WHERE name='Harrison Ford' AND casting.ord NOT LIKE 1

-- 10. answer
SELECT title, name FROM movie
JOIN casting ON movie.id=casting.movieid
JOIN actor ON casting.actorid=actor.id
WHERE yr=1962 AND casting.ord=1

-- 11. answer
SELECT yr,COUNT(title) FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12. answer
SELECT movie.title, actor.name FROM movie
JOIN casting ON movie.id=casting.movieid
JOIN actor ON casting.actorid=actor.id
WHERE casting.ord=1 AND movieid 
IN (SELECT movieid FROM casting WHERE actorid 
IN (SELECT id FROM actor WHERE name='Julie Andrews'))

-- 13. answer
SELECT DISTINCT name FROM actor 
JOIN casting ON actor.id=casting.actorid
WHERE actorid 
IN (SELECT actorid
FROM casting 
WHERE ord=1
GROUP BY actorid
HAVING SUM(CASE WHEN ord=1 THEN 1 ELSE 0 END) >= 15)
ORDER BY name

-- 14. answer
SELECT title, COUNT(actorid) FROM movie
JOIN casting ON movie.id=casting.movieid
WHERE yr=1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title 

-- 15. answer
SELECT name FROM actor
JOIN casting ON actor.id=casting.actorid
WHERE movieid IN (SELECT movieid FROM casting WHERE actorid 
IN (SELECT id FROM actor WHERE name='Art Garfunkel')) 
AND name!='Art Garfunkel'

-- MORE JOIN QUIZ
-- 1. answer
SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget

-- 2. answer
SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid

-- 3. answer
SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC

-- 4. answer
-- Table-B

-- 5. answer
SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351

-- 6. answer
-- link the director column in movies with the primary key in actor
-- connect the primary keys of movie and actor via the casting table

-- 7. answer
-- Table-B



