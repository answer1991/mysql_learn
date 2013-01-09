/*
	NULL是MySQL里一个很特殊的值，它表示“无数据”或者“未知数据”。
	NULL不能与任何的“有数据”的值进行比较。
	NULL只能用 IS NULL、 IS NOT NULL、 value <=> NULL 或者 NOT (VALUE <=> NULL) 来比较
	NULL在排序中，如果在升序中，排在最先；如果在降序中，排在最后。（可以理解为它是最小的）。
*/

SELECT * FROM president WHERE death IS NULL;
SELECT * FROM president WHERE death <=> NULL;

SELECT * FROM president WHERE suffix IS NOT NULL;
SELECT * FROM president WHERE suffix NOT (death <=> NULL);

/*
	IF(expr, falseValue, trueValue)。
*/
#一个将为NULL的放在最上面，将不是NULL的按降序排列可以这样写
SELECT * FROM president ORDER BY IF(death IS NULL, 0, 1) death DESC;

/*
	LIMIT val : 从结果中按上至下的顺序取出val个记录。
	LIMIT val1, val2 : 跳过val1个，选取val2个记录。
*/

#如果想从记录中随机取N条记录，可以将ORDER BY 和 LIMIT 联用
SELECT * FROM president ORDER BY RAND() LIMIT N;

/*
	SQRT(NUM), 将数字平方。
	FORMAT(NUM, val) 将数字NUM格式化成小数点后面val的数。
	CONCAT(STRING(Column)...) 将字符串（或者说是记录对应的列的值）连接起来。
*/