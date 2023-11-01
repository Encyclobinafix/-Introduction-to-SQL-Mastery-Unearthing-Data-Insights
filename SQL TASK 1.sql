--- SQL TASK 1
--- 1. Creating my database
CREATE DATABASE STUDENTS_RECORD;

--- 2. Using the created database
USE STUDENTS_RECORD;

--- 3. Creating a table within the database, titling it "students_info", and adding several columns to the table
CREATE TABLE STUDENTS_INFO (STUDENT_ID INT IDENTITY (1001,1) PRIMARY KEY, GENDER VARCHAR(50), NAME VARCHAR(50), AGE INT, SUBJECT VARCHAR(50));

/* Dropping the table to change the primary key constraint to a different unique ID
---DROP TABLE STUDENTS_INFO;
*/
SELECT * FROM STUDENTS_INFO;

--- 4. Inserting row values into the columns created
INSERT INTO STUDENTS_INFO (GENDER, NAME, AGE, SUBJECT)
VALUES ('Female', 'Sabina ELumelu', 29, 'Physics'),
	   ('Female', 'Daniella Campbell', 28, 'Literature'),
	   ('Male', 'Carlos Ancelotti', 21, 'CRS'),
	   ('Female', 'Eseoghene Oju', 16, 'Introtech'),
	   ('Male', 'Jude Matthews', 37, 'Accounting'),
	   ('Male', 'Harrison Omosor', 33, 'Sociology'),
	   ('Female', 'Mary-Jane Bliss', 25, 'English'),
	   ('Male', 'Mike Denes', 47, 'Mathematics'),
	   ('Male', 'Paul Santos', 42, 'Biology'),
	   ('Female', 'Cynthia Chimdi', 18, 'Government');

SELECT * FROM STUDENTS_INFO;

--- 5. Creating another table titled "health_records", creating columns, and inserting row values to the table. Several constarints were added.
CREATE TABLE HEALTH_RECORDS (HEALTH_ID INT IDENTITY (1001,1) PRIMARY KEY, BLOOD_GROUP VARCHAR(50), HEIGHT DECIMAL(8,2), WEIGHT DECIMAL(8,2));

/* ERRORS IN THE TABLE. To fix this, I dropped the table and modified the decimal constraint by increasing the precision and scale to (8,2), ther re-ran the query.
--- DROP TABLE HEALTH_RECORDS;
*/

SELECT * FROM HEALTH_RECORDS;

INSERT INTO HEALTH_RECORDS (BLOOD_GROUP, HEIGHT, WEIGHT)
VALUES ('A-', 168.88, 70.66),
		('A+', 177.33, 65.65),
		('B-', 181.22, 82.00),
		('B+', 220.44, 100.71),
		('AB-', 154.93, 99.30),
		('AB+', 198.57, 59.99),
		('O-', 167.00, 81.21),
		('O-', 158.45, 72.26),
		('B+', 211.00, 107.70),
		('AB-', 203.30, 85.52);

SELECT * FROM HEALTH_RECORDS;		

/* --- 6. Creating a fact table titled "performance" and inserting columns and row values to the table. 
Establishing a relationshhip between all the tables using referenced foreign keys and primary keys
*/
CREATE TABLE PERFORMANCE (PERFORMANCE_ID INT IDENTITY (1001,1) PRIMARY KEY, STUDENT_ID INT, HEALTH_ID INT, SCORE INT, GRADE VARCHAR(50)
FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS_INFO (STUDENT_ID),
FOREIGN KEY (HEALTH_ID) REFERENCES HEALTH_RECORDS (HEALTH_ID));

INSERT INTO PERFORMANCE (STUDENT_ID, HEALTH_ID, SCORE, GRADE)
VALUES(1001, 1002, 77, 'A'),
      (1007, 1008, 54, 'C'),
	  (1002, 1003, 49, 'D'),
	  (1004, 1005, 32, 'F'),
	  (1009, 1010, 68, 'B'),
	  (1003, 1004, 40, 'E'),
	  (1005, 1006, 89, 'A'),
	  (1008, 1009, 21, 'F'),
	  (1006, 1007, 65, 'B'),
	  (1010, 1001, 47, 'D');

SELECT * FROM PERFORMANCE;

--- 7. Selecting all 3 tables to have a view of all of them at a glance
 SELECT * FROM STUDENTS_INFO;
 SELECT * FROM HEALTH_RECORDS;
 SELECT * FROM PERFORMANCE;

--- 8. Adding Constraints to prevent the student_ID and subject columns from taking null values
ALTER TABLE STUDENTS_INFO
ALTER COLUMN STUDENT_ID INT NOT NULL;

ALTER TABLE STUDENTS_INFO
ALTER COLUMN SUBJECT VARCHAR(50) NOT NULL;

--- 9. Renaming the column name 'subject' to 'course' in the student_info table
EXEC sp_rename 'STUDENTS_INFO.SUBJECT', 'COURSE', 'COLUMN';

SELECT * FROM STUDENTS_INFO

--- 10. Making a copy of the student_info table and duplicating all the data from the original table into it before altering/deleting any column.

SELECT * INTO STUDENT_INFO_COPY FROM STUDENTS_INFO;
SELECT * FROM STUDENT_INFO_COPY

--- 11. Dropping the 'Age' Column from the student_info table
ALTER TABLE STUDENTS_INFO
DROP COLUMN AGE;

SELECT * FROM STUDENTS_INFO
