from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_root():
    response = client.get("/api/")
    assert response.status_code == 200
    assert response.json()["message"] == "University Record Management System API Running"

def test_all_students():
    response = client.get("/api/students")
    assert response.status_code == 200
    assert isinstance(response.json(), list)

# def test_top_students():
#     response = client.get("/api/students/top-final-year")
#     assert response.status_code == 200
#     assert isinstance(response.json(), list)

# def test_advisor():
#    response = client.get("/api/advisor/1")
#    assert response.status_code == 200