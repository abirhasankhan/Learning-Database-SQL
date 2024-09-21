# Learning-Database-SQL

This repository documents my journey of learning SQL databases, including lab tasks, assignments, and a final project implemented using **Oracle SQL** and **Oracle APEX**.

## Software Used
- Oracle SQL Developer
- Oracle APEX
- Oracle Database 11g

## Lab Tasks
During lab sessions, I practiced various SQL concepts:
- **Data Definition Language (DDL)**: Creating, altering, and dropping tables.
- **Data Manipulation Language (DML)**: Inserting, updating, and deleting data.
- **Constraints**: Primary keys, foreign keys, and unique constraints.
- **Joins & Subqueries**: Handling complex queries.
- **Stored Procedures, Functions, and Triggers**: Automating and optimizing database operations.
- **Query Optimization**: Improving query performance with indexing and schema design.

## Final Project: Capstone Database

This schema offers a robust structure for managing a Capstone viva examination system, allowing efficient data handling for student marks, faculty boards, scheduling, and project management.


# Schema Overview

## Entities in the Database Schema

### 1. **400A_mark**
- Stores evaluation scores for students based on various CO (Course Objectives) for assessment A (CO1, CO2).
- **Primary Key:** (`student_id`, `faculty_id`)
- **Foreign Keys:**
  - `board_board_number` → `board (board_number)`
  - `group_group_no` → `Group (group_no)`

### 2. **400B_mark**
- Stores evaluation scores for students based on different COs for assessment B (CO3, CO4, CO5, CO6).
- **Primary Key:** (`student_id`, `faculty_id`)
- **Foreign Keys:**
  - `board_board_number` → `board (board_number)`
  - `group_group_no` → `Group (group_no)`

### 3. **Board**
- Represents different boards that conduct viva.
- **Primary Key:** `board_number`

### 4. **Board_member**
- Contains the faculty members assigned to a particular viva board.
- **Primary Key:** `faculty_faculty_id`
- **Foreign Keys:**
  - `faculty_faculty_id` → `faculty (faculty_id)`
  - `board_board_number` → `board (board_number)`

### 5. **Department**
- Stores the departments in the university.
- **Primary Key:** `dept_name`

### 6. **Faculty**
- Represents faculty members, each belonging to a department.
- **Primary Key:** `faculty_id`
- **Foreign Key:**
  - `department_dept_name` → `department (dept_name)`

### 7. **Group**
- Represents student project groups working on a paper.
- **Primary Key:** `group_no`
- **Foreign Keys:**
  - `supervisor_faculty_faculty_id` → `supervisor (faculty_faculty_id)`
  - `paper_paper_id` → `paper (paper_id)`

### 8. **Paper**
- Stores papers authored by student groups.
- **Primary Key:** `paper_id`
- **Foreign Key:**
  - `group_group_no` → `Group (group_no)`

### 9. **Room_no**
- Represents rooms where the viva is conducted.
- **Primary Key:** (`room_no`, `building`)

### 10. **Student**
- Represents students with information on their department and total credits.
- **Primary Key:** `student_id`
- **Foreign Key:**
  - `department_dept_name` → `department (dept_name)`

### 11. **Student_major**
- Records the major for each student and the group they are assigned to.
- **Primary Key:** `student_student_id`
- **Foreign Keys:**
  - `student_student_id` → `student (student_id)`
  - `group_group_no` → `Group (group_no)`

### 12. **Supervisor**
- Represents supervisors for student groups (faculty members).
- **Primary Key:** `faculty_faculty_id`
- **Foreign Key:**
  - `faculty_faculty_id` → `faculty (faculty_id)`

### 13. **Time_slot**
- Stores time slots for viva sessions.
- **Primary Key:** (`start_hr`, `start_min`, `day`, `time_slot_id`)

### 14. **Viva_board**
- Represents viva boards scheduled for various semesters and years.
- **Primary Key:** (`viva_no`, `semester`, `year`)
- **Foreign Keys:**
  - `board_board_number` → `board (board_number)`
  - `room_no_room_no, room_no_building` → `room_no (room_no, building)`
  - `time_slot_start_hr, time_slot_start_min, time_slot_day, time_slot_time_slot_id` → `time_slot (start_hr, start_min, day, time_slot_id)`

---

## Key Features of the Schema

1. **Comprehensive Marks Tracking**
   - The schema is designed to store detailed marks for multiple course objectives (CO1 to CO6), with different tables dedicated to each assessment (`400A_mark`, `400B_mark`).

2. **Board and Faculty Management**
   - The database tracks viva boards, their members, and rooms using relationships between the `board`, `faculty`, `room_no`, and `time_slot` tables.

3. **Student Group and Project Management**
   - The `Group` table manages student project groups, supervised by faculty and tied to specific papers in the `Paper` table.

4. **Scheduling Viva Boards**
   - The `Viva_board` table ties everything together by scheduling viva boards with associated time slots, rooms, and viva board members.

5. **Departmental Relationships**
   - Both students and faculty are associated with their respective departments, which are stored in the `department` table.

6. **Foreign Key Constraints**
   - Foreign keys maintain the integrity of relationships between tables, ensuring that only valid data is inserted across all dependent entities.

7. **Indexes for Optimization**
   - Unique indexes are applied to key fields like `paper_paper_id` in the `Group` table and `group_group_no` in the `Paper` table to optimize query performance.

8. **Time Slot Management**
   - The `Time_slot` table enforces constraints on time and day to ensure that scheduled vivas are well-structured without time conflicts.

