-- Lab Task 01

-- create a table instructor_your_student_id
create table instructor_2019160013(
       id number,
       name varchar2 (20),
       dept_name varchar2 (20),
       salary number,
       primary key (id)
);

-- create a table course_your_student_id
create table course_2019160013(
       course_id varchar2 (20),
       title varchar2 (30),
       dept_name varchar2 (20),
       credits number,
       primary key (course_id)
);


-- Lab Task 02

-- 1. insert into instructor_your_student_id
insert into instructor_2019160013 values('10101', 'Srinivasan', 'Comp. Sci', 65000);
insert into instructor_2019160013 values('12121', 'Wu', 'Finance', 90000);
insert into instructor_2019160013 values('15151', 'Mozart', 'Music', 40000);
insert into instructor_2019160013 values('22222', 'Einstein', 'Physics', 95000);
insert into instructor_2019160013 values('32343', 'El Said', 'History', 60000);
insert into instructor_2019160013 values('33456', 'Gold', 'Physics', 87000);
insert into instructor_2019160013 values('45565', 'Katz', 'Comp. Sci', 75000);
insert into instructor_2019160013 values('58583', 'Califieri', 'History', 62000);
insert into instructor_2019160013 values('76543', 'Singh', 'Finance', 80000);
insert into instructor_2019160013 values('76766', 'Crick', 'Biology', 72000);
insert into instructor_2019160013 values('83821', 'Brandt', 'Comp. Sci', 92000);
insert into instructor_2019160013 values('98345', 'Kim', 'Elec. Eng', 80000);

-- 2. insert into course_your_student_id
insert into course_2019160013 values('BIO-101', 'Intro. to Biology', 'Biology', 4);
insert into course_2019160013 values('BIO-301', 'Genetics', 'Biology', 4);
insert into course_2019160013 values('BIO-399', 'Computational Biology', 'Biology', 3);
insert into course_2019160013 values('CS-101', 'Intro. to Computer Science', 'Comp. Sci', 4);
insert into course_2019160013 values('CS-109', 'Game Design', 'Comp. Sci', 4);
insert into course_2019160013 values('CS-315', 'Robotics', 'Comp. Sci', 3);
insert into course_2019160013 values('CS-319', 'Image Processing', 'Comp. Sci', 3);
insert into course_2019160013 values('CS-347', 'Database System Concepts', 'Comp. Sci', 3);
insert into course_2019160013 values('EE-181', 'Intro. to Digital System', 'Elec Eng', 3);
insert into course_2019160013 values('FIN-201', 'Investment Banking', 'Finance', 3);
insert into course_2019160013 values('HIS-351', 'World History', 'History', 3);
insert into course_2019160013 values('MU-199', 'Music Video Production', 'Music', 3);
insert into course_2019160013 values('PHY-101', 'Physical Principles', 'Physical', 4);


-- Lab Task 03 (Writing Queries)

-- 1.Show instructor name only
select name
from instructor_2019160013 ;

-- 2.Show course id and title only
select course_id, title
from course_2019160013 ;

-- 3.Find instructor name and department of the instructor with id = 22222
select name, dept_name
from instructor_2019160013
where id=22222;

-- 4.Find course title and credits of the courses offered by ‘Comp. Sci.’ department
select title, credits
from course_2019160013
where dept_name='Comp. Sci';

-- 5.Find name and department of instructors who have a salary more than 70000
select name, dept_name
from instructor_2019160013
where salary>70000;

-- 6.Find course title of the courses which are not less than 4 credits
select title
from course_2019160013
where credits>=4;

-- 7.Find name and department of instructors who have a salary in between 80000 and 100000 (bounds are inclusive)
select name, dept_name
from instructor_2019160013
where (salary>=80000 and salary<=100000);

-- 8.Find course titles and credits of the courses not offered by ‘Comp. Sci.’ department
select title,credits
from course_2019160013
where not dept_name='Comp. Sci';

-- 9.Display all records of instructor table
select * from instructor_2019160013;

-- 10.Find all courses (display all columns) which are offered by ‘Biology’ department and credits is not 4
select *
from course_2019160013
where (dept_name='Biology' and credits != 4);















