# FastAPI University Records Management API

A backend university system as part of .

## Features

* Create todos
* View all todos
* Update todos
* Delete todos
* Interactive API documentation

## 🛠 Tech Stack

* Python 3.14+
* FastAPI
* Uvicorn

## Installation

Clone the repository:

```bash
git clone https://github.com/example/fastapi-todo-api.git
cd fastapi-todo-api
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

## Example Endpoints

| Method | Endpoint    | Description   |
| ------ | ----------- | ------------- |
| GET    | /todos      | Get all todos |
| POST   | /todos      | Create a todo |
| PUT    | /todos/{id} | Update a todo |
| DELETE | /todos/{id} | Delete a todo |

## Project Structure

```
fastapi-todo-api/
│
├── main.py
├── models.py
├── schemas.py
├── database.py
├── requirements.txt
└── README.md
```

## Example Request

Create a todo:

```json
POST /todos
{
  "title": "Finish FastAPI project",
  "completed": false
}
```

Response:

```json
{
  "id": 1,
  "title": "Finish FastAPI project",
  "completed": false
}
```

## 🧪 Testing

Run tests with:

```bash
pytest
```

## 📄 License

This project is licensed under the MIT License.
