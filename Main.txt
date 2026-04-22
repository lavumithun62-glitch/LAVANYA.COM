from fastapi import FastAPI
from routers import doctors, patients

app = FastAPI(title="Clinic API")

app.include_router(doctors.router, prefix="/doctors", tags=["doctors"])
app.include_router(patients.router, prefix="/patients", tags=["patients"])


@app.get("/")
def root():
    return {"message": "Clinic API is running"}
