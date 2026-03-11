from sqlalchemy import Column, Integer, String, Date, ForeignKey
from sqlalchemy.orm import relationship
from .database import Base

class Department(Base):
    __tablename__ = "Departments"

    Department_ID = Column(Integer, primary_key=True)
    Department_Name = Column(String(150))
    Department_Description = Column(String(250))
    Faculty = Column(String(150))

class Programme(Base):
    __tablename__ = "Programmes"

    Programme_ID = Column(Integer, primary_key=True)
    Programme_Name = Column(String(150))
    Degree_Awarded_Name = Column(String(150))
    Degree_Awarded_Level = Column(Integer)
    Enrolment_Deadline = Column(Date)
    Tuition_Fees = Column(Integer)
    Course_Requirements = Column(String(250))
    Duration_Months = Column(Integer)

class Student(Base):
    __tablename__ = "Students"

    Student_ID = Column(Integer, primary_key=True)
    First_Name = Column(String(150))
    Last_Name = Column(String(150))
    Date_of_Birth = Column(Date)
    Year_of_Study = Column(Integer)
    Graduation_Status = Column(String(150))
    Programme_ID = Column(Integer, ForeignKey("Programmes.Programme_ID"))

class Lecturer(Base):
    __tablename__ = "Lecturers"

    Lecturer_ID = Column(Integer, primary_key=True)
    First_Name = Column(String(150))
    Last_Name = Column(String(150))
    Date_of_Birth = Column(Date)
    Department_ID = Column(Integer, ForeignKey("Departments.Department_ID"))

class CourseDetails(Base):
    __tablename__ = "Course_Details"

    Course_Code = Column(Integer, primary_key=True)
    Course_Name = Column(String(150))
    Course_Description = Column(String(250))
    Department_ID = Column(Integer, ForeignKey("Departments.Department_ID"))
    Course_Level = Column(Integer)
    Credits = Column(Integer)

class CourseOffering(Base):
    __tablename__ = "Course_Offerings"

    Course_Offering_ID = Column(Integer, primary_key=True)
    Course_Code = Column(Integer, ForeignKey("Course_Details.Course_Code"))
    Lecturer_ID = Column(Integer, ForeignKey("Lecturers.Lecturer_ID"))
    Semester_Code = Column(String(10))
    Capacity = Column(Integer)
    Start_Date = Column(Date)
    End_Date = Column(Date)
    Programme_ID = Column(Integer, ForeignKey("Programme.Programme_ID"))
    
class CourseEnrolment(Base):
    __tablename__ = "Course_Enrolment"

    Enrolment_ID = Column(Integer, primary_key=True)
    Student_ID = Column(Integer, ForeignKey("Students.Student_ID"))
    Course_Offering_ID = Column(Integer, ForeignKey("Course_Offerings.Course_Offering_ID"))
    Enrolment_Date = Column(Date)

class Assignment(Base):
    __tablename__ = "Assignments"

    Assignment_ID = Column(Integer, primary_key=True)
    Assignment_Name = Column(String(150))
    Assignment_Description = Column(String(250))
    Course_Offering_ID = Column(Integer, ForeignKey("Course_Offerings.Course_Offering_ID"))

class GradeRecord(Base):
    __tablename__ = "Grade_Records"

    Grade_Record_ID = Column(Integer, primary_key=True)
    Assignment_ID = Column(Integer, ForeignKey("Assignments.Assignment_ID"))
    Grade = Column(Integer)

class AdvisorPair(Base):
    __tablename__ = "Advisor_Pairs"

    Advisor_Pair_ID = Column(Integer, primary_key=True)
    Lecturer_ID = Column(Integer, ForeignKey("Lecturers.Lecturer_ID"))
    Student_ID = Column(Integer, ForeignKey("Students.Student_ID"))

class LecturerContact(Base):
    __tablename__ = "Lecturers_Contacts"

    Lecturer_ID = Column(Integer, primary_key=True)
    Email = Column(String(254))
    Phone = Column(String(50))
    Emergency_Contact_Name = Column(String(150))
    Emergency_Contact_Email = Column(String(254))
    Emergency_Contact_Phone = Column(String(50))

class Staff(Base):
    __tablename__ = "Non_Academic_Staff"

    Staff_ID = Column(Integer, primary_key=True)
    First_Name = Column(String(150))
    Last_Name = Column(String(150))
    Date_of_Birth = Column(Date)
    Department_ID = Column(Integer)
    Employment_Type = Column(Integer)

class ResearchProject(Base):
    __tablename__ = "Research_Projects"

    Project_ID = Column(Integer, primary_key=True)
    Project_Name = Column(String(150))
    Project_Description = Column(String(250))
    Funding_Sources = Column(String(250))
    Outcome = Column(Integer)
    Supervisor_ID = Column(Integer, ForeignKey("Lecturers.Lecturer_ID"))

class Publication(Base):
    __tablename__ = "University_Library"

    Publication_ID = Column(Integer, primary_key=True)
    Publication_Name = Column(String(150))
    Journal_Name = Column(String(250))
    Date_of_Publication = Column(Date)
    Expertise_ID = Column(Integer, ForeignKey("Areas_of_Expertise.Expertise_ID"))