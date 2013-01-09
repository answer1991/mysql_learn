/*
	变量的命名语法是 @变量名
	赋值语法在SELECT语句中使用 @变量名 := 值的方法
	在SET语句中使用 @变量名 = 值
*/
SELECT @birth := birth FROM president WHERE fist_name = "Andrew" AND last_name = "Jackson";
SELECT first_name, last_name FROM president WHERE birth < @birth;

SET @today = CURDATE();
SELECT @today;