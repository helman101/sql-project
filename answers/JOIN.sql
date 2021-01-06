-- 1. answer
SELECT matchid, player FROM goal 
WHERE teamid LIKE 'GER'

-- 2. answer
SELECT id,stadium,team1,team2
FROM game WHERE id LIKE 1012

-- 3. answer
SELECT player,teamid,stadium,mdate
FROM game 
JOIN goal ON (id=matchid)
WHERE  teamid LIKE 'GER'

-- 4. answer
SELECT team1,team2,player
FROM game 
JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

-- 5. answer
SELECT player, teamid, coach, gtime
FROM goal 
JOIN eteam
ON teamid=id
WHERE gtime<=10

-- 6. answer
SELECT game.mdate, eteam.teamname FROM game
JOIN goal ON game.id = goal.matchid
JOIN eteam ON goal.teamid = eteam.id
WHERE eteam.coach LIKE 'Fernando Santos' 
AND game.team1 LIKE 'GRE'

-- 7. answer
SELECT player FROM goal 
JOIN game ON goal.matchid=game.id
WHERE stadium LIKE 'National Stadium, Warsaw'

-- 8. answer
SELECT DISTINCT player FROM game 
JOIN goal ON matchid = id 
WHERE (team1='GER' OR team2='GER') 
AND goal.teamid NOT LIKE 'GER' 

-- 9. answer
SELECT eteam.teamname, COUNT(*) FROM eteam 
JOIN goal ON id=teamid
GROUP BY teamname

-- 10. answer
SELECT game.stadium, COUNT(*) FROM game 
JOIN goal ON id=matchid
GROUP BY stadium

-- 11. answer
SELECT goal.matchid, game.mdate, COUNT(*) FROM game 
JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY goal.matchid, game.mdate

-- 12. answer
SELECT goal.matchid, game.mdate, COUNT(*) FROM game 
JOIN goal ON matchid = id 
WHERE teamid = 'GER'
GROUP BY goal.matchid, game.mdate

-- 13. answer
SELECT mdate, team1, 
SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) score1,
team2,
SUM(CASE WHEN goal.teamid = game.team2 THEN 1 ELSE 0 END) score2
FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate,team1,team2
ORDER BY mdate,matchid,team1,team2

--JOIN QUIZ
-- 1. answer
-- game JOIN goal ON (id=matchid)

-- 2. answer
-- matchid, teamid, player, gtime, id, teamname, coach

-- 3. answer
SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'
 GROUP BY player, teamid

-- 4. answer
-- DEN	| 9 June 2012
-- GER	| 9 June 2012

-- 5. answer
SELECT DISTINCT player, teamid 
FROM game JOIN goal ON matchid = id 
WHERE stadium = 'National Stadium, Warsaw' 
AND (team1 = 'POL' OR team2 = 'POL')
AND teamid != 'POL'

-- 6. answer
SELECT DISTINCT player, teamid, gtime
FROM game JOIN goal ON matchid = id
WHERE stadium = 'Stadion Miejski (Wroclaw)'
AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))

-- 7. answer
-- Netherlands	        |   2
-- Poland	            |   2
-- Republic of Ireland	|   1
-- Ukraine	            |   2
