-- Query 1
-- Rationale: Display all patients along with their insurance provider name.
SELECT p.PatientID, p.FirstName, p.LastName, ip.ProviderName
From Patient p, InsuranceProvider ip
WHere p.InsuranceID = ip.InsuranceID;


-- Query 2
-- Rationale: Display the number of doctors in each department.
SELECT dep.DepartmentName, COUNT(doc.DoctorID)
From Department dep, Doctor doc
Where dep.DepartmentID = doc.DepartmentID
GROUP BY dep.DepartmentName;

-- Query 3
-- Rationale: Display the total revenue generated per department.
SELECT dep.DepartmentName, SUM(b.TotalAmount) AS TotalRevenue
FROM Department dep, Doctor doc, Appointment a, Bill b
Where dep.DepartmentID = doc.DepartmentID
And doc.DoctorID = a.DoctorID
ANd a.AppointmentID = b.AppointmentID
GROUP BY dep.DepartmentName
ORDER BY TotalRevenue DESC;


-- Query 4
-- Rationale: Find which doctors handled the most appointments.
SELECT doc.DoctorID, doc.FirstName, doc.LastName, COUNT(a.AppointmentID) AS TotalAppointments
FRom Doctor doc, Appointment a
Where doc.DoctorID = a.DoctorID
Group By doc.DoctorID
Order By TotalAppointments DESC;

-- Query 5
-- Rationale: Display all unpaid bills along with the patient name and appointment date.
SELECT p.FirstName, p.LastName, a.AppointmentDate, b.TotalAmount, b.PaymentStatus
FROM Bill b, Appointment a , Patient p
Where b.AppointmentID = a.AppointmentID
And a.PatientID = p.PatientID
And b.PaymentStatus = 'Unpaid';

-- Query 6
-- Rationale: Display the most prescribed medications by total number of prescriptions.
SELECT med.MedicationName, COUNT(pi.PrescriptionID) AS TimesPrescribed
FROM Medication med, PrescriptionItem pi
where med.MedicationID = pi.MedicationID
GROUP BY med.MedicationID
ORDER BY TimesPrescribed DESC;

-- Query 7
-- Rationale: Display each patient and the total number of appointments they have had.
SELECT p.PatientID, p.FirstName, p.LastName, COUNT(a.AppointmentID)
FROM Patient p, Appointment a
Where p.PatientID = a.PatientID
GROUP BY p.PatientID;

-- Query 8
-- Rationale: Display all appointments for a specific date along with the doctor and patient names.
SELECT a.AppointmentID, a.AppointmentTime, doc.FirstName, doc.LastName, p.FirstName, p.LastName
FROM Appointment a, Doctor doc, Patient p
Where a.DoctorID = doc.DoctorID
And a.PatientID = p.PatientID
and a.AppointmentDate = '2026-03-04';

-- Query 9
-- Rationale: Display the average bill amount per department.
SELECT dep.DepartmentName, AVG(b.TotalAmount) AS AvgBill
FROM Department dep, Doctor doc, Appointment a, Bill b
where dep.DepartmentID = doc.DepartmentID
and doc.DoctorID = a.DoctorID
and a.AppointmentID = b.AppointmentID
GROUP BY dep.DepartmentName;

-- Query 10
-- Rationale: Find patients who have had more than 1 appointment.
SELECT p.PatientID, p.FirstName, p.LastName, COUNT(a.AppointmentID) AS TotalAppointments
FROM Patient p, Appointment a
Where p.PatientID = a.PatientID
GROUP BY p.PatientID
HAVING TotalAppointments > 1;

-- Query 11
-- Rationale: Display all cancelled appointments along with the patient and doctor names.
SELECT a.AppointmentID, a.AppointmentDate, p.FirstName, p.LastName, doc.FirstName, doc.LastName
FROM Appointment a, Patient p , Doctor doc
where a.PatientID = p.PatientID
And a.DoctorID = doc.DoctorID
And a.Status = 'Cancelled';

-- Query 12
-- Rationale: Display the total amount each patient has spent on bills.
SELECT p.PatientID, p.FirstName, p.LastName, SUM(b.TotalAmount) AS TotalSpent
FROM Patient p, Appointment a, Bill b
where p.PatientID = a.PatientID
and a.AppointmentID = b.AppointmentID
GROUP BY p.PatientID
ORDER BY TotalSpent DESC;

-- Query 13
-- Rationale: Display all diagnoses with severity marked as Severe.
SELECT diag.DiagnosisName, diag.Description, a.AppointmentDate, p.FirstName, p.LastName
FROM Diagnosis diag, Appointment a, Patient p 
where diag.AppointmentID = a.AppointmentID
and a.PatientID = p.PatientID
and diag.Severity = 'Severe';

-- Query 14
-- Rationale: Display each medication and the total revenue it has generated.
SELECT med.MedicationName, med.UnitPrice, COUNT(pi.PrescriptionID),
       med.UnitPrice * COUNT(pi.PrescriptionID) AS TotalRevenue
FROM Medication med, PrescriptionItem pi
Where med.MedicationID = pi.MedicationID
GROUP BY med.MedicationID
ORDER BY TotalRevenue DESC;

-- Query 15
-- Rationale: Display all patients who do not have insurance.
SELECT PatientID, FirstName, LastName, Phone
FROM Patient
WHERE InsuranceID IS NULL;

-- Query 16
-- Rationale: Display the number of appointments per status (Scheduled, Completed, Cancelled).
SELECT Status, COUNT(AppointmentID)
FROM Appointment
GROUP BY Status;

-- Query 17
-- Rationale: Display each doctor along with the total revenue they have generated from bills.
SELECT doc.DoctorID, doc.FirstName, doc.LastName, SUM(b.TotalAmount) AS TotalRevenue
FROM Doctor doc, Appointment a, Bill b
where doc.DoctorID = a.DoctorID
And a.AppointmentID = b.AppointmentID
GROUP BY doc.DoctorID
ORDER BY TotalRevenue DESC;

-- Query 18
-- Rationale: Display all prescriptions that include more than one medication.
SELECT pres.PrescriptionID, pres.IssueDate, COUNT(pi.MedicationID) AS MedicationCount
FROM Prescription pres, PrescriptionItem pi
where pres.PrescriptionID = pi.PrescriptionID
GROUP BY pres.PrescriptionID
HAVING MedicationCount > 1;

-- Query 19
-- Rationale: Display the total number of diagnoses per department.
SELECT dep.DepartmentName, COUNT(diag.DiagnosisID) AS TotalDiagnoses
FROM Department dep, Doctor doc, Appointment a, Diagnosis diag
where dep.DepartmentID = doc.DepartmentID
and doc.DoctorID = a.DoctorID
and a.AppointmentID = diag.AppointmentID
GROUP BY dep.DepartmentName
ORDER BY TotalDiagnoses DESC;

-- Query 20
-- Rationale: Display the insurance providers and the total bill amount covered by each.
SELECT ip.ProviderName, ip.CoveragePercentage, SUM(b.TotalAmount) AS TotalBilled,
       SUM(b.TotalAmount * ip.CoveragePercentage / 100) AS AmountCovered
FROM InsuranceProvider ip, Patient p, Appointment a, Bill b
where ip.InsuranceID = p.InsuranceID
and p.PatientID = a.PatientID
and a.AppointmentID = b.AppointmentID
GROUP BY ip.InsuranceID;

-- Query 21
-- Rationale: Display the number of appointments per status for each department.
SELECT dep.DepartmentName, a.Status, COUNT(a.AppointmentID)
FROM Department dep, Doctor doc, Appointment a
where dep.DepartmentID = doc.DepartmentID
and doc.DoctorID = a.DoctorID
GROUP BY dep.DepartmentName, a.Status;

-- Query 22
-- Rationale: Display the busiest days by number of appointments.
SELECT AppointmentDate, COUNT(AppointmentID) AS TotalAppointments
FROM Appointment
GROUP BY AppointmentDate
ORDER BY TotalAppointments DESC;

-- Query 23
-- Rationale: Display each patient along with their most recent appointment date.
SELECT p.PatientID, p.FirstName, p.LastName, MAX(a.AppointmentDate) AS LastVisit
FROM Patient p, Appointment a 
Where p.PatientID = a.PatientID
GROUP BY p.PatientID;

-- Query 24
-- Rationale: Display the total number of patients each insurance provider covers.
SELECT ip.ProviderName, COUNT(p.PatientID)
FROM InsuranceProvider ip, Patient p
Where ip.InsuranceID = p.InsuranceID
GROUP BY ip.ProviderName;

-- Query 25
-- Rationale: Create a view that shows total quantity of each medication prescribed.
CREATE VIEW TotalMedicationPrescribed AS
SELECT med.MedicationID, med.MedicationName, COUNT(pi.PrescriptionID) AS 'TimesPrescribed'
FROM Medication med, PrescriptionItem pi
Where med.MedicationID = pi.MedicationID
GROUP BY med.MedicationID;

SELECT * FROM TotalMedicationPrescribed;