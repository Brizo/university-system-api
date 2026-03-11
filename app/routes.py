from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from .database import SessionLocal
from . import queries
from . import crud

router = APIRouter(
    prefix="/api",
    tags=["University Queries"]
)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.get("/")
def root():
    return {"message": "University Record Management System API Running"}

# crud
@router.get("/students")
def get_students(db: Session = Depends(get_db)):
    return crud.get_students(db)

@router.get("/courses")
def get_courses(db: Session = Depends(get_db)):
    return crud.get_students(db)

@router.get("/lecturers")
def get_lecturers(db: Session = Depends(get_db)):
    return crud.get_lecturers(db)

@router.get("/courses")
def get_courses(db: Session = Depends(get_db)):
    return crud.get_courses(db)

@router.get("/departments")
def get_departments(db: Session = Depends(get_db)):
    return crud.get_departments(db)

# queries
@router.get("/students/course/{course_code}/lecturer/{lecturer_id}")
def students_in_course(course_code: int, lecturer_id: int, db: Session = Depends(get_db)):
    return queries.students_in_course_by_lecturer(db, course_code, lecturer_id)

@router.get("/students/top-final-year")
def top_students(db: Session = Depends(get_db)):
    return queries.final_year_top_students(db)

@router.get("/students/no-courses/{semester}")
def students_without_courses(semester: str, db: Session = Depends(get_db)):
    return queries.students_without_courses(db, semester)

@router.get("/advisor/{student_id}")
def advisor(student_id: int, db: Session = Depends(get_db)):
    return queries.advisor_contact(db, student_id)

@router.get("/department/{department_id}/courses")
def department_courses(department_id: int, db: Session = Depends(get_db)):
    return queries.courses_by_department(db, department_id)

@router.get("/lecturers/top-researchers")
def top_researchers(db: Session = Depends(get_db)):
    return queries.lecturers_with_most_projects(db)

@router.get("/publications/last-year")
def publications(db: Session = Depends(get_db)):
    return queries.lecturer_publications_last_year(db)

@router.get("/advisor/{lecturer_id}/students")
def advisor_students(lecturer_id: int, db: Session = Depends(get_db)):
    return queries.students_by_advisor(db, lecturer_id)

@router.get("/department/{department_id}/staff")
def department_staff(department_id: int, db: Session = Depends(get_db)):
    return queries.staff_in_department(db, department_id)