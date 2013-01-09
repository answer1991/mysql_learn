CREATE TABLE tbl_name (column_specs);

CREATE TABLE member
{
	member_id 	INT UNSIGNED 	NOT NULL 	AUTO_INCREMENT,
	PRIMARY KEY (member_id),
	last_name 	VARCHAR(20) 	NOT NULL,
	first_name 	VARCHAR(20) 	NOT NULL,
	suffix 		VARCHAR(5) 		NULL,
	expiration 	DATE 			NULL,
	email 		VARCHAR(100) 	NULL,
	street 		VARCHAR(50) 	NULL,
	city 		VARCHAR(50) 	NULL,
	state		VARCHAR(2)		NULL,
	zip			VARCHAR(10)		NULL,
	phone		VARCHAR(20)		NULL,
	interests 	VARCHAR(255)	NULL
}


CREATE TABLE student
{
	student_id 	INT UNSIGNED	NOT NULL 	AUTO_INCREMENT,
	sex			EMUN('M', 'F')  NOT NULL,
	name		VARCHAR(20)		NOT NULL
	PRIMARY KEY(student_id)
}ENGINE = InnoDB;

CREATE TABLE grade_event
{
	event_id	INT UNSIGNED	NOT NULL 	AUTO_INCREMENT,
	category	ENUM('T', 'Q')	NOT NULL,
	date		DATE			NOT NULL,
	PRIMARY KEY (event_id)
}ENGINE = InnoDB;

CREATE TABLE score
{
	event_id 	INT UNSIGNED	NOT NULL,
	student_id	INT UNSIGNED	NOT NULL,
	score		INT UNSIGNED,
	PRIMARY KEY (event_id, student_id),
	INDEX (student_id),
	FOREIGN KEY (event_id) REFERENCES grade_event (event_id),
	FOREIGN KEY (student_id) REFERENCES student (student_id)
}ENGINE = InnoDB;