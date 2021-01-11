-- 1. answer
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'

-- 2. answer
SELECT institution, subject 
  FROM nss
 WHERE question='Q15'
   AND score >= 100

-- 3. answer
SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND score<50
   AND subject='(8) Computer Science'

-- 4. answer
SELECT subject, SUM(response)
FROM nss
WHERE question='Q22'
AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject

-- 5. answer
SELECT subject, SUM(response*A_STRONGLY_AGREE/100)
FROM nss
WHERE question='Q22'
AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject

-- 6. answer
SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE/100)/SUM(response)*100) persons
FROM nss
WHERE question='Q22'
AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject
ORDER BY persons

-- 7. answer
SELECT institution, ROUND(SUM(response*score/100)/SUM(response)*100)
FROM nss
WHERE question='Q22'
AND (institution LIKE '%Manchester%')
GROUP BY institution

-- 8. answer
SELECT institution, SUM(sample), 
SUM(CASE WHEN subject='(8) Computer Science' THEN sample END)
FROM nss
WHERE question='Q01'
AND (institution LIKE '%Manchester%')
GROUP BY institution

