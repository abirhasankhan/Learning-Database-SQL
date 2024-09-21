-- CSE302, Section 02
-- Lab 05 Manual

-- Find courses offered in both Fall 2009 
-- and in Spring 2010

SELECT course_id
FROM Section
WHERE semester = 'Fall' and year = 2009
INTERSECT
SELECT course_id
FROM Section
WHERE semester = 'Spring' and year = 2010;

-- solution using IN keyword

SELECT course_id
FROM Section
WHERE semester = 'Fall' and year = 2009 and 
      course_id IN (SELECT course_id
				FROM Section
				WHERE semester = 'Spring' and year = 2010);

-- Find courses offered in Fall 2009 
-- but not in Spring 2010

SELECT course_id
FROM Section
WHERE semester = 'Fall' and year = 2009 and 
      course_id NOT IN (SELECT course_id
				FROM Section
				WHERE semester = 'Spring' and year = 2010);

-- Find student id, name of students from 'Comp. Sci.',
-- 'Physics', and 'Music' department.

SELECT id, name, dept_name
FROM Student
WHERE dept_name IN ('Comp. Sci.','Physics','Music');

SELECT id, name, dept_name
FROM Student
WHERE dept_name NOT IN ('Comp. Sci.','Physics','Music');

-- Find the total number of (distinct) students 
-- who have taken course sections taught by the
-- instructor with ID 10101

SELECT count (DISTINCT id) as Num_of_students
FROM Takes
WHERE (course_id, sec_id, semester, year) IN 
  ( SELECT course_id, sec_id, semester, year
    FROM Teaches
	WHERE id = '10101');
	
SELECT count (DISTINCT id) as Num_of_students
FROM Takes
WHERE (course_id, sec_id, semester, year) NOT IN 
  ( SELECT course_id, sec_id, semester, year
    FROM Teaches
	WHERE id != '10101');
	


-- Comparing tuple from outer query with inner query 
-- SOME / ALL

-- Find names of instructors with salary greater than 
-- that of some (at least one) instructor in the
-- Comp. Sci. department.

SELECT name
FROM instructor
WHERE salary > SOME ( SELECT salary
                      FROM instructor
					  WHERE dept_name = 'Comp. Sci.');


-- Find names of instructors with salary greater than 
-- all instructors in the
-- Comp. Sci. department.

SELECT name
FROM instructor
WHERE salary > ALL ( SELECT salary
                      FROM instructor
					  WHERE dept_name = 'Comp. Sci.');


-- Find id, name and salary of the instructor
-- who gets the highest salary.


SELECT id, name, salary
FROM instructor
WHERE salary = (SELECT max(salary) FROM instructor);

SELECT id, name, salary
FROM instructor
WHERE salary >= ALL (SELECT salary FROM instructor);


-- Find id, name and salary of the instructor
-- who gets the lowest salary.


SELECT id, name, salary
FROM instructor
WHERE salary = (SELECT min(salary) FROM instructor);

SELECT id, name, salary
FROM instructor
WHERE salary <= ALL (SELECT salary FROM instructor);

-- EXISTS/ NOT EXISTS

-- EXISTS will return TRUE if the inner query returns 
-- some ROWS

-- Find courses offered in both Fall 2009 
-- and in Spring 2010

SELECT S.course_id
FROM section S
WHERE semester = 'Fall' and year = 2009
      and EXISTS ( SELECT T.course_id
	               FROM Section T
				   WHERE semester = 'Spring' 
				        and year = 2010
				        and S.course_id = T.course_id);


-- NOT EXISTS will return TRUE if the inner query returns
-- NO ROWS

-- Find all courses taught in Fall 2009 semester 
-- but not in the Spring 2010 semester

SELECT S.course_id
FROM section S
WHERE semester = 'Fall' and year = 2009
      and NOT EXISTS ( SELECT T.course_id
	               FROM Section T
				   WHERE semester = 'Spring' 
				        and year = 2010
				        and S.course_id = T.course_id);

-- Find the total number of (distinct) students 
-- who have not taken any course sections taught by the
-- instructor with ID 10101 (NOT EXISTS - Pending)




-- Find all student id who have taken all courses taught by 
-- insturctor with id 10101

SELECT DISTINCT S.ID
From takes S
WHERE  NOT EXISTS (SELECT course_id, sec_id, semester, year
            FROM teaches
            where id = 10101
			MINUS
			SELECT course_id, sec_id, semester, year
			FROM takes T
			WHERE S.id = T.id
			);

-- Find all students who have 
-- taken all courses offered in the Biology department.
	
-- solved in the textbook


-- Find  student id who have not taken any courses 
-- taught by 
-- insturctor with id 10101

SELECT DISTINCT S.ID
From takes S
WHERE  NOT EXISTS (SELECT course_id, sec_id, semester, year
            FROM teaches
            where id = 10101
			INTERSECT
			SELECT course_id, sec_id, semester, year
			FROM takes T
			WHERE S.id = T.id
			);

-- Find  student id who have  taken at least 1 courses 
-- taught by 
-- insturctor with id 10101	
	
SELECT DISTINCT S.ID
From takes S
WHERE  EXISTS (SELECT course_id, sec_id, semester, year
            FROM teaches
            where id = 10101
			INTERSECT
			SELECT course_id, sec_id, semester, year
			FROM takes T
			WHERE S.id = T.id
			);