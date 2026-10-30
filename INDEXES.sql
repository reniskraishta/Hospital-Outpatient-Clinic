CREATE INDEX idx_appointment_date ON Appointment(AppointmentDate);
CREATE INDEX idx_patient_lastname ON Patient(LastName);
CREATE INDEX idx_prescription_patient ON Prescription(AppointmentID);
CREATE INDEX idx_bill_status ON Bill(PaymentStatus);
CREATE INDEX idx_appointment_doctor ON Appointment(DoctorID);