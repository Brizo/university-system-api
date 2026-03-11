-- DROP DATABASE university_system;

CREATE DATABASE university_system;

USE university_system;

CREATE TABLE Departments (
    Department_ID int NOT NULL PRIMARY KEY,
    Department_Name varchar(150) NOT NULL,
    Department_Description varchar(250) NOT NULL,
    Faculty varchar(150) NOT NULL
);

CREATE TABLE Programmes (
    Programme_ID int NOT NULL PRIMARY KEY,
    Programme_Name varchar(150) NOT NULL,
    Degree_Awarded_Name varchar(150) NOT NULL,
    Degree_Awarded_Level int NOT NULL,
    Enrolment_Deadline date NOT NULL,
    Tuition_Fees int NOT NULL,
    Course_Requirements varchar(250) NOT NULL,
    Duration_Months int NOT NULL,
    CHECK(Tuition_Fees > 0),
    CHECK(Duration_Months > 0)
	);

CREATE TABLE Students (
    Student_ID int NOT NULL PRIMARY KEY,
    First_Name varchar(150) NOT NULL,
    Last_Name varchar (150) NOT NULL,
    Date_of_Birth date NOT NULL,
    Year_of_Study tinyint NOT NULL,
    Graduation_Status varchar(150) NOT NULL,
    Programme_ID int,
    CHECK (Year_of_Study > 0),
    FOREIGN KEY (Programme_ID)
      REFERENCES Programmes(Programme_ID)
      ON DELETE SET NULL
);

CREATE TABLE Lecturers (
    Lecturer_ID int NOT NULL PRIMARY KEY,
    First_Name varchar(150) NOT NULL,
    Last_Name varchar (150) NOT NULL,
    Date_of_Birth date NOT NULL,
    Department_ID int,
    FOREIGN KEY (Department_ID)
      REFERENCES Departments(Department_ID)
      ON DELETE SET NULL
);

CREATE TABLE Non_Academic_Staff (
    Staff_ID int NOT NULL PRIMARY KEY,
    First_Name varchar(150) NOT NULL,
    Last_Name varchar (150) NOT NULL,
    Date_of_Birth date NOT NULL,
    Department_ID int,
    Employment_Type tinyint NOT NULL,
    FOREIGN KEY (Department_ID)
      REFERENCES Departments(Department_ID)
      ON DELETE SET NULL
);

CREATE TABLE Students_Contacts (
    Student_ID int NOT NULL PRIMARY KEY,
    Email varchar(254) UNIQUE NOT NULL,
    Phone varchar(50),
    Emergency_Contact_Name varchar(150) NOT NULL,
    Emergency_Contact_Email varchar(254) UNIQUE,
    Emergency_Contact_Phone varchar(50) NOT NULL,
    FOREIGN KEY(Student_ID)
      REFERENCES Students(Student_ID)
      ON DELETE CASCADE
);

CREATE TABLE Lecturers_Contacts (
    Lecturer_ID int NOT NULL PRIMARY KEY,
    Email varchar(254) UNIQUE NOT NULL,
    Phone varchar(50),
    Emergency_Contact_Name varchar(150) NOT NULL,
    Emergency_Contact_Email varchar(254) UNIQUE,
    Emergency_Contact_Phone varchar(50) NOT NULL,
    FOREIGN KEY(Lecturer_ID)
      REFERENCES Lecturers(Lecturer_ID)
      ON DELETE CASCADE
);


CREATE TABLE Staff_Contacts (
    Staff_ID int NOT NULL PRIMARY KEY,
    Email varchar(254) UNIQUE NOT NULL,
    Phone varchar(50),
    Emergency_Contact_Name varchar(150) NOT NULL,
    Emergency_Contact_Email varchar(254) UNIQUE,
    Emergency_Contact_Phone varchar(50) NOT NULL,
    FOREIGN KEY(Staff_ID)
      REFERENCES Non_Academic_Staff(Staff_ID)
      ON DELETE CASCADE
);

CREATE TABLE Disciplinary_Records (
    Record_ID int NOT NULL PRIMARY KEY,
    Student_ID int NOT NULL,
    Reason varchar(250) NOT NULL,
    Penalty varchar(250) NOT NULL,
    FOREIGN KEY(Student_ID)
      REFERENCES Students(Student_ID)
      ON DELETE CASCADE
);

CREATE TABLE Lecturers_Qualifications (
    Qualification_ID int NOT NULL PRIMARY KEY,
    Lecturer_ID int NOT NULL,
    Qualification_Level int NOT NULL,
    Qualification_Name varchar(150) NOT NULL,
    University varchar(250) NOT NULL,
    Qualification_Grade int NOT NULL,
    CHECK(Qualification_Grade > 0 AND Qualification_Grade <= 100),
    FOREIGN KEY(Lecturer_ID)
      REFERENCES Lecturers(Lecturer_ID)
      ON DELETE CASCADE
);


CREATE TABLE Salary_Information (
    Salary_ID int NOT NULL PRIMARY KEY,
    Staff_ID int UNIQUE NOT NULL,
    Salary_Band varchar(1) NOT NULL,
    Salary int NOT NULL,
    CHECK(Salary > 0),
    FOREIGN KEY(Staff_ID)
      REFERENCES Non_Academic_Staff(Staff_ID)
      ON DELETE CASCADE
);

CREATE TABLE Student_Organisations (
    Organisation_ID int NOT NULL PRIMARY KEY,
    Organisation_Name varchar(250) NOT NULL,
    Organisation_Description varchar(250)
);

CREATE TABLE Student_Organisation_Membership (
    Membership_ID int NOT NULL PRIMARY KEY,
    Student_ID int NOT NULL,
    Organisation_ID int NOT NULL,
    Date_Joined date NOT NULL,
    UNIQUE (Student_ID, Organisation_ID),
    FOREIGN KEY(Student_ID)
      REFERENCES Students(Student_ID)
      ON DELETE CASCADE,
    FOREIGN KEY(Organisation_ID)
      REFERENCES Student_Organisations(Organisation_ID)
      ON DELETE CASCADE
);

CREATE TABLE Lecturers_Committees (
    Committee_ID int NOT NULL PRIMARY KEY,
    Committee_Name varchar(250) NOT NULL,
    Committee_Description varchar(250)
);

CREATE TABLE Lecturers_Committees_Membership (
    Membership_ID int NOT NULL PRIMARY KEY,
    Lecturer_ID int NOT NULL,
    Committee_ID int NOT NULL,
    Date_Joined date NOT NULL,
    UNIQUE (Lecturer_ID, Committee_ID),
    FOREIGN KEY(Lecturer_ID)
      REFERENCES Lecturers(Lecturer_ID)
      ON DELETE RESTRICT,
    FOREIGN KEY(Committee_ID)
      REFERENCES Lecturers_Committees(Committee_ID)
      ON DELETE CASCADE
);

CREATE TABLE Advisor_Pairs (
    Advisor_Pair_ID int NOT NULL PRIMARY KEY,
    Lecturer_ID int NOT NULL,
    Student_ID int UNIQUE NOT NULL,
    FOREIGN KEY(Lecturer_ID)
      REFERENCES Lecturers(Lecturer_ID)
      ON DELETE RESTRICT,
    FOREIGN KEY(Student_ID)
      REFERENCES Students(Student_ID)
      ON DELETE CASCADE
);
    
CREATE TABLE Areas_of_Expertise (
    Expertise_ID int NOT NULL PRIMARY KEY,
    Area_of_Expertise varchar(250)
);


CREATE TABLE University_Library (
    Publication_ID int NOT NULL PRIMARY KEY,
    Publication_Name varchar(150) NOT NULL,
    Journal_Name varchar(250) NOT NULL,
    Date_of_Publication date NOT NULL,
    Expertise_ID int NULL,
    FOREIGN KEY(Expertise_ID)
      REFERENCES Areas_of_Expertise(Expertise_ID)
      ON DELETE SET NULL
);

CREATE TABLE Lecturers_Authors (
	Author_ID int NOT NULL PRIMARY KEY,
    Lecturer_ID int NOT NULL,
    Publication_ID int NOT NULL,
    UNIQUE (Lecturer_ID, Publication_ID),
    FOREIGN KEY(Lecturer_ID)
      REFERENCES Lecturers(Lecturer_ID)
      ON DELETE CASCADE,
    FOREIGN KEY(Publication_ID)
      REFERENCES University_Library(Publication_ID)
      ON DELETE RESTRICT
);

CREATE TABLE Course_Details (
    Course_Code int NOT NULL PRIMARY KEY,
    Course_Name varchar(150) NOT NULL,
    Course_Description varchar(250) NOT NULL,
    Department_ID int NOT NULL,
    Course_Level int NOT NULL,
    Credits int NOT NULL,
    CHECK(Credits > 0),
    FOREIGN KEY(Department_ID)
      REFERENCES Departments(Department_ID)
      ON DELETE RESTRICT
);

CREATE TABLE Research_Projects (
    Project_ID int NOT NULL PRIMARY KEY,
    Project_Name varchar(150) NOT NULL,
    Project_Description varchar(250) NOT NULL,
    Funding_Sources varchar(250) NOT NULL,
    Outcome varchar(250) NOT NULL,
    Supervisor_ID int NOT NULL,
    FOREIGN KEY(Supervisor_ID)
      REFERENCES Lecturers(Lecturer_ID)
      ON DELETE RESTRICT
);

CREATE TABLE Research_Project_Publications (
    Project_Publication_ID int NOT NULL PRIMARY KEY,
    Publication_ID int NOT NULL,
    Project_ID int NOT NULL,
    FOREIGN KEY(Project_ID)
      REFERENCES Research_Projects(Project_ID)
      ON DELETE CASCADE,
    FOREIGN KEY(Publication_ID)
      REFERENCES University_Library(Publication_ID)
      ON DELETE CASCADE
);

CREATE TABLE Research_Groups (
    Group_ID int NOT NULL PRIMARY KEY,
    Project_ID int NOT NULL,
    Staff_ID int,
    Student_ID int,
    CHECK (
      (Staff_ID IS NOT NULL AND Student_ID IS NULL)
      OR
      (Staff_ID IS NULL AND Student_ID IS NOT NULL)
      ),
    UNIQUE (Project_ID, Staff_ID),
    UNIQUE (Project_ID, Student_ID),
    FOREIGN KEY(Project_ID)
      REFERENCES Research_Projects(Project_ID)
      ON DELETE CASCADE,
    FOREIGN KEY(Staff_ID)
      REFERENCES Non_Academic_Staff(Staff_ID)
      ON DELETE RESTRICT,
    FOREIGN KEY(Student_ID)
      REFERENCES Students(Student_ID)
      ON DELETE RESTRICT
);

CREATE TABLE Prerequisites (
    Course_Code int NOT NULL,
    Prerequisite_Course_Code int NOT NULL,
    Prerequisite_Grade int,
    CHECK(Prerequisite_Grade > 0 AND Prerequisite_Grade <= 100),
    PRIMARY KEY(Course_Code, Prerequisite_Course_Code),
    FOREIGN KEY(Course_Code)
      REFERENCES Course_Details(Course_Code)
      ON DELETE CASCADE,
    FOREIGN KEY(Prerequisite_Course_Code)
      REFERENCES Course_Details(Course_Code)
      ON DELETE CASCADE
    );
    
CREATE TABLE Course_Offerings (
    Course_Offering_ID int NOT NULL PRIMARY KEY,
    Course_Code int NOT NULL,
    Lecturer_ID int NOT NULL,
    Semester_Code varchar(10) NOT NULL,
    Capacity int NOT NULL,
    Start_Date date NOT NULL,
    End_Date date NOT NULL,
    Programme_ID int NOT NULL,
    CHECK(End_Date > Start_Date),
    CHECK(Capacity > 0),
    FOREIGN KEY(Course_Code)
      REFERENCES Course_Details(Course_Code)
      ON DELETE RESTRICT,
    FOREIGN KEY(Lecturer_ID)
      REFERENCES Lecturers(Lecturer_ID)
      ON DELETE RESTRICT,
    FOREIGN KEY(Programme_ID)
      REFERENCES Programmes(Programme_ID)
      ON DELETE RESTRICT
);

CREATE TABLE Course_Materials (
    Course_Materials_ID int NOT NULL PRIMARY KEY,
    Publication_ID int NOT NULL,
    Course_Code int NOT NULL,
    FOREIGN KEY(Course_Code)
      REFERENCES Course_Details(Course_Code)
      ON DELETE CASCADE,
    FOREIGN KEY(Publication_ID)
      REFERENCES University_Library(Publication_ID)
      ON DELETE CASCADE
);
    
CREATE TABLE Teaching_Sessions (
    Session_ID int NOT NULL PRIMARY KEY,
    Session_Type varchar(150) NOT NULL,
    Session_Location varchar(250) NOT NULL,
    Session_Start datetime NOT NULL,
    Session_End datetime NOT NULL,
    CHECK(Session_End > Session_Start)
);

CREATE TABLE Teaching_Schedule (
    Schedule_ID int NOT NULL PRIMARY KEY,
    Session_ID int NOT NULL,
    Course_Offering_ID int UNIQUE NOT NULL,
    FOREIGN KEY(Session_ID)
      REFERENCES Teaching_Sessions(Session_ID)
      ON DELETE RESTRICT,
    FOREIGN KEY(Course_Offering_ID)
      REFERENCES Course_Offerings(Course_Offering_ID)
      ON DELETE CASCADE
);

CREATE TABLE Course_Enrolment (
    Enrolment_ID int NOT NULL PRIMARY KEY,
    Student_ID int NOT NULL,
    Course_Offering_ID int NOT NULL,
    Enrolment_Date date NOT NULL,
    UNIQUE (Student_ID, Course_Offering_ID),
    FOREIGN KEY(Student_ID)
      REFERENCES Students(Student_ID)
      ON DELETE CASCADE,
    FOREIGN KEY(Course_Offering_ID)
      REFERENCES Course_Offerings(Course_Offering_ID)
	  ON DELETE RESTRICT
);

CREATE TABLE Assignments (
    Assignment_ID int NOT NULL PRIMARY KEY,
    Assignment_Name varchar(150) NOT NULL,
    Assignment_Description varchar(250) NOT NULL,
    Course_Offering_ID int NOT NULL,
    FOREIGN KEY(Course_Offering_ID)
      REFERENCES Course_Offerings(Course_Offering_ID)
      ON DELETE CASCADE
);

CREATE TABLE Grade_Records (
    Grade_Record_ID int NOT NULL PRIMARY KEY,
    Assignment_ID int NOT NULL,
    Grade int,
    CHECK(Grade > 0 AND Grade <= 100),
    FOREIGN KEY(Assignment_ID)
      REFERENCES Assignments(Assignment_ID)
      ON DELETE RESTRICT
);






    

        
        
        

