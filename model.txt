from pydantic import BaseModel, EmailStr, field_validator
from typing import Optional


class Doctor(BaseModel):
    name: str
    specialization: str
    email: EmailStr
    is_active: bool = True


class DoctorOut(Doctor):
    id: int


class Patient(BaseModel):
    name: str
    age: int
    phone: str

    @field_validator("age")
    @classmethod
    def age_must_be_positive(cls, v):
        if v <= 0:
            raise ValueError("Age must be greater than 0")
        return v


class PatientOut(Patient):
    id: int


class DoctorUpdate(BaseModel):
    name: Optional[str] = None
    specialization: Optional[str] = None
    email: Optional[EmailStr] = None
    is_active: Optional[bool] = None


class PatientUpdate(BaseModel):
    name: Optional[str] = None
    age: Optional[int] = None
    phone: Optional[str] = None
