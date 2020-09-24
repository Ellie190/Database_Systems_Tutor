CREATE DATABASE student_information;
USE student_information;

CREATE TABLE student_data (
id INT NOT NULL AUTO_INCREMENT,
student_no BIGINT,
first_name VARCHAR(255) NOT NULL,
surname VARCHAR(255) NOT NULL,
programme VARCHAR(255),
PRIMARY KEY (id)
);


CREATE TABLE student_contact_details(
id INT NOT NULL AUTO_INCREMENT, -- to uniquely identify student contact -- 
student_email VARCHAR(255),
contact_id INT NOT NULL, -- we cannot put all student information here so we need to reference it -- 
PRIMARY KEY (id), -- Since it is the primary key for the student data table --
FOREIGN KEY (contact_id) REFERENCES student_data(id) 
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
 
SELECT programme, COUNT(programme) FROM student_data
GROUP BY programme;

SELECT * FROM student_data
ORDER BY first_name;


-- sorting the tables --


SELECT * FROM full_details   -- sort by first name --
ORDER BY first_name;

Select * from full_details  -- sort by surname --
ORDER BY surname;

SELECT *  -- sort by programme --
FROM student_data
order by programme;

select *  -- sorting by student number --
from student_data
order by student_no;
