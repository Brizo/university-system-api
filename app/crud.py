from sqlalchemy.orm import Session
from . import models

def get_students(db: Session):
    return db.query(models.Student).all()

def get_lecturers(db: Session):
    return db.query(models.Lecturer).all()

def get_courses(db: Session):
    return db.query(models.CourseDetails).all()

def get_departments(db: Session):
    return db.query(models.Department).all()

def get_programms(db: Session):
    return db.query(models.Programme).all()