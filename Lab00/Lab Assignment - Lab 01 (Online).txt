-- Problem 1

CREATE TABLE course(
    course_id VARCHAR2(6),
    title VARCHAR2(20) NOT NULL,
    dept_name VARCHAR2(10),
    FOREIGN KEY (dept_name) REFERENCES department,
    cred NUMBER,
    PRIMARY KEY (course_id)
);


-- Problem 2

ALTER TABLE course ADD schedule VARCHAR2(20);
---------------------------------------
ALTER TABLE course RENAME COLUMN title to course_title;
---------------------------------------
ALTER TABLE course ADD CONSTRAINT cred
CHECK (cred >= 1 AND cred <= 4.5);

-- Problem 3

INSERT INTO department VALUES ('CSE','MAIN',15000,640);
INSERT INTO department VALUES ('EEE','AB-3',25000,999);
INSERT INTO department VALUES ('ECE','AB-1',10001,433);
INSERT INTO department VALUES ('LAW','MAIN',30500,700);

-- Problem 4

INSERT INTO student_info VALUES ('1010101010','Alice','CSE',95);
INSERT INTO student_info VALUES ('2013014011','Bob','EEE',85);
INSERT INTO student_info VALUES ('3014015011','Charlie','CSE',135);
INSERT INTO student_info VALUES ('4015016011','Danny','ECE',50);
INSERT INTO student_info VALUES ('5016017011','Elton','LAW',35);

-- Problem 5

SELECT S.student_id, S.name
FROM student_info S, department D
WHERE S.dept_name = d.dept_name AND D.building = 'MAIN';
---------------------------------------------------
SELECT S.name, S.tot_cred
FROM student_info S, department D
WHERE (D.budget >=20000 AND D.budget <=30000) AND tot_cred >=50;