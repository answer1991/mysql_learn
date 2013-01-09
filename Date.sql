/*
	MySQL的日期都是"yyyy-MM-dd"格式。如2008年的1月1号表示成 '2008-01-01';
	
*/

SELECT * FROM president WHERE dirth = '2008-10-01';

/*
	可以通过YEAR(), MONTH(), DAYOFMONTH()函数将日期分离出年、月、日来。
*/
SELECT DAYOFMONTH(CURDATE());

/*
	MONTHNAME()方法获得代表月的字符串
*/
SELECT MONTHNAME(CURDATE());

/*
	TIMESTAMPDIFF(YEAR\MONTH\DAY, val1, val2);
	将日期val1和val2的相关位的时间间隔
*/

SELECT first_name FROM president WHERE TIMESTAMPDIFF(YEAR, birth, death) > 60;

/*
	TO_DAYS()函数能将日期转化成天数
*/
SELECT first_name, last_name, expiration FROM member WHERE (TO_DAYS(expiration) - TO_DAYS(CURDATE())) < 60;
#等价与
SELECT first_name, last_name, expiration FROM member TIMESTAMPDIFF(DAY, CURDATE(), expiration) < 60;

/*
	DATE_ADD(), DATE_SUB()函数。
	接收两个参数，一个原始时间，一个INTERVAL XX YEAR\MONTH\DAY
*/

