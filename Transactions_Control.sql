CREATE DATABASE student_information_TrailB;
USE student_information_TrailB;

DROP DATABASE student_information_TrailB;

CREATE TABLE student_data (
id INT NOT NULL AUTO_INCREMENT,
student_no BIGINT,
first_name VARCHAR(255) NOT NULL,
surname VARCHAR(255) NOT NULL,
programme VARCHAR(255),
PRIMARY KEY (id)
);


CREATE TABLE student_contact_details(
student_email VARCHAR(255),
contact_id INT NOT NULL -- we cannot put all student information here so we need to reference it -- 
);

CREATE TABLE nas_programmes(
id INT NOT NULL AUTO_INCREMENT,
Bachelor_of_science_in_data_science VARCHAR(255) NOT NULL,
Bachelor_of_science_in_mathematical_and_computer_science VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO student_data (student_no, first_name, surname, programme)
VALUES(11111, 'name', 'surname', 'BSC705'),
	  (12222, 'name', 'surname', 'BSC705'),
      (13333, 'name', 'surname', 'BSC705'),
      (14444, 'name', 'surname', 'DSC701'),
      (15555, 'name', 'surname', 'DSC701'),
      (16666, 'name', 'surname', 'DSC701'),
      (17777, 'name', 'surname', 'DSC701'),
      (18888, 'name', 'surname', 'DSC701'),
      (19999, 'name', 'surname', 'DSC701'),
      (21111, 'name', 'surname', 'BSC705'),
      (22222, 'name', 'surname', 'BSC705'),
      (23333, 'name', 'surname', 'BSC705'),
      (24444, 'name', 'surname', 'DSC701'),
      (25555, 'name', 'surname', 'DSC701'),
      (26666, 'name', 'surname', 'DSC701'),
      (27777, 'name', 'surname', 'BSC705'),
      (28888, 'name', 'surname', 'DSC701'),
      (29999, 'name', 'surname', 'DSC701'),
      (31111, 'name', 'surname', 'DSC701'),
      (32222, 'name', 'surname', 'DSC701');
      
INSERT INTO student_contact_details (student_email, contact_id)
VALUES('11111@tpu.ac.za', 1),
	  ('12222@tpu.ac.za', 2),
      ('13333@tpu.ac.za', 3),
      ('14444@tpu.ac.za', 4),
      ('15555@tpu.ac.za', 5),
      ('16666@tpu.ac.za', 6),
      ('17777@tpu.ac.za', 7),
      ('18888@tpu.ac.za', 8),
      ('19999@tpu.ac.za', 9),
      ('21111@tpu.ac.za', 10),
      ('22222@tpu.ac.za', 11),
      ('23333@tpu.ac.za', 12),
      ('24444@tpu.ac.za', 13),
      ('25555@tpu.ac.za', 14),
      ('26666@tpu.ac.za', 15),
      ('27777@tpu.ac.za', 16),
      ('28888@tpu.ac.za', 17),
      ('29999@tpu.ac.za', 18),
      ('31111@tpu.ac.za', 19),
      ('32222@tpu.ac.za', 20);

INSERT INTO nas_programmes (Bachelor_of_science_in_data_science, 
Bachelor_of_science_in_mathematical_and_computer_science)
VALUES('Data Science 2B: large scale data and visualization', 'Linear Algebra'),
	  ('Applications and Analysis of algorithms', 'Linear Programming'),
      ('Database Systems','Database systems'),
      ('Linear Algebra', 'Mathematical Analysis'),
      ('Linear Programming','Statistical inference');
      
SELECT * FROM student_data;
SELECT * FROM student_contact_details;
SELECT * FROM nas_programmes;

 SELECT * FROM student_data 
 JOIN student_contact_details ON student_data.id = student_contact_details.contact_id;
 
-- Transactions 
-- A transaction is a logical unit of work. Each transaction is a sequence of logically related commands
-- that accomplish one task and transform the database from one consistent state into another
-- ANSI has defined standards that govern SQL database transactions
-- Transaction support is provided by two SQL statements: COMMIT and ROLLBACK
-- ANSI Statement Slide 9 - 10 Transaction Management and Concurrency control

-- Start a transaction and commit 
start transaction;

INSERT INTO student_contact_details (student_email, contact_id)
VALUES ('41111@tpu.ac.za', 1);

SELECT * FROM student_contact_details;
-- Commit changes 
commit;
 
 -- Start another transaction and rollback
 start transaction;
 INSERT INTO student_contact_details (student_email, contact_id)
VALUES ('42222@tpu.ac.za', 2);

SELECT * FROM student_contact_details;
-- undo changes 
rollback;

-- Observe transactions states 
-- Active, Partially committed, Failed, Aborted, Committed

-- Rerun select
SELECT * FROM student_contact_details;

-- Save point 
 -- INSERT INTO student_contact_details (student_email, contact_id)
-- VALUES ('43333@tpu.ac.za', 3);
-- commit;
-- SELECT * FROM student_contact_details;

-- update student_contact_details set contact_id = '4' where student_email = '43333@tpu.ac.za';
-- savepoint A;
-- SELECT * FROM student_contact_details;

-- INSERT INTO student_contact_details (student_email, contact_id)
-- VALUES ('45555@tpu.ac.za', 5);
-- savepoint B;
-- SELECT * FROM student_contact_details;

-- INSERT INTO student_contact_details (student_email, contact_id)
-- VALUES ('46666@tpu.ac.za', 6);
-- savepoint C;
-- SELECT * FROM student_contact_details;

-- rollback to B;
-- SELECT * FROM student_contact_details;

 -- rollback to A;
-- SELECT * FROM student_contact_details;



