/*
	INSERT 有三种语法
*/

# 这种方法插入的值必须与表的列的顺序一致，且必须为全体数据列准备好数据
INSERT INTO tbl_name VALUES (val1, val2..);

# 这种方法出入更加灵活，数据库会为没有插入的列赋予默认值
INSERT INTO tbl_name (col1, col2) VALUES (val1, val2);

# 类似于第二种
INSERT INTO tbl_name SET col1 = val1, col2 = val2;

/*
	LOAD DATA 方法
	这种方法会将某个文件中的数据全部插入到某个表中.
	该文件中的数据依次按照列的顺序排列，用制表符分割，每条数据用换行分割
*/

LOAD DATA LOCAL INFILE 'test.txt' INTO TABLE tbl_name;