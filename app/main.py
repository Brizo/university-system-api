from fastapi import FastAPI
from .routes import router

app = FastAPI(title="University Record Management System API")

app.include_router(router)