USE university_system;

-- -----------------------------
-- Departments
-- -----------------------------
INSERT INTO Departments VALUES
(1, 'Computer Science', 'Department of computing and software engineering', 'Engineering'),
(2, 'Mathematics', 'Department of mathematical sciences', 'Science'),
(3, 'Business', 'Department of business administration', 'Business');

-- -----------------------------
-- Programmes
-- -----------------------------
INSERT INTO Programmes VALUES
(1, 'BSc Computer Science', 'Bachelor of Science', 6, '2025-08-01', 15000, 'Math + Computing', 48),
(2, 'BSc Mathematics', 'Bachelor of Science', 6, '2025-08-01', 14000, 'Advanced Mathematics', 48);

-- -----------------------------
-- Lecturers
-- -----------------------------
INSERT INTO Lecturers VALUES
(1,'Alice','Johnson','1980-05-10',1),
(2,'David','Smith','1978-03-14',1),
(3,'Michael','Brown','1982-11-20',2),
(4,'Sarah','Williams','1975-02-01',3);

-- -----------------------------
-- Lecturer Contacts
-- -----------------------------
INSERT INTO Lecturers_Contacts VALUES
(1,'alice@university.edu','111111','Tom Johnson','tom@email.com','999111'),
(2,'david@university.edu','222222','Anna Smith','anna@email.com','999222'),
(3,'michael@university.edu','333333','Laura Brown','laura@email.com','999333'),
(4,'sarah@university.edu','444444','James Williams','james@email.com','999444');

-- -----------------------------
-- Non Academic Staff
-- -----------------------------
INSERT INTO Non_Academic_Staff VALUES
(1,'Brian','Taylor','1985-04-12',1,1),
(2,'Emma','Wilson','1990-08-21',2,1);

-- -----------------------------
-- Staff Contacts
-- -----------------------------
INSERT INTO Staff_Contacts VALUES
(1,'brian@university.edu','555111','Sam Taylor','sam@email.com','888111'),
(2,'emma@university.edu','555222','Kate Wilson','kate@email.com','888222');

-- -----------------------------
-- Students
-- -----------------------------
INSERT INTO Students VALUES
(1,'John','Doe','2003-02-10',4,'Active',1),
(2,'Jane','Miller','2004-06-22',3,'Active',1),
(3,'Robert','Davis','2002-09-15',4,'Active',2),
(4,'Emily','Clark','2003-11-18',2,'Active',2),
(5,'Daniel','Lewis','2004-04-02',1,'Active',1);

-- -----------------------------
-- Student Contacts
-- -----------------------------
INSERT INTO Students_Contacts VALUES
(1,'john@email.com','777111','Mary Doe','mary@email.com','900111'),
(2,'jane@email.com','777222','Paul Miller','paul@email.com','900222'),
(3,'robert@email.com','777333','Kate Davis','kate@email.com','900333'),
(4,'emily@email.com','777444','James Clark','james@email.com','900444'),
(5,'daniel@email.com','777555','Linda Lewis','linda@email.com','900555');

-- -----------------------------
-- Advisor Pairs
-- -----------------------------
INSERT INTO Advisor_Pairs VALUES
(1,1,1),
(2,1,2),
(3,2,3);

-- -----------------------------
-- Areas of Expertise
-- -----------------------------
INSERT INTO Areas_of_Expertise VALUES
(1,'Artificial Intelligence'),
(2,'Machine Learning'),
(3,'Data Science');

-- -----------------------------
-- Publications
-- -----------------------------
INSERT INTO University_Library VALUES
(1,'AI Research Paper','AI Journal','2024-05-10',1),
(2,'Machine Learning Trends','ML Journal','2024-07-20',2);

-- -----------------------------
-- Lecturer Authors
-- -----------------------------
INSERT INTO Lecturers_Authors VALUES
(1,1,1),
(2,2,2);

-- -----------------------------
-- Courses
-- -----------------------------
INSERT INTO Course_Details VALUES
(101,'Introduction to Programming','Basics of programming',1,1,10),
(102,'Algorithms','Data structures and algorithms',1,2,10),
(201,'Linear Algebra','Mathematics for computing',2,1,10);

-- -----------------------------
-- Research Projects
-- -----------------------------
INSERT INTO Research_Projects VALUES
(1,'AI Research','Artificial intelligence project','Government Grant','Ongoing',1),
(2,'Data Science Study','Big data analytics','Industry Funding','Completed',2);

-- -----------------------------
-- Course Offerings
-- -----------------------------
INSERT INTO Course_Offerings VALUES
(1,101,1,'2025S1',50,'2025-01-10','2025-05-20',1),
(2,102,2,'2025S1',40,'2025-01-10','2025-05-20',1),
(3,201,3,'2025S1',30,'2025-01-10','2025-05-20',2);

-- -----------------------------
-- Course Enrolments
-- -----------------------------
INSERT INTO Course_Enrolment VALUES
(1,1,1,'2025-01-05'),
(2,2,1,'2025-01-05'),
(3,3,3,'2025-01-05'),
(4,4,3,'2025-01-05');

-- -----------------------------
-- Assignments
-- -----------------------------
INSERT INTO Assignments VALUES
(1,'Programming Assignment','Build a small program',1),
(2,'Algorithm Assignment','Sorting algorithms',2);

-- -----------------------------
-- Grades
-- -----------------------------
INSERT INTO Grade_Records VALUES
(1,1,85),
(2,2,78);