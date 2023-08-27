SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS CAMPUS;
DROP TABLE IF EXISTS ROOM;
DROP TABLE IF EXISTS COURSE;
DROP TABLE IF EXISTS INSTRUCTOR;
DROP TABLE IF EXISTS APPROVED_INSTRUCTOR;
DROP TABLE IF EXISTS CLASS;
DROP TABLE IF EXISTS STUDENT_GRADE;
SET FOREIGN_KEY_CHECKS=1;

/* create tables in the database */
CREATE TABLE STUDENT(
	 STUDENT_ID INT NOT NULL AUTO_INCREMENT
	,Last_Name VARCHAR(255) NOT NULL
    ,First_Name VARCHAR(255) NOT NULL
    ,Address VARCHAR(255)
    ,Zip VARCHAR(100)
    ,Major VARCHAR(255)
    ,Class INT
    ,Status VARCHAR(100)
    ,PRIMARY KEY(STUDENT_ID)
    ,UNIQUE KEY(STUDENT_ID)
);

CREATE TABLE CAMPUS(
	 CAMPUS_NAME VARCHAR(255) NOT NULL
	,Address VARCHAR(255)
    ,Zip VARCHAR(100)
    ,Phone_No VARCHAR(255)
    ,PRIMARY KEY(CAMPUS_NAME)
    ,UNIQUE KEY(CAMPUS_NAME)
);

CREATE TABLE ROOM(
	 ROOM_NO VARCHAR(100) NOT NULL
    ,CAMPUS_NAME VARCHAR(255)
    ,Facility VARCHAR(255)
    ,Capacity INT
    ,PRIMARY KEY(ROOM_NO, CAMPUS_NAME)
    ,FOREIGN KEY(CAMPUS_NAME) REFERENCES CAMPUS(CAMPUS_NAME)
);

CREATE TABLE COURSE(
	 COURSE_NO VARCHAR(100) NOT NULL UNIQUE KEY
    ,Course_Name VARCHAR(255) NOT NULL
    ,CreditHours INT
    ,PRIMARY KEY(COURSE_NO)
    ,UNIQUE KEY(Course_Name)
    ,CONSTRAINT CreditHour_CK CHECK (CreditHours BETWEEN 1 AND 4)
);

CREATE TABLE INSTRUCTOR(
	 INSTRUCTOR_ID VARCHAR(100) NOT NULL
    ,Last_Name VARCHAR(255) NOT NULL
    ,First_Name VARCHAR(255) NOT NULL
    ,Address VARCHAR(255)
    ,Zip VARCHAR(100)
    ,Office_No VARCHAR(100)
    ,PRIMARY KEY(INSTRUCTOR_ID)
    ,UNIQUE KEY(INSTRUCTOR_ID)
);

CREATE TABLE APPROVED_INSTRUCTOR(
	 INSTRUCTOR_ID VARCHAR(100) NOT NULL
    ,COURSE_NO VARCHAR(100) NOT NULL
    ,PRIMARY KEY(INSTRUCTOR_ID, COURSE_NO)
    ,FOREIGN KEY(INSTRUCTOR_ID) REFERENCES INSTRUCTOR(INSTRUCTOR_ID)
    ,FOREIGN KEY(COURSE_NO) REFERENCES COURSE(COURSE_NO)
);

CREATE TABLE CLASS(
	 CLASS_ID VARCHAR(100) NOT NULL UNIQUE KEY
    ,ROOM_NO VARCHAR(100)
    ,Course_No VARCHAR(100)
    ,Section_No VARCHAR(100)
    ,Semester_Name VARCHAR(255)
    ,Years INT
    ,Instructor_ID VARCHAR(100)
    ,Campus_Name VARCHAR(255)
    ,Start_Date DATE
    ,Start_Time TIME
    ,PRIMARY KEY(CLASS_ID, ROOM_NO)
    ,FOREIGN KEY(Campus_Name) REFERENCES ROOM(Campus_Name)
    ,FOREIGN KEY(ROOM_NO) REFERENCES ROOM(ROOM_NO)
);

CREATE TABLE STUDENT_GRADE(
	 STUDENT_ID int NOT NULL auto_increment
    ,CLASS_ID VARCHAR(100) NOT NULL
    ,Student_Grade VARCHAR(1) NOT NULL
    ,PRIMARY KEY(STUDENT_ID, CLASS_ID)
    ,FOREIGN KEY(STUDENT_ID) REFERENCES STUDENT(STUDENT_ID)
    ,FOREIGN KEY(CLASS_ID) REFERENCES CLASS(CLASS_ID)
    ,CONSTRAINT StudentGrade_CK CHECK (Student_Grade IN ('A','B','C','D','E','F','W'))
);

COMMIT;

/* insert rows into the Campus table */
INSERT INTO CAMPUS(CAMPUS_NAME, Address, Zip, Phone_No) 
VALUES('Central Valley', '96007 Fremont Terrace, Sacromento', '95897', '916-966-1505');
INSERT INTO CAMPUS(CAMPUS_NAME, Address, Zip, Phone_No) 
VALUES('Imperial Valley', '73101 Anzinger Road, El Centro', '92143', '619-317-3040');
INSERT INTO CAMPUS(CAMPUS_NAME, Address, Zip, Phone_No)
VALUES('Riverside Valley', '61985 Oak Valley Place, Riverside', '90875', '718-958-2652');
INSERT INTO CAMPUS(CAMPUS_NAME, Address, Zip, Phone_No)
VALUES('San Fernando Valley', '71800 Everett Alley, Burbank', '65140', '592-390-4910');
INSERT INTO CAMPUS(CAMPUS_NAME, Address, Zip, Phone_No)
VALUES('Mission Valley', '76002 Claremont Court, Calabasas', '60146', '558-461-9919');

/* insert rows into the Course table */
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('CS-101', 'Introduction to Cloud Computing', 3);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours)
VALUES('CS-102', 'Data Structures and Algorithm', 4);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours)
VALUES('CS-103', 'Mobile App Development', 3);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('CS-201', 'Advanced Mobile App Development', 4);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('CS-202', 'Advanced Web Development', 3);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours)
VALUES('IT-101', 'Operational Excellence', 2);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('IT-102', 'Data Visualization', 3);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('IT-201', 'System Analysis and Design', 3);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('IT-202', 'Database Systems', 3);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('MATH-101', 'Introduction to Algebra', 2);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('MATH-102', 'Statiscal Analysis and Computing', 4);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('MATH-201', 'Introduction to Calculus', 3);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('PHY-101', 'Introduction to Electromagnetism', 3);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('PHY-102', 'Electricity and Magnetism', 3);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('PHY-201', 'Introduction to Quantum Theory', 3);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('PHY-301', 'Quatum Physics', 3);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('CPT-101', 'Regular CPT', 1);
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours)
VALUES('CPT-102', 'Day 1 CPT', 1);

/* insert invalid credit hour into the Course table */
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('CS-203', 'Advanced Cloud Computing', 6);

/* insert null as course name into the Course table */
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours)
VALUES('CS-203', NULL, 3);

/* insert a duplicate course name into the Course table */
INSERT INTO COURSE(COURSE_NO, Course_Name, CreditHours) 
VALUES('IT-202', 'Database Systems', 3);

/* insert rows into the Room table */
INSERT INTO ROOM(ROOM_NO, CAMPUS_NAME, Facility, Capacity)
VALUES('1110', 'Central Valley', 'Erode', 30);
INSERT INTO ROOM(ROOM_NO, CAMPUS_NAME, Facility, Capacity)
VALUES('1111', 'Central Valley', 'Zura', 10);
INSERT INTO ROOM(ROOM_NO, CAMPUS_NAME, Facility, Capacity)
VALUES('2111', 'Imperial Valley', 'South Hall', 20);
INSERT INTO ROOM(ROOM_NO, CAMPUS_NAME, Facility, Capacity)
VALUES('2112', 'Imperial Valley', 'North Hall', 40);
INSERT INTO ROOM(ROOM_NO, CAMPUS_NAME, Facility, Capacity)
VALUES('3111', 'Mission Valley', 'Tenocha', 35);
INSERT INTO ROOM(ROOM_NO, CAMPUS_NAME, Facility, Capacity)
VALUES('3112', 'Mission Valley', 'Tenocha', 50);
INSERT INTO ROOM(ROOM_NO, CAMPUS_NAME, Facility, Capacity)
VALUES('4111', 'San Fernando Valley', 'Hardy Tower', 35);
INSERT INTO ROOM(ROOM_NO, CAMPUS_NAME, Facility, Capacity)
VALUES('4112', 'San Fernando Valley', 'Scripps Tower', 57);
INSERT INTO ROOM(ROOM_NO, CAMPUS_NAME, Facility, Capacity)
VALUES('6111', 'Riverside Valley', 'Nasatir Hall', 23);
INSERT INTO ROOM(ROOM_NO, CAMPUS_NAME, Facility, Capacity)
VALUES('6112', 'Riverside Valley', 'Storm Hall', 61);

/* insert rows into the Instructor table */
INSERT INTO INSTRUCTOR(INSTRUCTOR_ID, Last_Name, First_Name, Address, Zip, Office_No) 
VALUES('STF-110', 'Whitney', 'Roger', '96007 Fremont Terrace, Sacromento', '95897', 'B01-1100');
INSERT INTO INSTRUCTOR(INSTRUCTOR_ID, Last_Name, First_Name, Address, Zip, Office_No)
VALUES('STF-111', 'Smith', 'Clark', '71800 Everett Alley, Burbank', '65140', 'B02-1101');
INSERT INTO INSTRUCTOR(INSTRUCTOR_ID, Last_Name, First_Name, Address, Zip, Office_No)
VALUES('STF-202', 'Elfenbaum', 'Maricie', '73101 Anzinger Road, El Centro', '92143', 'B02-1102');
INSERT INTO INSTRUCTOR(INSTRUCTOR_ID, Last_Name, First_Name, Address, Zip, Office_No)
VALUES('STF-113', 'Raman', 'Sudha', '76002 Claremont Court, Calabasas', '60146', 'B01-1101');
INSERT INTO INSTRUCTOR(INSTRUCTOR_ID, Last_Name, First_Name, Address, Zip, Office_No)
VALUES('STF-201', 'McGee', 'Timothy', '61985 Oak Valley Place, Riverside','90875', 'B01-1102');
INSERT INTO INSTRUCTOR(INSTRUCTOR_ID, Last_Name, First_Name, Address, Zip, Office_No)
VALUES('STF-115', 'Eckberg', 'Robert', '73101 Anzinger Road, El Centro', '92143', 'A02-1103');
INSERT INTO INSTRUCTOR(INSTRUCTOR_ID, Last_Name, First_Name, Address, Zip, Office_No)
VALUES('STF-116', 'Michael', 'Chad', '96007 Fremont Terrace, Sacromento', '95897', 'B01-1101');
INSERT INTO INSTRUCTOR(INSTRUCTOR_ID, Last_Name, First_Name, Address, Zip, Office_No)
VALUES('STF-117', 'Robles', 'Marcus', '71800 Everett Alley, Burbank', '65140', 'B02-1102');
INSERT INTO INSTRUCTOR(INSTRUCTOR_ID, Last_Name, First_Name, Address, Zip, Office_No)
VALUES('STF-118', 'Dinozzo', 'Ziva', '76002 Claremont Court, Calabasas', '60146', 'B01-1103');
INSERT INTO INSTRUCTOR(INSTRUCTOR_ID, Last_Name, First_Name, Address, Zip, Office_No)
VALUES('STF-305', 'Palmer', 'Jimmy', '61985 Oak Valley Place, Riverside','90875', 'D21-1212');


/* insert rows with NULL last name and first name into the Instructor table */
INSERT INTO INSTRUCTOR(INSTRUCTOR_ID, Last_Name, First_Name, Address, Zip, Office_No) 
VALUES('STF-120', NULL, 'Elon', '61985 Oak Valley Place, Riverside', '90875', 'A101-2036');
INSERT INTO INSTRUCTOR(INSTRUCTOR_ID, Last_Name, First_Name, Address, Zip, Office_No)
VALUES('STF-121', 'David', NULL, '73101 Anzinger Road, El Centro', '92143', 'A101-2036');

/* insert rows into the Approved_Instructor table */
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-110', 'CS-103');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-110', 'CS-201');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-110', 'CS-202');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-110', 'IT-202');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-111', 'IT-101');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-111', 'CS-102');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-113', 'PHY-101');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-113', 'PHY-301');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-113', 'PHY-201');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-113', 'PHY-102');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-115', 'IT-101');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-116', 'MATH-101');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-116', 'MATH-201');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-117', 'CPT-102');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-117', 'CPT-101');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-118', 'PHY-301');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-118', 'IT-102');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-201', 'IT-102');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-201', 'IT-202');
INSERT INTO APPROVED_INSTRUCTOR(INSTRUCTOR_ID, COURSE_NO)
VALUES('STF-201', 'MATH-102');

/* insert rows into the Class table */
INSERT INTO CLASS(CLASS_ID, ROOM_NO, Course_No, Section_No, Semester_Name, Years, Instructor_ID, Campus_Name, Start_Date, Start_Time)
VALUES('CLS-1200', '1111', 'CS-101', '123', 'Spring', 615, 'STF-111', 'Central Valley', '2014-10-08', '19:00');
INSERT INTO CLASS(CLASS_ID, ROOM_NO, Course_No, Section_No, Semester_Name, Years, Instructor_ID, Campus_Name, Start_Date, Start_Time)
VALUES('CLS-1201', '2112', 'CS-102', '478', 'Fall', 615, 'STF-111', 'Imperial Valley', '2018-10-08', '10:00');
INSERT INTO CLASS(CLASS_ID, ROOM_NO, Course_No, Section_No, Semester_Name, Years, Instructor_ID, Campus_Name, Start_Date, Start_Time)
VALUES('CLS-1202', '3111', 'PHY-102', '294', 'Summer', 615, 'STF-113', 'Mission Valley', '2013-10-20', '15:00');
INSERT INTO CLASS(CLASS_ID, ROOM_NO, Course_No, Section_No, Semester_Name, Years, Instructor_ID, Campus_Name, Start_Date, Start_Time)
VALUES('CLS-1203', '3112', 'IT-102', '908', 'Winter', 615, 'STF-201', 'Mission Valley', '2018-10-10', '16:00');
INSERT INTO CLASS(CLASS_ID, ROOM_NO, Course_No, Section_No, Semester_Name, Years, Instructor_ID, Campus_Name, Start_Date, Start_Time)
VALUES('CLS-1204', '2112', 'IT-101', '235', 'Fall', 615, 'STF-115', 'Imperial Valley', '2018-10-28', '11:00');


/* insert rows into the Student table */
INSERT INTO STUDENT(Last_Name, First_Name, Address, Zip, Major, Class, Status)
VALUES('Schuito', 'Abby', '93995 Bultman Circle, 19th Floor', '5300', 'PHYSICS', 4, 'GRADUATED');
INSERT INTO STUDENT(Last_Name, First_Name, Address, Zip, Major, Class, Status)
VALUES('Gibbs', 'Emily', '77 Eliot Place, Apt 1280', '4950', 'MATHEMATICS', 2, 'SATISFACTORY');
INSERT INTO STUDENT(Last_Name, First_Name, Address, Zip, Major, Class, Status)
VALUES('McGee', 'Tim', '7 Nobel Junction, Apt 88', '39970', 'COMPUTER SCIENCE', 4, 'SATISFACTORY');
INSERT INTO STUDENT(Last_Name, First_Name, Address, Zip, Major, Class, Status)
VALUES('Diaz', 'Henry', 'PO Box 52048, 02 Ramsey Circle', '663620', 'INFORMATION TECHNOLOGY', 3, 'SATISFACTORY');
INSERT INTO STUDENT(Last_Name, First_Name, Address, Zip, Major, Class, Status)
VALUES('Wright', 'Jerry', '55260 Melby Place, Apt 1557', '19130', 'PHYSICS', 4, 'FAILING');
INSERT INTO STUDENT(Last_Name, First_Name, Address, Zip, Major, Class, Status)
VALUES('Rodriguez', 'Ruben', '38145 Superior Road, Apt 1675', '92123', 'COMPUTER SCIENCE', 4, 'SATISFACTORY');
INSERT INTO STUDENT(Last_Name, First_Name, Address, Zip, Major, Class, Status)
VALUES('Zuckerberg', 'Mark', '360 Lake View Terrace, 16th Floor', '86018', 'COMPUTER SCIENCE', 5, 'FAILING');
INSERT INTO STUDENT(Last_Name, First_Name, Address, Zip, Major, Class, Status)
VALUES('Bellasario', 'Maria', '8895 Toban Road, Room 1978', '49160', 'INFORMATION TECHNOLOGY', 3, 'GRADUATED');
INSERT INTO STUDENT(Last_Name, First_Name, Address, Zip, Major, Class, Status)
VALUES('Mejia', 'Fili', '928 Dovetail Parkway, Apt 1139', '43268', 'INFORMATION TECHNOLOGY', 5, 'FAILING');
INSERT INTO STUDENT(Last_Name, First_Name, Address, Zip, Major, Class, Status)
VALUES('Vaidya', 'Archana', '96952 Park Meadow Pass, Suite 55', '74120', 'MATHEMATICS', 3, 'FAILING');

/* insert last name as null into Student table */
INSERT INTO STUDENT(Last_Name, First_Name, Address, Zip, Major, Class, Status)
VALUES(NULL, 'Kate', '2328 Petterle Avenue, 5th Floor', '28990', 'COMPUTER SCIENCE', 1, 'SATISFACTORY');
INSERT INTO STUDENT(Last_Name, First_Name, Address, Zip, Major, Class, Status)
VALUES('Beckett', NULL, '0236 Melrose Center, PO Box 15229', '66105', 'PHYSICS', 4, 'FAILING');

/* insert rows into the Student_Grade table */
INSERT INTO STUDENT_GRADE(STUDENT_ID, CLASS_ID, Student_Grade)
VALUES('1', 'CLS-1202', 'A');
INSERT INTO STUDENT_GRADE(STUDENT_ID, CLASS_ID, Student_Grade)
VALUES('3', 'CLS-1200', 'A');
INSERT INTO STUDENT_GRADE(STUDENT_ID, CLASS_ID, Student_Grade)
VALUES('2', 'CLS-1202', 'B');
INSERT INTO STUDENT_GRADE(STUDENT_ID, CLASS_ID, Student_Grade)
VALUES('4', 'CLS-1203', 'D');
INSERT INTO STUDENT_GRADE(STUDENT_ID, CLASS_ID, Student_Grade)
VALUES('3', 'CLS-1201', 'E');
INSERT INTO STUDENT_GRADE(STUDENT_ID, CLASS_ID, Student_Grade)
VALUES('4', 'CLS-1204', 'A');
INSERT INTO STUDENT_GRADE(STUDENT_ID, CLASS_ID, Student_Grade)
VALUES('9', 'CLS-1203', 'F');

/* insert invalid grade into Student_Grade table */
INSERT INTO STUDENT_GRADE(STUDENT_ID, CLASS_ID, Student_Grade)
VALUES('8', 'CLS-1201', 'I');

COMMIT;
SHOW tables;
SELECT * FROM CAMPUS;
SELECT * FROM COURSE;
SELECT * FROM INSTRUCTOR;
SELECT * FROM APPROVED_INSTRUCTOR;
SELECT * FROM ROOM;
SELECT * FROM CLASS;
SELECT * FROM STUDENT;
SELECT * FROM STUDENT_GRADE;
