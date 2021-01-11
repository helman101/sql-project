-- 1. answer
SELECT name FROM teacher
WHERE dept IS NULL

-- 2. answer
SELECT teacher.name, dept.name
FROM teacher
INNER JOIN dept ON (teacher.dept=dept.id)

-- 3. answer
SELECT teacher.name, dept.name
FROM teacher
LEFT JOIN dept ON (teacher.dept=dept.id)

-- 4. answer
SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept ON (teacher.dept=dept.id)

-- 5. answer
SELECT name, COALESCE(mobile,'07986 444 2266') FROM teacher

-- 6. answer
SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher
LEFT JOIN dept ON teacher.dept=dept.id

-- 7. answer
SELECT COUNT(name), COUNT(mobile) FROM teacher

-- 8. answer
SELECT dept.name, COUNT(teacher.name) FROM teacher
RIGHT JOIN dept ON teacher.dept=dept.id
GROUP BY dept.name

-- 9. answer
SELECT name,
CASE WHEN (teacher.dept=1 OR teacher.dept=2) THEN 'Sci'
ELSE 'Art' END
FROM teacher

-- 10. answer
SELECT name,
CASE WHEN (teacher.dept=1 OR teacher.dept=2) THEN 'Sci'
WHEN teacher.dept=3 THEN 'Art'
ELSE 'None' END
FROM teacher

-- NULL QUIZ
-- 1. answer
SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)

-- 2. answer
SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'

-- 3. answer
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name

-- 4. answer
-- display 0 in result column for all teachers without department

-- 5. answer
-- 'four' for Throd

-- 6. answer
-- Table-A
