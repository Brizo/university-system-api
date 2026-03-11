# FastAPI University Records Management API

University Of Liverpool - Databases and Information Systems (CSK542) End of Module Assignment
Backend (API) code for University Records Management systeem.

## Features

* View students, departments, courses,
* Filter students by course, lecturer
* Get final year top students
* Retrieve students without courses
* Get student advisor contacts
* Filter lecturers with most projects
* Filter staff by department

## Tech Stack

* Python 3.14+
* FastAPI
* Uvicorn

## Installation

Clone the repository:

```bash
git clone https://github.com/Brizo/university-system-api.git
cd university-system-api
```

Install dependencies:

```bash
pip install -r requirements.txt
```

## Run the Application

Start the development server:

```bash
uvicorn app.main:app --reload
```

The API will run at:

```
http://127.0.0.1:8000
```

## API Documentation

FastAPI provides automatic interactive docs:

Swagger UI:

```
http://127.0.0.1:8000/docs
```

ReDoc:

```
http://127.0.0.1:8000/redoc
```
## Sample Calls

1) Retrieve students

``` bash
/api/students
```

## Testing

Run tests with:

```bash
pytest
```

## License

This project is licensed under the MIT License.
