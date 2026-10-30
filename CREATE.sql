CREATE TABLE Department (
    DepartmentID    INTEGER PRIMARY KEY,
    DepartmentName  VARCHAR NOT NULL UNIQUE,
    Location        VARCHAR
);

CREATE TABLE InsuranceProvider (
    InsuranceID         INTEGER PRIMARY KEY,
    ProviderName        VARCHAR NOT NULL UNIQUE,
    CoveragePercentage  INT
);

CREATE TABLE Medication (
    MedicationID    INTEGER PRIMARY KEY,
    MedicationName  VARCHAR NOT NULL,
    Manufacturer    VARCHAR,
    UnitPrice       INT NOT NULL
);

CREATE TABLE Patient (
    PatientID   INTEGER PRIMARY KEY,
    FirstName   VARCHAR NOT NULL,
    LastName    VARCHAR NOT NULL,
    Birthday    DATE,
    Gender      CHAR,
    Phone       VARCHAR,
    InsuranceID INTEGER,
    FOREIGN KEY (InsuranceID) REFERENCES InsuranceProvider(InsuranceID)
);

CREATE TABLE Doctor (
    DoctorID        INTEGER PRIMARY KEY,
    FirstName       VARCHAR NOT NULL,
    LastName        VARCHAR NOT NULL,
    Specialization  VARCHAR NOT NULL,
    Phone           VARCHAR,
    DepartmentID    INTEGER NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Appointment (
    AppointmentID   INTEGER PRIMARY KEY,
    AppointmentDate DATE NOT NULL,
    AppointmentTime VARCHAR NOT NULL,
    Status          VARCHAR,
    Reason          VARCHAR,
    DoctorID        INTEGER NOT NULL,
    PatientID       INTEGER NOT NULL,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

CREATE TABLE Diagnosis (
    DiagnosisID     INTEGER PRIMARY KEY,
    DiagnosisName   VARCHAR NOT NULL,
    Description     VARCHAR,
    Severity        VARCHAR ,
    AppointmentID   INTEGER NOT NULL,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

CREATE TABLE Bill (
    BillID          INTEGER PRIMARY KEY,
    TotalAmount     INT NOT NULL,
    PaymentStatus   VARCHAR,
    PaymentDate     DATE,
    AppointmentID   INTEGER NOT NULL UNIQUE,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

CREATE TABLE Prescription (
    PrescriptionID  INTEGER PRIMARY KEY,
    IssueDate       DATE NOT NULL,
    Notes           VARCHAR,
    AppointmentID   INTEGER NOT NULL,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

CREATE TABLE PrescriptionItem (
    PrescriptionID  INTEGER NOT NULL,
    MedicationID    INTEGER NOT NULL,
    Dosage          VARCHAR NOT NULL,
    DurationDays    INTEGER,
    PRIMARY KEY (PrescriptionID, MedicationID),
    FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID),
    FOREIGN KEY (MedicationID) REFERENCES Medication(MedicationID)
);
