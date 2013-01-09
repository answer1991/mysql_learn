/*
	INNER JOIN 查询出来的结果是ON条件下的交集。
	LEFT JOIN 查询出来的结果像左表对齐
*/

SELECT 
sc.student_id AS student_id,
AVG(sc.score) AS avgScore,
COUNT(sc.score) AS count
FROM score AS sc
INNER JOIN student AS st
INNER JOIN grade_event AS ge
ON sc.student_id = st.student_id
AND ge.event_id = sc.event_id
WHERE st.student_id > 20
GROUP BY student_id
HAVING avgScore > 35;

SELECT 
	student.student_id AS student_id,
	student.name AS name,
	COUNT(absence.date) AS count
FROM student
LEFT JOIN absence
ON student.student_id = absence.student_id
GROUP BY student.student_id

/*
	JOIN也能连接自己的表
*/
#查询出生地一样的人
SELECT 
    p1.last_name, p1.first_name, p1.state, p1.city
FROM
    president AS p1
        INNER JOIN
    president AS p2 ON p1.city = p2.city
        AND p1.state = p2.state
WHERE
    (p1.first_name <> p2.first_name
        OR p1.last_name <> p2.last_name)
ORDER BY state, city, last_name

#查询同一天生日的人
SELECT 
    p1.first_name, p1.last_name, p1.birth
FROM
    president AS p1
        INNER JOIN
    president AS p2 ON MONTH(p1.birth) = MONTH(p2.birth)
        AND DAYOFMONTH(p1.birth) = DAYOFMONTH(p2.birth)
WHERE
    (p1.first_name <> p2.first_name
        OR p1.last_name <> p2.last_name)