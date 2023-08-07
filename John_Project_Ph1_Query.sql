/* Query # 1	Write a SQL statement to produce output as follows: Student’s First and Last Name. */
SELECT First_Name, Last_Name FROM STUDENT;

/* Query # 2	Write a SQL statement to produce output as follows: the Major of the STUDENT with no duplications. Do not display student names. */
SELECT distinct MAJOR FROM STUDENT;

/* Query # 3	Write a SQL statement to produce output as follows: First and Last Name of students who live in the Zip code 32828.  */
SELECT First_Name, Last_Name FROM STUDENT WHERE Zip = '32828';

/* Query # 4	Write a SQL statement to produce output as follows: First and Last Name of students who live in the Zip code 97912 and have the major of CS.  */
SELECT First_Name, Last_Name FROM STUDENT WHERE Zip = '97912' AND MAJOR = 'CS';

/* Query # 5	Write a SQL statement to produce output as follows: First and Last Name of students who live in the Zip code 32826 or 33186. Do not use IN. */
SELECT First_Name, Last_Name FROM STUDENT WHERE Zip = '32826' OR Zip = '33186';

/* Query # 6	Write a SQL statement to produce output as follows: the First and Last Name of students who have the major of Business or Math. Use IN. */
SELECT First_Name, Last_Name FROM STUDENT WHERE MAJOR IN ('BUSINESS', 'MATHEMATICS');

/* Query # 7	Write a SQL statement to produce output as follows: the First and Last Name of students who have the Class greater than 1 and less than 5. Use BETWEEN.  */
SELECT First_Name, Last_Name FROM STUDENT WHERE Class BETWEEN 2 AND 4;

/* Query # 8	Write a SQL statement to produce output as follows: First and Last Name of students who have the Last name that starts with an M. */
SELECT First_Name, Last_Name FROM STUDENT WHERE Last_Name LIKE 'M%';

/* Query # 9	Write a SQL statement to produce output as follows: First and Last name of students having an o in the second position in their First Name. */
SELECT First_Name, Last_Name FROM STUDENT WHERE First_Name LIKE '_o%';

/* Query # 10	Write a SQL expression to produce output as follows: display the Status for, and the number of occurrences that apply to each status. You must use the Count(*) function. You must show the result of the Count(*) function as CountStatus. Group by Status and output the results in ascending order of CountStatus. */
SELECT STATUS, count(*) AS CountStatus FROM STUDENT group by STATUS order by CountStatus;