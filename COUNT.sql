/*
	用 DISTINCT col_name 可以去掉重复的行
*/

#列出state字段中的所有出现过的值
SELECT DISTINCT state FROM president;

#state字段中出现过的值的总数
SELECT COUNT(DISTINCT state) FROM president;

SELECT COUNT(*) FROM grade_event WHERE category = 'Q';

SELECT sex, COUNT(*) FROM student GROUP BY sex;

SELECT 
MONTH(birth) AS month, 
MONTHNAME(birth) AS name, 
COUNT(*) AS count
FROM president
GROUP BY month
ORDER BY month;

/*
	WHERE 和 HAVING 的共同之处在于都能对查询结果进行条件控制
	WHERE 和 HAVING 的不同支出在于对于一些汇总函数，如COUNT等，只能出现在HAVING中
*/
SELECT 
state, 
COUNT(state) AS count 
FROM president 
GROUP BY state HAVING count > 1
ORDER BY count
LIMIT 0, 10;

/*
	WITH ROLLUP 能显示统计结果（各分组COUNT的综合）
	WITH ROLLUP 不能和ORDER BY 联用；
*/

/*
	MIN()
	MAX()
	SUM()
	AVG()
*/

SELECT 
	grade_event.event_id,
	grade_event.date,
	grade_event.category,
	student.sex,
	MIN(score.score) AS minimum,
	MAX(score.score) AS maximum,
	MAX(score.score) - MIN(score.score) + 1 AS span,
	AVG(score.score) AS average,
	SUM(score.score) AS total,
	COUNT(score.score) AS count
FROM grade_event
INNER JOIN score
INNER JOIN student
ON grade_event.event_id = score.event_id
AND score.student_id = student.student_id
GROUP BY grade_event.event_id, student.sex


