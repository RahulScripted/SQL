-- Patients
-- 	Patient_id			First_name			Last_name			Date_of_birth			City
-- 		1					John				Doe				 1985-05-15			  New York
-- 		2					Jane			   Smith			 1990-07-20			 Los Angeles
-- 		3					Mary			  Johnson			 1978-09-30			   Chicago
-- 		4					James			 Williams			 1982-12-12			   Houston
-- 		5				  Patricia			   Brown			 1995-03-22			   Phoenix

-- Doctors
-- 		Doctor_id			  First_name			  Last_name			Specialty
-- 			1					Alice					Adams			Cardiology
-- 			2					 Bob					Baker			Neurology
-- 			3				   Charlie					Clark			Pediatrics
-- 			4					Diana					Davis		    Orthopedics
-- 			5				   Edward					Evans		  General Medicine

-- Appointments
-- Appointment_id			Patient_id			Doctor_id			Appointment_date			Diagnosis
-- 			1					1					1				   2024-01-15			   Hypertension
-- 			2					2					2				   2024-01-20				Migraine
-- 			3					1					3				   2024-02-15				   Flu
-- 			4					3					4				   2024-03-01				Fracture
-- 			5					4					5				   2024-03-10				Diabetes

-- Prescriptions
-- 	Prescription_id			Appointment_id			Medication_name				Dosage
-- 			1						1					Atenolol				 50mg
-- 			2						2				   Sumatriptan				 25mg
-- 			3						3					Ibuprofen				 200mg
-- 			4						4				  Acetaminophen				 500mg
-- 			5						5					Metformin				 500mg

-- Questions
-- Q1: List all patients along with their city.
-- Q2: Find the total number of appointments for each patient.
-- Q3: Identify the doctors each patient has had appointments with.
-- Q4: List the names of patients who had appointments in January 2024.
-- Q5: Get the average age of patients for each doctor’s specialty.
-- Q6: Find the total number of appointments for each doctor.
-- Q7: List the medications prescribed during each appointment.
-- Q8: Identify the doctor who has had the most appointments.
-- Q9: Get the details of appointments with a diagnosis of 'Flu'.
-- Q10: Calculate the total number of medications prescribed to each patient.
-- Q11: List the doctors who have not prescribed any medications.
-- Q12: Find the appointments with a total number of medications greater than 1.
-- Q13: Identify the patients who have had appointments with more than one doctor.
-- Q14: Get the names and dosages of medications prescribed by each doctor, sorted by doctor’s last name and then by medication name.
-- Q15: List the patients who have not had any appointments.




CREATE DATABASE IF NOT EXISTS July24Problem;
USE July24Problem;

CREATE TABLE Patients(
	Patient_id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Date_of_birth DATE,
    City VARCHAR(50)
);

INSERT INTO Patients
(Patient_id,First_name,Last_name,Date_of_birth,City)
VALUES
(1,"John","Doe","1985-05-15","New York"),
(2,"Jane","Smith","1990-07-20","Los Angeles"),
(3,"Mary","Johnson","1978-09-30","Chicago"),
(4,"James","Williams","1982-12-12","Houston"),
(5,"Patricia","Brown","1995-03-22","Phoenix");

CREATE TABLE Doctors(
	Doctor_id INT PRIMARY KEY,
	First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Specialty VARCHAR(100)
);

INSERT INTO Doctors
(Doctor_id,First_name,Last_name,Specialty)
VALUES
(1,"Alice","Adams","Cardiology"),
(2,"Bob","Baker","Neurology"),
(3,"Charlie","Clark","Pediatrics"),
(4,"Diana","Davis","Orthopedics"),
(5,"Edward","Evans","General Medicine");

CREATE TABLE Appointments(
	Appointment_id INT PRIMARY KEY,
    Patient_id INT,
    Doctor_id INT,
    Appointment_date DATE,
    Diagnosis VARCHAR(50)
);

INSERT INTO Appointments
(Appointment_id,Patient_id,Doctor_id,Appointment_date,Diagnosis)
VALUES
(1,1,1,"2024-01-15","Hypertension"),
(2,2,2,"2024-01-20","Migraine"),
(3,1,3,"2024-02-15","Flu"),
(4,3,4,"2024-03-01","Fracture"),
(5,4,5,"2024-03-10","Diabetes");

CREATE TABLE Prescriptions(
	Prescription_id INT PRIMARY KEY,
    Appointment_id INT,
    Medication_name VARCHAR(50),
    Dosage VARCHAR(10)
);

INSERT INTO Prescriptions
(Prescription_id,Appointment_id,Medication_name,Dosage)
VALUES
(1,1,"Atenolol","50mg"),
(2,2,"Sumatriptan","25mg"),
(3,3,"Ibuprofen","200mg"),
(4,4,"Acetaminophen","500mg"),
(5,5,"Metformin","500mg");


-- Answers

-- Q1: List all patients along with their city.
SELECT Patient_id,First_name,Last_name,City
FROM Patients;

-- Q2: Find the total number of appointments for each patient.
SELECT COUNT(A.Appointment_id)
FROM Appointments A
JOIN Patients P
ON A.Patient_id = P.Patient_id
GROUP BY A.Patient_id;

-- Q3: Identify the doctors each patient has had appointments with.
SELECT P.Patient_id,P.First_name,P.Last_name,D.First_name AS Doctor_First_name,D.Last_name AS Doctor_Last_name
FROM Patients P
JOIN Appointments A
ON P.Patient_id = A.Patient_id
JOIN Doctors D
ON A.Doctor_id = D.Doctor_id;

-- Q4: List the names of patients who had appointments in January 2024.
SELECT P.Patient_id,P.First_name,P.Last_name
FROM Patients P
JOIN Appointments A
ON P.Patient_id = A.Patient_id
WHERE MONTH(A.Appointment_date) = 1 AND YEAR(A.Appointment_date) = 2024;

-- Q5: Get the average age of patients for each doctor’s specialty.
SELECT D.Specialty,AVG(YEAR(CURDATE()) - YEAR(P.Date_of_birth)) AS Average_Age
FROM Patients P
JOIN Appointments A
ON P.Patient_id = A.Patient_id
JOIN Doctors D
ON A.Doctor_id = D.Doctor_id
GROUP BY D.Specialty;

-- Q6: Find the total number of appointments for each doctor.
SELECT D.Doctor_id,COUNT(A.Appointment_id) AS total_number_appointments
FROM Appointments A
JOIN Doctors D
ON D.Doctor_id = A.Doctor_id
GROUP BY D.Doctor_id;

-- Q7: List the medications prescribed during each appointment.
SELECT A.Appointment_id,PR.Medication_name
FROM Appointments A
JOIN Prescriptions PR
ON A.Appointment_id = PR.Prescription_id;

-- Q8: Identify the doctor who has had the most appointments.
SELECT D.Doctor_id,D.First_name AS Doctor_First_name,D.Last_name AS Doctor_Last_name
FROM Doctors D
JOIN Appointments A
ON A.Doctor_id = D.Doctor_id
GROUP BY D.Doctor_id
ORDER BY COUNT(A.Appointment_id) DESC
LIMIT 1;

-- Q9: Get the details of appointments with a diagnosis of 'Flu'.
SELECT *
FROM Appointments A
WHERE A.Diagnosis = 'Flu';

-- Q10: Calculate the total number of medications prescribed to each patient.
SELECT P.Patient_id,P.First_name,P.Last_name,COUNT(PR.Medication_name) AS total_number_medications
FROM Patients P
JOIN Appointments A
ON P.Patient_id = A.Patient_id
JOIN Prescriptions PR
ON PR.Appointment_id = A.Appointment_id
GROUP BY P.Patient_id;

-- Q11: List the doctors who have not prescribed any medications.
SELECT D.Doctor_id,D.First_name AS Doctor_First_name,D.Last_name AS Doctor_Last_name
FROM Doctors D
LEFT JOIN Appointments A
ON A.Doctor_id = D.Doctor_id
LEFT JOIN Prescriptions PR
ON PR.Appointment_id = A.Appointment_id
WHERE PR.Prescription_id IS NULL;

-- Q12: Find the appointments with a total number of medications greater than 1.
SELECT PR.Appointment_id,COUNT(PR.Medication_name) AS total_number_medications
FROM Prescriptions PR
GROUP BY PR.Appointment_id
HAVING COUNT(PR.Medication_name) > 1;

-- Q13: Identify the patients who have had appointments with more than one doctor.
SELECT P.Patient_id,P.First_name,P.Last_name,COUNT(A.Patient_id) AS Count
FROM Patients P
JOIN Appointments A
ON P.Patient_id = A.Patient_id
GROUP BY P.Patient_id
HAVING COUNT(A.Patient_id) > 1;

-- Q14: Get the names and dosages of medications prescribed by each doctor, sorted by doctor’s last name and then by medication name.
SELECT D.Doctor_id,D.First_name AS Doctor_First_name,D.Last_name AS Doctor_Last_name,PR.Medication_name,PR.Dosage
FROM Doctors D
JOIN Appointments A
ON A.Doctor_id = D.Doctor_id
JOIN Prescriptions PR
ON PR.Appointment_id = A.Appointment_id
ORDER BY D.Last_name DESC,PR.Medication_name;

-- Q15: List the patients who have not had any appointments.
SELECT P.Patient_id,P.First_name,P.Last_name
FROM Patients P
LEFT JOIN Appointments A
ON P.Patient_id = A.Patient_id
WHERE A.Appointment_id IS NULL;