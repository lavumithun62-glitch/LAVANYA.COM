# Clinic API

Simple REST API to manage doctors and patients. Built with FastAPI + in-memory storage.

## Setup

```bash
pip install -r requirements.txt
uvicorn main:app --reload
```

API runs at `http://localhost:8000`  
Swagger docs at `http://localhost:8000/docs`

## Endpoints

**Doctors**
- `POST /doctors` – add a doctor
- `GET /doctors` – list all doctors
- `GET /doctors/{id}` – get one doctor

**Patients**
- `POST /patients` – register a patient
- `GET /patients` – list all patients

## Example requests

Create a doctor:
```bash
curl -X POST http://localhost:8000/doctors \
  -H "Content-Type: application/json" \
  -d '{"name": "Dr. Ravi", "specialization": "Cardiology", "email": "ravi@clinic.com"}'
```

Create a patient:
```bash
curl -X POST http://localhost:8000/patients \
  -H "Content-Type: application/json" \
  -d '{"name": "Amit Shah", "age": 32, "phone": "9876543210"}'
```

## Notes

- Data is stored in memory, so it resets on restart
- Email must be valid (pydantic handles this)
- Age must be > 0
- Duplicate doctor emails return 400
