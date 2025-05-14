
-- Create tables
CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100) NOT NULL
);

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

CREATE TABLE Instructor (
    Instructor_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100) NOT NULL,
    Credit_Hours INT NOT NULL,
    Department_ID INT,
    Instructor_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID),
    FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID)
);

CREATE TABLE Enrollment (
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Grade CHAR(2), //A.B
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

-- Insert data into Department table
INSERT INTO Department (Department_ID, Department_Name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Chemistry'),
(5, 'Biology'),
(6, 'English Literature'),
(7, 'History'),
(8, 'Philosophy'),
(9, 'Economics'),
(10, 'Political Science');

-- Insert data into Student table
INSERT INTO Student (Student_ID, Name, Email, Phone, Department_ID) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', '1234567890', 1),
(2, 'Bob Smith', 'bob.smith@example.com', '1234567891', 2),
(3, 'Charlie Brown', 'charlie.brown@example.com', '1234567892', 3),
(4, 'David Wilson', 'david.wilson@example.com', '1234567893', 4),
(5, 'Eva Green', 'eva.green@example.com', '1234567894', 5),
(6, 'Frank White', 'frank.white@example.com', '1234567895', 6),
(7, 'Grace Black', 'grace.black@example.com', '1234567896', 7),
(8, 'Hannah Blue', 'hannah.blue@example.com', '1234567897', 8),
(9, 'Ian Red', 'ian.red@example.com', '1234567898', 9),
(10, 'Jack Yellow', 'jack.yellow@example.com', '1234567899', 10);

-- Insert data into Instructor table
INSERT INTO Instructor (Instructor_ID, Name, Email, Department_ID) VALUES
(1, 'Dr. Smith', 'dr.smith@example.com', 1),
(2, 'Dr. Johnson', 'dr.johnson@example.com', 2),
(3, 'Dr. Brown', 'dr.brown@example.com', 3),
(4, 'Dr. Wilson', 'dr.wilson@example.com', 4),
(5, 'Dr. Green', 'dr.green@example.com', 5),
(6, 'Dr. White', 'dr.white@example.com', 6),
(7, 'Dr. Black', 'dr.black@example.com', 7),
(8, 'Dr. Blue', 'dr.blue@example.com', 8),
(9, 'Dr. Red', 'dr.red@example.com', 9),
(10, 'Dr. Robinson', 'dr.robinson@example.com', 10);

-- Insert data into Course table
INSERT INTO Course (Course_ID, Course_Name, Credit_Hours, Department_ID, Instructor_ID) VALUES
(1, 'Introduction to Computer Science', 3, 1, 1),
(2, 'Calculus I', 4, 2, 2),
(3, 'Physics I', 4, 3, 3),
(4, 'Organic Chemistry', 3, 4, 4),
(5, 'Biology I', 3, 5, 5),
(6, 'English Literature I', 3, 6, 6),
(7, 'World History', 3, 7, 7),
(8, 'Introduction to Philosophy', 3, 8, 8),
(9, 'Microeconomics', 3, 9, 9),
(10, 'Political Theory', 3, 10, 10);

-- Insert data into Enrollment table
INSERT INTO Enrollment (Enrollment_ID, Student_ID, Course_ID, Grade) VALUES
(1, 1, 1, 'A'),
(2, 2, 2, 'B'),
(3, 3, 3, 'C'),
(4, 4, 4, 'B'),
(5, 5, 5, 'A'),
(6, 6, 6, 'C'),
(7, 7, 7, 'B'),
(8, 8, 8, 'A'),
(9, 9, 9, 'C'),
(10, 10, 10, 'B');

-- Sample queries

-- 1. Search for a student whose name contains 'Ali'
SELECT * FROM Student
WHERE Name LIKE '%Ali%';

-- 2. Count the number of students in each department
SELECT Department_ID, COUNT(*) AS NumberOfStudents
FROM Student
GROUP BY Department_ID;

-- 3. Order students by name in ascending order
SELECT * FROM Student
ORDER BY Name ASC;

-- 4. Display students who have grades 'A'
SELECT Student_ID, Course_ID, Grade
FROM Enrollment
WHERE Grade = 'A';

-- 5. Display student names with the courses they enrolled in
SELECT Student.Name AS StudentName, Course.Course_Name AS CourseName
FROM Enrollment
JOIN Student ON Enrollment.Student_ID = Student.Student_ID
JOIN Course ON Enrollment.Course_ID = Course.Course_ID;

-- Additional queries

-- 6. Calculate the average grade for each course
SELECT Course_ID, AVG(Grade) AS AverageGrade
FROM Enrollment
GROUP BY Course_ID;

-- 7. Find the highest grade in each course
SELECT Course_ID, MAX(Grade) AS HighestGrade
FROM Enrollment
GROUP BY Course_ID;



-- 8. Order students by name in descending order
SELECT * FROM Student
ORDER BY Name DESC;

-- 9. Order courses by credit hours in ascending order
SELECT * FROM Course
ORDER BY Credit_Hours ASC;
