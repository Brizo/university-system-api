from sqlalchemy.orm import Session
from sqlalchemy import func
from . import models

def students_in_course_by_lecturer(db: Session, course_code, lecturer_id):

    return db.query(models.Student).join(
        models.CourseEnrolment,
        models.Student.Student_ID == models.CourseEnrolment.Student_ID
    ).join(
        models.CourseOffering,
        models.CourseEnrolment.Course_Offering_ID == models.CourseOffering.Course_Offering_ID
    ).filter(
        models.CourseOffering.Course_Code == course_code,
        models.CourseOffering.Lecturer_ID == lecturer_id
    ).all()

def final_year_top_students(db: Session):

    results = db.query(
        models.Student.Student_ID,
        models.Student.First_Name,
        func.avg(models.GradeRecord.Grade).label("avg_grade")
    ).join(
        models.CourseEnrolment,
        models.Student.Student_ID == models.CourseEnrolment.Student_ID
    ).join(
        models.Assignment,
        models.CourseEnrolment.Course_Offering_ID == models.Assignment.Course_Offering_ID
    ).join(
        models.GradeRecord,
        models.Assignment.Assignment_ID == models.GradeRecord.Assignment_ID
    ).filter(
        models.Student.Year_of_Study == 4
    ).group_by(
        models.Student.Student_ID
    ).having(
        func.avg(models.GradeRecord.Grade) > 70
    ).all()

    return [
        {
            "Student_ID": r.Student_ID,
            "First_Name": r.First_Name,
            "avg_grade": float(r.avg_grade)
        }
        for r in results
    ]

def students_without_courses(db: Session, semester):

    return db.query(models.Student).filter(
        ~db.query(models.CourseEnrolment).join(
            models.CourseOffering
        ).filter(
            models.CourseEnrolment.Student_ID == models.Student.Student_ID,
            models.CourseOffering.Semester_Code == semester
        ).exists()
    ).all()

def advisor_contact(db: Session, student_id):

    result = db.query(
        models.Lecturer.First_Name,
        models.Lecturer.Last_Name,
        models.LecturerContact.Email,
        models.LecturerContact.Phone
    ).join(
        models.AdvisorPair,
        models.Lecturer.Lecturer_ID == models.AdvisorPair.Lecturer_ID
    ).join(
        models.LecturerContact,
        models.Lecturer.Lecturer_ID == models.LecturerContact.Lecturer_ID
    ).filter(
        models.AdvisorPair.Student_ID == student_id
    ).first()

    if result:
        return {
            "first_name": result.First_Name,
            "last_name": result.Last_Name,
            "email": result.Email,
            "phone": result.Phone
        }

def courses_by_department(db: Session, department_id):

    return db.query(models.CourseDetails).filter(
        models.CourseDetails.Department_ID == department_id
    ).all()

def lecturers_with_most_projects(db: Session):

    results = db.query(
        models.Lecturer.Lecturer_ID,
        func.count(models.ResearchProject.Project_ID).label("projects")
    ).join(
        models.ResearchProject,
        models.Lecturer.Lecturer_ID == models.ResearchProject.Supervisor_ID
    ).group_by(
        models.Lecturer.Lecturer_ID
    ).order_by(
        func.count(models.ResearchProject.Project_ID).desc()
    ).all()

    return [
        {
            "Lecturer_ID": r.Lecturer_ID,
            "Projects": r.projects,
        }
        for r in results
    ]

def lecturer_publications_last_year(db: Session):

    return db.query(models.Publication).filter(
        func.year(models.Publication.Date_of_Publication) ==
        func.year(func.now()) - 1
    ).all()

def students_by_advisor(db: Session, lecturer_id):

    return db.query(models.Student).join(
        models.AdvisorPair,
        models.Student.Student_ID == models.AdvisorPair.Student_ID
    ).filter(
        models.AdvisorPair.Lecturer_ID == lecturer_id
    ).all()

def staff_in_department(db: Session, department_id):

    return db.query(models.Staff).filter(
        models.Staff.Department_ID == department_id
    ).all()