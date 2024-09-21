-- CSE 302, Section 2 
-- Lab 05 (Continuation)

-- EXISTS / NOT EXISTS

-- EXISTS returns TRUE if inner query returns any tuples
-- NOT EXISTS returns TRUE if inner query has no tuples

-- Find all courses taught in Fall 2009 semester 
-- but not in the Spring 2010 semester

SELECT A.course_id
FROM section A
WHERE semester = 'Fall' and year = 2009 and
      NOT EXISTS (SELECT B.course_id
					FROM section B
					WHERE semester = 'Spring' and year = 2010
					and A.course_id = B.course_id);


-- Find all students who have taken all courses 
-- offered in the Biology department.

SELECT S.id, S.name
FROM Student S
WHERE NOT EXISTS (SELECT course_id
				  FROM course
				  WHERE dept_name = 'Biology'
				  MINUS
				  SELECT course_id
				  FROM Takes T
				  WHERE S.id = T.id);
				  
-- Find all students who have not taken any courses 
-- offered in the Biology department.

SELECT id, name
FROM Student S
WHERE NOT EXISTS (SELECT course_id
				  FROM course
				  WHERE dept_name = 'Biology'
				  INTERSECT
				  SELECT course_id
				  FROM Takes T
				  WHERE S.id = T.id);
				  
-- Find all students who have taken at least one course 
-- offered in the Biology department.

SELECT id, name
FROM Student S
WHERE EXISTS (SELECT course_id
				  FROM course
				  WHERE dept_name = 'Biology'
				  INTERSECT
				  SELECT course_id
				  FROM Takes T
				  WHERE S.id = T.id);
				  
-- Subqueries in FROM clause

-- The subquery returns a temporary relation 


-- Find the average instructors’ salaries of those departments 
-- where the average salary is greater than $42,000

SELECT dept_name, avg(salary) as avg_sal
FROM instructor
GROUP BY dept_name
HAVING avg(salary) > 42000
ORDER BY avg_sal desc;

-- using subqueries

SELECT dept_name, avg_sal
FROM (SELECT dept_name, avg(salary) as avg_sal
      FROM instructor
	  GROUP BY dept_name) temp
WHERE avg_sal > 42000 ;

-- Find the average salary of instructors of 
-- those departments where at least 2 instructors work.


SELECT dept_name, avg_sal
FROM ( SELECT dept_name, avg(salary) as avg_sal, count(*) as num_inst
		FROM instructor
		GROUP BY dept_name) temp
WHERE num_inst >= 2;

SELECT dept_name, avg(salary) as avg_sal
FROM instructor
GROUP BY dept_name
HAVING Count(*) >= 2;

-- Find all departments where the total salary 
-- is greater than the average of the total salary 
-- at all departments

SELECT dept_name, total_salary, avg_total_salary
FROM (SELECT dept_name, sum(salary) as total_salary
      FROM instructor
	  GROUP BY dept_name) t1,
	  (SELECT avg(total_salary) as avg_total_salary
	  FROM (SELECT dept_name, sum(salary) as total_salary
	        FROM instructor
			GROUP BY dept_name) t2
	  ) t3
WHERE t1.total_salary > t3.avg_total_salary;

-- Solution using HAVING seems irrelevant.

-- WITH Clause (Substitute of FROM clause Subqueries)

WITH t1 as 
    (SELECT dept_name, sum(salary) as total_salary
      FROM instructor
	  GROUP BY dept_name),
	 t3 as 
	(SELECT avg(total_salary) as avg_total_salary
	  FROM t1
	)
SELECT dept_name, total_salary, avg_total_salary
FROM t1, t3
WHERE t1.total_salary > t3.avg_total_salary;
	 
-- Find the department name and the number of instructors
-- of that department which has the highest budget

WITH t1 as (
	SELECT dept_name, count(*) as number_of_inst
	FROM instructor
	GROUP BY dept_name),
	t2 as (
	select dept_name
	FROM department
	WHERE budget = (SELECT max(budget) from department))
SELECT t1.dept_name, t1.number_of_inst
FROM t1, t2
WHERE t1.dept_name = t2.dept_name;

-- Subqueries within SELECT clause

-- Find number of instructors for each department.
SELECT dept_name, count(*) as number_of_inst
FROM instructor
GROUP BY dept_name;

SELECT D.dept_name, (SELECT Count(*) 
					 FROM Instructor I
				     WHERE I.dept_name = D.dept_name)
					 as Number_of_Inst
FROM Department D;

-- Outer Joins

SELECT *
FROM Instructor NATURAL RIGHT JOIN Department;
	  
-- Find number of instructors for each department. 
-- You must include departments with no instructor.	
-- You have to complete it.
		
	  



