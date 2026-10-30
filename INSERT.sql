insert into Department(DepartmentID, DepartmentName, Location)
values
(201, 'Cardiology', 'Building A, Floor 2'),
(202, 'Pediatrics', 'Building B, Floor 1'),
(203, 'Dermatology', 'Building A, Floor 3'),
(204, 'Orthopedics', 'Building C, Floor 1'),
(205, 'Neurology', 'Building B, Floor 3');

insert into InsuranceProvider(InsuranceID, ProviderName, CoveragePercentage)
values
(301, 'HealthFirst', 80),
(302, 'MediCare Plus', 70),
(303, 'SafeGuard Insurance', 90),
(304, 'PrimeHealth', 60);

insert into Medication(MedicationID, MedicationName, Manufacturer, UnitPrice)
values
(401, 'Amoxicillin', 'PharmaCorp', 9),
(402, 'Ibuprofen', 'MediLab', 5),
(403, 'Atenolol', 'CardioMed', 12),
(404, 'Cetirizine', 'AllergyFree Inc', 7),
(405, 'Metformin', 'DiabeCare', 10),
(406, 'Omeprazole', 'GastroHealth', 8),
(407, 'Hydrocortisone Cream', 'DermaSolutions', 15),
(408, 'Aspirin', 'PharmaCorp', 3),
(409, 'Lisinopril', 'CardioMed', 11),
(410, 'Naproxen', 'MediLab', 6);

insert into Patient(PatientID, FirstName, LastName, Birthday, Gender, Phone, InsuranceID)
values
(1, 'Emma', 'Johnson', '1990-04-15', 'F', '555-0101', 301),
(2, 'James', 'Smith', '1985-08-22', 'M', '555-0102', 302),
(3, 'Olivia', 'Williams', '2000-01-10', 'F', '555-0103', NULL),
(4, 'Liam', 'Brown', '1978-11-30', 'M', '555-0104', 303),
(5, 'Sophia', 'Davis', '1995-06-18', 'F', '555-0105', 301),
(6, 'Noah', 'Miller', '1988-03-25', 'M', '555-0106', NULL),
(7, 'Ava', 'Wilson', '2005-09-12', 'F', '555-0107', 304),
(8, 'Lucas', 'Taylor', '1972-12-05', 'M', '555-0108', 302),
(9, 'Mia', 'Anderson', '1998-07-20', 'F', '555-0109', 303),
(10, 'Ethan', 'Thomas', '1982-02-14', 'M', '555-0110', NULL);


insert into Doctor(DoctorID, FirstName, LastName, Specialization, Phone, DepartmentID)
values
(101, 'Robert', 'Clark', 'Cardiologist', '555-1001', 201),
(102, 'Sarah', 'Lewis', 'Pediatrician', '555-1002', 202),
(103, 'Michael', 'Walker', 'Dermatologist', '555-1003', 203),
(104, 'Emily', 'Hall', 'Orthopedic Surgeon', '555-1004', 204),
(105, 'Daniel', 'Young', 'Neurologist', '555-1005', 205),
(106, 'Jessica', 'King', 'Cardiologist', '555-1006', 201),
(107, 'David', 'Wright', 'Pediatrician', '555-1007', 202);

insert into Appointment(AppointmentID, AppointmentDate, AppointmentTime, Status, Reason, DoctorID, PatientID)
values
(1001, '2026-03-01', '09:00', 'Completed', 'Chest pain', 101, 1),
(1002, '2026-03-01', '10:30', 'Completed', 'Child fever', 102, 7),
(1003, '2026-03-02', '11:00', 'Completed', 'Skin rash', 103, 3),
(1004, '2026-03-03', '09:30', 'Completed', 'Knee injury', 104, 4),
(1005, '2026-03-03', '14:00', 'Completed', 'Headaches', 105, 2),
(1006, '2026-03-04', '08:30', 'Completed', 'Heart checkup', 101, 5),
(1007, '2026-03-04', '10:00', 'Completed', 'Stomach pain', 102, 8),
(1008, '2026-03-05', '13:00', 'Completed', 'Acne treatment', 103, 9),
(1009, '2026-03-05', '15:00', 'Completed', 'Back pain', 104, 6),
(1010, '2026-03-06', '09:00', 'Completed', 'Dizziness', 105, 10),
(1011, '2026-03-07', '11:00', 'Completed', 'Follow-up chest pain', 106, 1),
(1012, '2026-03-07', '14:30', 'Completed', 'Child vaccination', 107, 7),
(1013, '2026-03-08', '09:00', 'Scheduled', 'Routine checkup', 101, 2),
(1014, '2026-03-08', '10:00', 'Scheduled', 'Skin follow-up', 103, 3),
(1015, '2026-03-09', '08:00', 'Cancelled', 'Knee follow-up', 104, 4),
(1016, '2026-03-10', '11:30', 'Completed', 'Allergy symptoms', 102, 5),
(1017, '2026-03-10', '13:00', 'Completed', 'Joint pain', 104, 8),
(1018, '2026-03-11', '09:30', 'Completed', 'Migraine', 105, 9),
(1019, '2026-03-12', '10:00', 'Completed', 'Heart palpitations', 106, 6),
(1020, '2026-03-12', '14:00', 'Completed', 'Eczema', 103, 10);

insert into Diagnosis(DiagnosisID, DiagnosisName, Description, Severity, AppointmentID)
values
(2001, 'Hypertension', 'Elevated blood pressure detected', 'Moderate', 1001),
(2002, 'Arrhythmia', 'Irregular heartbeat observed', 'Severe', 1001),
(2003, 'Upper Respiratory Infection', 'Fever and cough in child', 'Mild', 1002),
(2004, 'Contact Dermatitis', 'Allergic skin reaction', 'Mild', 1003),
(2005, 'Torn Meniscus', 'Knee cartilage tear confirmed', 'Severe', 1004),
(2006, 'Tension Headache', 'Chronic tension-type headache', 'Moderate', 1005),
(2007, 'Mild Angina', 'Minor chest discomfort under stress', 'Mild', 1006),
(2008, 'Gastritis', 'Inflammation of stomach lining', 'Moderate', 1007),
(2009, 'Acne Vulgaris', 'Moderate facial acne', 'Mild', 1008),
(2010, 'Lumbar Strain', 'Lower back muscle strain', 'Moderate', 1009),
(2011, 'Vertigo', 'Episodes of dizziness and imbalance', 'Moderate', 1010),
(2012, 'Hypertension', 'Blood pressure still elevated on follow-up', 'Moderate', 1011),
(2013, 'Healthy', 'Routine vaccination completed', 'Mild', 1012),
(2014, 'Allergic Rhinitis', 'Seasonal allergy symptoms', 'Mild', 1016),
(2015, 'Osteoarthritis', 'Degenerative joint condition', 'Moderate', 1017),
(2016, 'Migraine', 'Recurring migraine with aura', 'Severe', 1018),
(2017, 'Atrial Fibrillation', 'Irregular rapid heart rate', 'Severe', 1019),
(2018, 'Eczema', 'Chronic skin inflammation', 'Mild', 1020);

insert into Bill(BillID, TotalAmount, PaymentStatus, PaymentDate, AppointmentID)
values
(5001, 60, 'Paid', '2026-03-01', 1001),
(5002, 45, 'Paid', '2026-03-01', 1002),
(5003, 50, 'Unpaid', NULL, 1003),
(5004, 120, 'Paid', '2026-03-03', 1004),
(5005, 55, 'Paid', '2026-03-03', 1005),
(5006, 60, 'Partial', '2026-03-04', 1006),
(5007, 45, 'Paid', '2026-03-04', 1007),
(5008, 50, 'Unpaid', NULL, 1008),
(5009, 80, 'Paid', '2026-03-05', 1009),
(5010, 55, 'Paid', '2026-03-06', 1010),
(5011, 60, 'Unpaid', NULL, 1011),
(5012, 40, 'Paid', '2026-03-07', 1012),
(5013, 50, 'Paid', '2026-03-10', 1016),
(5014, 90, 'Partial', '2026-03-10', 1017),
(5015, 55, 'Paid', '2026-03-11', 1018),
(5016, 65, 'Unpaid', NULL, 1019),
(5017, 50, 'Paid', '2026-03-12', 1020);

insert into Prescription(PrescriptionID, IssueDate, Notes, AppointmentID)
values
(3001, '2026-03-01', 'Take with food, monitor blood pressure daily', 1001),
(3002, '2026-03-01', 'Childrens dosage, complete full course', 1002),
(3003, '2026-03-02', 'Apply to affected area only', 1003),
(3004, '2026-03-03', 'Take after meals, avoid heavy lifting', 1004),
(3005, '2026-03-03', 'Take as needed for pain', 1005),
(3006, '2026-03-04', 'Continue previous medication', 1006),
(3007, '2026-03-04', 'Take before meals on empty stomach', 1007),
(3008, '2026-03-05', 'Apply twice daily, avoid sun exposure', 1008),
(3009, '2026-03-05', 'Rest recommended, take with water', 1009),
(3010, '2026-03-06', 'Follow up in 2 weeks if symptoms persist', 1010),
(3011, '2026-03-07', 'Adjusted dosage from previous visit', 1011),
(3012, '2026-03-10', 'Take once daily during allergy season', 1016),
(3013, '2026-03-10', 'Take with food, gentle exercise recommended', 1017),
(3014, '2026-03-11', 'Take at onset of symptoms', 1018),
(3015, '2026-03-12', 'Monitor heart rate, report irregularities', 1019),
(3016, '2026-03-12', 'Apply after shower, keep skin moisturized', 1020);

insert into PrescriptionItem(PrescriptionID, MedicationID, Dosage, DurationDays)
values
(3001, 403, '50mg once daily', 30),
(3001, 409, '10mg once daily', 30),
(3001, 408, '100mg once daily', 90),
(3002, 401, '250mg three times daily', 7),
(3002, 402, '100mg as needed', 5),
(3003, 407, 'Apply thin layer twice daily', 14),
(3004, 402, '400mg three times daily', 10),
(3004, 410, '250mg twice daily', 7),
(3005, 402, '200mg as needed', 10),
(3006, 403, '50mg once daily', 30),
(3006, 408, '100mg once daily', 90),
(3007, 406, '20mg once daily', 14),
(3008, 407, 'Apply thin layer twice daily', 21),
(3009, 402, '400mg three times daily', 7),
(3009, 410, '500mg twice daily', 7),
(3010, 404, '10mg once daily', 14),
(3011, 403, '100mg once daily', 30),
(3011, 409, '20mg once daily', 30),
(3012, 404, '10mg once daily', 30),
(3013, 402, '400mg twice daily', 14),
(3013, 410, '250mg twice daily', 10),
(3014, 402, '600mg at onset', 5),
(3015, 403, '50mg once daily', 30),
(3015, 408, '100mg once daily', 90),
(3016, 407, 'Apply after shower daily', 30);