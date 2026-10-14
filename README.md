# Database Project

This repository contains a simple database project based on a university/academic data model. The files in this repo include the project documentation, a SQL script, diagram images, and supporting files.

## Included files

- README.md — project overview
- REPORT.docx — project report in Word format
- Second file.sql — SQL script with table creation, sample data, and example queries
- _مخطط دون اسم_.drawio.png — database diagram image
- _مخطط دون اسم_.drawio(1).png — second diagram image
- photo.zip — archive containing photos related to the project

## Database content

The SQL file defines a relational database with the following tables:

- Department
- Student
- Instructor
- Course
- Enrollment

The schema includes:

- Department to Student: one department can have many students
- Department to Instructor: one department can have many instructors
- Department to Course: one department can have many courses
- Instructor to Course: one instructor can teach many courses
- Student to Enrollment: one student can enroll in many courses
- Course to Enrollment: one course can have many enrollments

## SQL script features

The SQL script includes:

- CREATE TABLE statements
- INSERT statements with sample records
- simple SELECT queries
- grouping and ordering examples
- join queries between Student, Course, and Enrollment

## Example data model

The project is centered on a university registration system where students enroll in courses, courses belong to departments, and instructors are assigned to departments and teaching roles.

## Notes

This repository is a database-focused project and does not include application code, Docker setup, automated tests, or additional backend services.
