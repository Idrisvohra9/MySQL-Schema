CREATE DATABASE HospitalDB;

USE HospitalDB;

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Create Doctors table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    DoctorName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create Patients table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    PatientName VARCHAR(100) NOT NULL,
    DateOfBirth DATE,
    Gender VARCHAR(10)
);

-- Create Appointments table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME,
    Diagnosis TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Create Medications table
CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY AUTO_INCREMENT,
    MedicationName VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50)
);

-- Create Patient_Medications table
CREATE TABLE Patient_Medications (
    PatientMedicationID INT PRIMARY KEY AUTO_INCREMENT,
    AppointmentID INT,
    MedicationID INT,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);
-- Insert into Departments
INSERT INTO Departments (DepartmentName) VALUES 
('Cardiology'), 
('Neurology'), 
('Pediatrics'), 
('Orthopedics');

-- Insert into Doctors
INSERT INTO Doctors (DoctorName, DepartmentID) VALUES 
('Dr. John Smith', 1), 
('Dr. Emily Davis', 2), 
('Dr. Sarah Johnson', 3), 
('Dr. Michael Brown', 4);

-- Insert into Patients
INSERT INTO Patients (PatientName, DateOfBirth, Gender) VALUES 
('Alice Williams', '1985-04-12', 'Female'), 
('Bob Taylor', '1990-07-23', 'Male'), 
('Cathy Adams', '2000-01-16', 'Female');

-- Insert into Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Diagnosis) VALUES 
(1, 1, '2024-08-10 10:30:00', 'Chest Pain'), 
(2, 2, '2024-08-11 14:00:00', 'Migraine'), 
(3, 3, '2024-08-12 09:00:00', 'Fever');

-- Insert into Medications
INSERT INTO Medications (MedicationName, Dosage) VALUES 
('Aspirin', '100mg'), 
('Ibuprofen', '200mg'), 
('Paracetamol', '500mg');

-- Insert into Patient_Medications
INSERT INTO Patient_Medications (AppointmentID, MedicationID) VALUES 
(1, 1), 
(2, 2), 
(3, 3);
