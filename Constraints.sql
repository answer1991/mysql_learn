/*
	Constraints有如下几种：
		NOT NULL
		UNIQUE
		PRIMARY KEY
		FOREIGN KEY
		CHECK
		DEFAULT

*/

/* ------------------------ NOT NULL ----------------------------- */
###NOT NULL
CREATE TABLE test
(
	id	INT NOT NULL,
	name VARCHAR(20)
);

/* ------------------------ NOT NULL END ----------------------------- */

/* ------------------------ UNIQUE ----------------------------- */
###UNIQUE
CREATE TABLE test
(
	id	INT NOT NULL,
	name VARCHAR(20),
	UNIQUE (id)
);

CREATE TABLE test
(
	id	INT NOT NULL,
	name VARCHAR(20),
	CONSTRAINT uc_testId UNIQUE (id)
);

ALTER TABLE test
ADD UNIQUE (id)

###DROP UNIQUE
ALTER TABLE test
DROP INDEX uc_testId

/* ------------------------ UNIQUE END ----------------------------- */

/* ------------------------ PRIMARY KEY ----------------------------- */
###PRIMARY KEY
CREATE TABLE test
(
	id INT NOT NULL,
	name VARCHAR(20),
	PRIMARY KEY (id)
);

CREATE TABLE test
(
	id INT NOT NULL,
	name VARCHAR(20),
	CONSTRAINT pk_testId PRIMARY KEY (id)
);

ALTER TABLE test
ADD PRIMARY KEY (id);

ALTER TABLE test
ADD CONSTRAINT pk_testId PRIMARY KEY(id);

###DROP KEY
ALTER TABLE test
DROP PRIMARY KEY;

ALTER TABLE test
DROP CONSTRAINT pk_testId;
/* ------------------------ PRIMARY KEY END ----------------------------- */


/* ------------------------ FOREIGN KEY ----------------------------- */
###FOREIGN KEY
CREATE TABLE test
(
	id INT NOT NULL,
	name VARCHAR(20),
	FOREIGN KEY (id) REFERENCES tbl_name (col_name)
);

CREATE TABLE test
(
	id INT NOT NULL,
	name VARCHAR(20),
	CONSTRAINT fk_testId FOREIGN KEY (id) REFERENCES tbl_name (col_name)
);

ALTER TABLE test
ADD FOREIGN KEY (id) REFERENCES tbl_name (col_name);

ALTER TABLE test
ADD CONSTRAINT fk_testId FOREIGN KEY (id) REFERENCES tbl_name (col_name);

###DROP FOREIGN KEY
ALTER TABLE test
DROP FOREIGN KEY fk_testId;

ALTER TABLE test
DROP CONSTRAINT fk_testId;
/* ------------------------ FOREIGN KEY END ----------------------------- */

/* ------------------------ CHECK ----------------------------- */
###CHECK
CREATE TABLE test
(
	id INT NOT NULL,
	name VARCHAR(20),
	CHECK (id > 0)
);

CREATE TABLE test
(
	id INT NOT NULL,
	name VARCHAR(20),
	CONSTRAINT chk_testId CHECK (id > 0 AND name LIKE "test_%")
);

ALTER TABLE test
ADD CHECK (id > 0);

ALTER TABLE test
ADD CONSTRAINT chk_testId CHECK (id > 0);

###DROP CHECK 注意，MySQL中CKECK不能使用DROP CONSTRAINT
ALTER TABLE test
DROP CHECK chk_testId;

/* ------------------------ CHECK END ----------------------------- */

/* ------------------------ DEFAULT ----------------------------- */
### DEFAULT  不知道DATE类型的怎么设置DEFAULT
CREATE TABLE test
(
	id INT NOT NULL,
	date TIMESTAMP DEFAULT CURDATE()
);

ALTER TABLE test
ALERT col_name SET DEFAULT xxx;

###DROP DEFAULT
ALTER TABLE test
ALTER col_name DROP xxx;
/* ------------------------ DEFAULT ----------------------------- */