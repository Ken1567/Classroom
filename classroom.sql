CREATE DATABASE class;

CREATE TABLE students(
 student_id serial PRIMARY KEY NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

INSERT INTO students (student_id, first_name, last_name)
VALUES (1, 'James', 'Russo');
INSERT INTO students (student_id, first_name, last_name)
VALUES (2, 'Aaron', 'Jones');
INSERT INTO students (student_id, first_name, last_name)
VALUES (3, 'Sheila', 'Gray');


CREATE TABLE teachers(
    teacher_id serial PRIMARY KEY NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

INSERT INTO teachers (teacher_id, first_name, last_name)
VALUES (1, 'John', 'Smith');
INSERT INTO teachers (teacher_id, first_name, last_name)
VALUES (2, 'Jane', 'Doe');
INSERT INTO teachers (teacher_id, first_name, last_name)
VALUES (3, 'James', 'Bond');

CREATE TABLE classroom(
    classroom_id serial PRIMARY KEY NOT NULL,
    class_name VARCHAR(50) NOT NULL,
    teacher_id INT REFERENCES teachers(teacher_id)
);

INSERT INTO classroom (classroom_id, class_name)
VALUES (1, 'Biology');
INSERT INTO classroom (classroom_id, class_name)
VALUES (2, 'Algebra');
INSERT INTO classroom (classroom_id, class_name)
VALUES (3, 'Physics');

CREATE TABLE studentClass(
    student_id INT REFERENCES students(student_id),
    classroom_id INT REFERENCES classroom(classroom_id),
    PRIMARY KEY (student_id, classroom_id)
);

INSERT INTO studentClass(student_id, classroom_id)
VALUES (1, 1);
INSERT INTO studentClass(student_id, classroom_id)
VALUES (2, 2);
INSERT INTO studentClass(student_id, classroom_id)
VALUES (3, 3);
INSERT INTO studentClass(student_id, classroom_id)
VALUES (1, 3);


UPDATE classroom SET teacher_id=1 WHERE classroom_id=1;
UPDATE classroom SET teacher_id=2 WHERE classroom_id=2;
UPDATE classroom SET teacher_id=3 WHERE classroom_id=3;

-- QUERY

SELECT students.*, classroom.class_name, teachers.first_name, teachers.last_name 
FROM students 
INNER JOIN studentClass
ON students.student_id = studentClass.student_id
INNER JOIN classroom
ON classroom.classroom_id = studentClass.classroom_id
INNER JOIN teachers
ON teachers.teacher_id = classroom.teacher_id;
