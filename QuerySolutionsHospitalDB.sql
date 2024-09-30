USE HOSPITALDB;

SHOW TABLES;
SELECT * FROM PATIENTS;
SELECT * FROM DOCTORS;
SELECT * FROM DEPARTMENTS;
SELECT * FROM APPOINTMENTS;
SELECT * FROM MEDICATIONS;
SELECT * FROM PATIENT_MEDICATIONS;

-- 1. List All Patients
SELECT 
    PatientName
FROM
    PATIENTS;

-- 2. List All Doctors in a Specific Department
SELECT 
    DOCTORNAME
FROM
    DOCTORS
WHERE
    DEPARTMENTID = (SELECT 
            DEPARTMENTID
        FROM
            DEPARTMENTS
        WHERE
            DEPARTMENTNAME = 'CARDIOLOGY');

-- 3. Find All Appointments for a Specific Patient
SELECT 
    *
FROM
    APPOINTMENTS
WHERE
    PATIENTID = (SELECT 
            PATIENTID
        FROM
            PATIENTS
        WHERE
            PATIENTNAME = 'ALICE WILLIAMS');

-- 4. Find All Doctors and Their Departments
SELECT 
    D.DOCTORNAME, DP.DEPARTMENTNAME
FROM
    DOCTORS D
        JOIN
    DEPARTMENTS DP ON D.DEPARTMENTID = DP.DEPARTMENTID;

-- 5. List All Medications Prescribed in a Specific Appointment

SELECT m.MedicationName, m.Dosage 
FROM Medications m
JOIN Patient_Medications pm ON m.MedicationID = pm.MedicationID
WHERE pm.AppointmentID = 2;

-- 6. Count the number of Appointments for Each Doctor
SELECT 
    D.DOCTORNAME, COUNT(A.APPOINTMENTID) AS AppointmentCount
FROM
    DOCTORS D
        LEFT JOIN
    APPOINTMENTS A ON D.DOCTORID = A.DOCTORID
GROUP BY D.DOCTORNAME;
