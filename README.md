# FastAPI University Records Management API

A backend university system as part of Databases and Information Systems End of Module group assignment.

## Features

* Create todos
* View all todos
* Update todos
* Delete todos
* Interactive API documentation

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

## Testing

Run tests with:

```bash
pytest
```

## License

This project is licensed under the MIT License.
