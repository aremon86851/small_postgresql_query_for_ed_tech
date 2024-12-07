-- query 1:
INSERT INTO
    students (
        name,
        age,
        email,
        frontend_mark,
        backend_mark,
        status
    )
VALUES (
        'YourName',
        YourAge,
        'YourEmail',
        YourMark,
        YourMark,
        NULL
    );

-- Query 2:
-- Retrieve the names of all students who are enrolled in the course titled 'Next.js'.

SELECT student_name
from
    enrollment
    INNER JOIN students ON students.student_id = enrollment.student_id
    INNER JOIN courses on courses.course_id = enrollment.course_id
WHERE
    courses.course_name = 'Next.js';

-------

-- Query 3:
-- Update the status of the student with the highest total (frontend_mark + backend_mark) mark to 'Awarded'

UPDATE students
SET
    status = 'Awarded'
WHERE
    frontend_mark = (
        SELECT max(frontend_mark)
        FROM students
    )
    AND backend_mark = (
        SELECT max(backend_mark)
        from students
    );

SELECT * from students;

--------
-- Query 4:
-- Delete all courses that have no students enrolled.

DELETE FROM courses
WHERE
    course_id NOT IN (
        SELECT course_id
        from enrollment
    )

SELECT * from courses;

-----
-- Query 5:
-- Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_name from students LIMIT 2 OFFSET 2;

SELECT * from students;
----
-- Query 6:
-- Retrieve the course names and the number of students enrolled in each course.
SELECT DISTINCT
    courses.course_name,
    count(enrollment.student_id)
from enrollment
    INNER JOIN courses on courses.course_id = enrollment.course_id
GROUP BY
    courses.course_name;

---------
-- Query 7:
-- Calculate and display the average age of all students.

SELECT avg(age) from students;

----
-- Query 8:
-- Retrieve the names of students whose email addresses contain 'example.com'.

SELECT email from students WHERE email LIKE '%example.com%';
----