 CREATE TABLE "400A_MARK"( 
    BOARD_NUMBER         NUMBER(5),
    faculty_id           VARCHAR2(15) NOT NULL,
    GROUP_NO             VARCHAR2(10) NOT NULL,
    student_id           VARCHAR2(15) NOT NULL,
    co1_c2               NUMBER(3,1) check (co1_c2 >= 0 and co1_c2 <= 20),
    co1_c3               NUMBER(3,1) check (co1_c3 >= 0 and co1_c3 <= 25),
    co2_c4               NUMBER(3,1) check (co2_c4 >= 0 and co2_c4 <= 15),
    co2_c5               NUMBER(3,1) check (co2_c5 >= 0 and co2_c5 <= 15),
    co2_c6               NUMBER(3,1) check (co2_c6 >= 0 and co2_c6 <= 15),
    co2_p2               NUMBER(3,1) check (co2_p2 >= 0 and co2_p2 <= 3),
    co2_p3               NUMBER(3,1) check (co2_p3 >= 0 and co2_p3 <= 4),
    co2_p4               NUMBER(3,1) check (co2_p4 >= 0 and co2_p4 <= 3),
    foreign key (faculty_id) references FACULTY(faculty_id),
    foreign key (student_id) references STUDENT_MAJOR(STUDENT_STUDENT_ID),
    primary key (faculty_id, student_id)
);

CREATE TABLE "400B_mark" (
    BOARD_NUMBER         NUMBER(5),
    faculty_id           VARCHAR2(15) NOT NULL,
    GROUP_NO             VARCHAR2(10) NOT NULL,
    student_id           VARCHAR2(15) NOT NULL,
    co3_c2               NUMBER(3,1) check (co3_c2 >= 0 and co3_c2 <= 5),
    co3_c3               NUMBER(3,1) check (co3_c3 >= 0 and co3_c3 <= 5),
    co3_c4               NUMBER(3,1) check (co3_c4 >= 0 and co3_c4 <= 5),
    co3_c5               NUMBER(3,1) check (co3_c5 >= 0 and co3_c5 <= 5),
    co4_c6               NUMBER(3,1) check (co4_c6 >= 0 and co4_c6 <= 50),
    co4_a4               NUMBER(3,1) check (co4_a4 >= 0 and co4_a4 <= 10),
    co5_c2               NUMBER(3,1) check (co5_c2 >= 0 and co5_c2 <= 5),
    co5_p2               NUMBER(3,1) check (co5_p2 >= 0 and co5_p2 <= 5),
    co5_p3               NUMBER(3,1) check (co5_p3 >= 0 and co5_p3 <= 5),
    co6_c3               NUMBER(3,1) check (co6_c3 >= 0 and co6_c3 <= 2.5),
    co6_a4               NUMBER(3,1) check (co6_a4 >= 0 and co6_a4 <= 2.5),
    foreign key (faculty_id) references FACULTY(faculty_id),
    foreign key (student_id) references STUDENT_MAJOR(STUDENT_STUDENT_ID),
    primary key (faculty_id, student_id)
);


-- C01
create table CO1_MARK(
     student_id  VARCHAR2(15),
     faculty_id  VARCHAR2(15),
     C2          NUMBER,
     C3          NUMBER,
     total_mark  NUMBER,
     foreign key (faculty_id) references FACULTY(faculty_id),
     foreign key (student_id) references STUDENT_MAJOR(STUDENT_STUDENT_ID),
     primary key (faculty_id, student_id)
);

create or replace trigger CO1_MARK_trigger
after insert on "400A_MARK" 
for each row
declare
       sum NUMBER;
begin
     sum := :new.CO1_C2 + :new.CO1_C3;
     insert into CO1_MARK(student_id, faculty_id, C2, C3, total_mark) values(:new.student_id, :new.faculty_id, :new.CO1_C2, :new.CO1_C3, sum);
end;

-- C02
create table CO2_MARK(
     student_id  VARCHAR2(15),
     faculty_id  VARCHAR2(15),
     C4          NUMBER,
     C5          NUMBER,
     C6          NUMBER,
     P2          NUMBER,
     P3          NUMBER,
     P4          NUMBER,
     total_mark  NUMBER,
     foreign key (faculty_id) references FACULTY(faculty_id),
     foreign key (student_id) references STUDENT_MAJOR(STUDENT_STUDENT_ID),
     primary key (faculty_id, student_id)
);

create or replace trigger CO2_MARK_trigger
after insert on "400A_MARK" 
for each row
declare
    sum NUMBER;
begin
    sum := :new.co2_c4 + :new.co2_c5 + :new.co2_c6 + :new.co2_p2 + :new.co2_p3 + :new.co2_p4;
    insert into CO2_MARK(student_id, faculty_id, C4, C5, C6, P2, P3, P4, total_mark) values(:new.student_id, :new.faculty_id, :new.co2_c4, :new.co2_c5, :new.co2_c6, :new.co2_p2, :new.co2_p3, :new.co2_p4, sum);
end;


-- C03
create table CO3_MARK(
     student_id  VARCHAR2(15),
     faculty_id  VARCHAR2(15),
     C2          NUMBER,
     C3          NUMBER,
     C4          NUMBER,
     C5          NUMBER,
     total_mark  NUMBER,
     foreign key (faculty_id) references FACULTY(faculty_id),
     foreign key (student_id) references STUDENT_MAJOR(STUDENT_STUDENT_ID),
     primary key (faculty_id, student_id)
);

create or replace trigger CO3_MARK_trigger
after insert on "400B_mark" 
for each row
declare
       sum NUMBER;
begin
     sum := :new.CO3_C2 + :new.CO3_C3 + :new.CO3_C4 + :new.CO3_C5;
     insert into CO3_MARK(student_id, faculty_id, C2, C3, C4, C5, total_mark) values(:new.student_id, :new.faculty_id, :new.CO3_C2, :new.CO3_C3, :new.CO3_C4, :new.CO3_C5, sum);
end;


-- C04
create table CO4_MARK(
     student_id  VARCHAR2(15),
     faculty_id  VARCHAR2(15),
     C6          NUMBER,
     A4          NUMBER,
     total_mark  NUMBER,
     foreign key (faculty_id) references FACULTY(faculty_id),
     foreign key (student_id) references STUDENT_MAJOR(STUDENT_STUDENT_ID),
     primary key (faculty_id, student_id)
);

create or replace trigger CO4_MARK_trigger
after insert on "400B_mark"
for each row
declare
       sum NUMBER;
begin
     sum := :new.CO4_C6 + :new.CO4_A4;
     insert into CO4_MARK(student_id, faculty_id, C6, A4, total_mark) values(:new.student_id, :new.faculty_id, :new.CO4_C6, :new.CO4_A4, sum);
end;


-- C05
create table CO5_MARK(
     student_id  VARCHAR2(15),
     faculty_id  VARCHAR2(15),
     C2          NUMBER,
     P2          NUMBER, 
     P3          NUMBER,
     total_mark  NUMBER,
     foreign key (faculty_id) references FACULTY(faculty_id),
     foreign key (student_id) references STUDENT_MAJOR(STUDENT_STUDENT_ID),
     primary key (faculty_id, student_id)
);

create or replace trigger CO5_MARK_trigger
after insert on "400B_mark" 
for each row
declare
       sum NUMBER;
begin
     sum := :new.CO5_C2 + :new.CO5_P2 + :new.CO5_P3;
     insert into CO5_MARK(student_id, faculty_id, C2, P2, P3, total_mark) values(:new.student_id, :new.faculty_id, :new.CO5_C2, :new.CO5_P2, :new.CO5_P3, sum);
end;


-- C06
create table CO6_MARK(
     student_id  VARCHAR2(15),
     faculty_id  VARCHAR2(15),
     C3          NUMBER,
     A4          NUMBER,
     total_mark  NUMBER,
     foreign key (faculty_id) references FACULTY(faculty_id),
     foreign key (student_id) references STUDENT_MAJOR(STUDENT_STUDENT_ID),
     primary key (faculty_id, student_id)
);

create or replace trigger CO6_MARK_trigger
after insert on "400B_mark"
for each row
declare
       sum NUMBER;
begin
     sum := :new.CO6_C3 + :new.CO6_A4;
     insert into CO6_MARK(student_id, faculty_id, C3, A4, total_mark) values(:new.student_id, :new.faculty_id, :new.CO6_C3, :new.CO6_A4, sum);
end;


-- 400A

create table "400A_MARK_BY_FACULTY"(
    BOARD_NUMBER         NUMBER(5),
    faculty_id           VARCHAR2(15) NOT NULL,
    GROUP_NO             VARCHAR2(10) NOT NULL,
    student_id           VARCHAR2(15) NOT NULL,
    co1_c2               NUMBER,
    co1_c3               NUMBER,
    co2_c4               NUMBER,
    co2_c5               NUMBER,
    co2_c6               NUMBER,
    co2_p2               NUMBER,
    co2_p3               NUMBER,
    co2_p4               NUMBER,
    total_mark           NUMBER,
    foreign key (faculty_id) references FACULTY(faculty_id),
    foreign key (student_id) references STUDENT_MAJOR(STUDENT_STUDENT_ID),
    primary key (faculty_id, student_id)
);

create or replace trigger MARK_400A_BY_FACULTY_trigger
after insert on "400A_MARK" 
for each row
declare
      sum NUMBER;
begin
     sum := :new.CO1_C2 + :new.CO1_C3 + :new.CO2_C4 + :new.CO2_C5 + :new.CO2_C6 + :new.CO2_P2 + :new.CO2_P3 + :new.CO2_P4;
     insert into "400A_MARK_BY_FACULTY"(BOARD_NUMBER, faculty_id, GROUP_NO, student_id, co1_c2, co1_c3, co2_c4, co2_c5, co2_c6, co2_p2, co2_p3, co2_p4, total_mark) values(:new.BOARD_NUMBER, :new.faculty_id, :new.GROUP_NO, :new.student_id, :new.CO1_C2, :new.CO1_C3, :new.CO2_C4, :new.CO2_C5, :new.CO2_C6, :new.CO2_P2, :new.CO2_P3, :new.CO2_P4, sum);
end;


create table 400A_MARK_BY_FACULTY(
    BOARD_NUMBER         NUMBER(5),
    faculty_id           VARCHAR2(15) NOT NULL,
    GROUP_NO             VARCHAR2(10) NOT NULL,
    student_id           VARCHAR2(15) NOT NULL,
    total_mark           NUMBER,
    foreign key (faculty_id) references FACULTY(faculty_id),
    foreign key (student_id) references STUDENT_MAJOR(STUDENT_STUDENT_ID),
    primary key (faculty_id, student_id)
);


create table TOTAL_400A_MARK(
    GROUP_NO             VARCHAR2(10) NOT NULL,
    student_id           VARCHAR2(15) NOT NULL,
    avg_total            NUMBER,
     mark_by_super       NUMBER,
    foreign key (student_id) references STUDENT_MAJOR(STUDENT_STUDENT_ID),
    primary key (student_id)
);

create or replace trigger TOTAL_400A_MARK_trigger
after insert on 400A_MARK_BY_FACULTY 
for each row
declare
      sum NUMBER;
      avg NUMBER;
      super_number
begin
     avg := new.(select avg(total_mark) AS avg_total 
             from 400A_MARK_BY_FACULTY
             GROUP BY BOARD_NUMBER);
     sum := :new.CO1_C2 + :new.CO1_C3 + :new.CO2_C4 + :new.CO2_C5 + :new.CO2_C6 + :new.CO2_P2 + :new.CO2_P3 + :new.CO2_P4;
     sum := (:avg%30) + 
     insert into 400A_MARK_BY_FACULTY(BOARD_NUMBER, faculty_id, GROUP_NO, student_id, total_mark) values(:new.BOARD_NUMBER, :new.faculty_id :new.student_id, :new.faculty_id, sum);
     select avg(total_mark) AS avg_total,
             from 400A_MARK_BY_FACULTY
             GROUP BY BOARD_NUMBER;
     select mark_by_super,
            from 400A_MARK_BY_FACULTY
            where BOARD_NUMBER = null;
end;


-- 400B

CREATE TABLE "400B_MARK_BY_FACULTY"(
    BOARD_NUMBER         NUMBER(5),
    faculty_id           VARCHAR2(15) NOT NULL,
    GROUP_NO             VARCHAR2(10) NOT NULL,
    student_id           VARCHAR2(15) NOT NULL,
    co3_c2               NUMBER,
    co3_c3               NUMBER,
    co3_c4               NUMBER,
    co3_c5               NUMBER,
    co4_c6               NUMBER,
    co4_a4               NUMBER,
    co5_c2               NUMBER,
    co5_p2               NUMBER,
    co5_p3               NUMBER,
    co6_c3               NUMBER,
    co6_a4               NUMBER,
    total_mark           NUMBER,
    foreign key (faculty_id) references FACULTY(faculty_id),
    foreign key (student_id) references STUDENT_MAJOR(STUDENT_STUDENT_ID),
    primary key (faculty_id, student_id)
);

create or replace trigger MARK_400B_BY_FACULTY_trigger
after insert on "400B_mark" 
for each row
declare
      sum NUMBER;
begin
     sum := :new.co3_c2 + :new.co3_c3 + :new.co3_c4 + :new.co3_c5 + :new.co4_c6 + :new.co4_a4 + :new.co5_c2 + :new.co5_p2 + :new.co5_p3 + :new.co6_c3 + :new.co6_c3;
     insert into "400B_MARK_BY_FACULTY"(BOARD_NUMBER, faculty_id, GROUP_NO, student_id, co3_c2, co3_c3, co3_c4, co3_c5, co4_c6, co4_a4, co5_c2, co5_p2, co5_p3, co6_c3, co6_a4, total_mark) values(:new.BOARD_NUMBER, :new.faculty_id, :new.GROUP_NO, :new.student_id, :new.co3_c2, :new.co3_c3, :new.co3_c4, :new.co3_c5, :new.co4_c6, :new.co4_a4, :new.co5_c2, :new.co5_p2, :new.co5_p3, :new.co6_c3, :new.co6_c3, sum);
end;



create table 400B_MARK_BY_FACULTY(
    BOARD_NUMBER         NUMBER(5),
    faculty_id           VARCHAR2(15) NOT NULL,
    GROUP_NO             VARCHAR2(10) NOT NULL,
    student_id           VARCHAR2(15) NOT NULL,
    total_mark           NUMBER,
    foreign key (faculty_id) references FACULTY(faculty_id),
    foreign key (student_id) references STUDENT_MAJOR(STUDENT_STUDENT_ID),
    primary key (faculty_id, student_id)
);

create table TOTAL_400B_MARK(
    GROUP_NO             VARCHAR2(10) NOT NULL,
    student_id           VARCHAR2(15) NOT NULL,
    total_mark           NUMBER
    foreign key (student_id) references STUDENT_MAJOR(STUDENT_STUDENT_ID),
    primary key (student_id)
);
