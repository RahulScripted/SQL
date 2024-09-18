-- Patients
-- 		Patient_id			First_name			Last_name			Date_of_birth			City
-- 			1					Alice			Johnson				 1985-02-15			  New York
-- 			2					Bob				 Smith				 1990-06-20			Los Angeles
-- 			3				  Charlie			 Brown				 1975-09-10			  Chicago
-- 			4				   Diana			 Wilson				 2000-11-30			  Houston
-- 			5					Eve				 Davis				 1982-03-25			  Phoenix

-- Doctors
-- 		Doctor_id			First_name			Last_name			Specialty
-- 			1					John				Doe				Cardiology
-- 			2					Jane				Smith			 Neurology
-- 			3					Sam					Brown			 Pediatrics
-- 			4					Lisa				Wilson			Orthopedics
-- 			5					Tom					Davis			Dermatology

-- Appointments
-- 		Appointment_id			Patient_id			Doctor_id			Appointment_date		Reason
-- 				1					1					1					2023-01-15		Routine Checkup
-- 				2					2					2					2023-02-20			Headache
-- 				3					3					3					2023-03-05		Child Vaccination
-- 				4					4					4					2023-04-10			Knee Pain
-- 				5					5					5					2023-05-25			Skin Rash

-- Prescriptions
-- 		Prescription_id			Appointment_id			Medication				Dosage
-- 				1						1				  Lipitor			  10mg daily
-- 				2						2				 Ibuprofen			200mg as needed
-- 				3						3				  Tylenol			500mg as needed
-- 				4						4				Amoxicillin			500mg 3x daily
-- 				5						5			   Hydrocortisone	  Apply twice daily

-- Questions
-- Q1: List all patients along with their city and date of birth.
-- Q2: Find all appointments for a specific doctor by their specialty.
-- Q3: Identify the medications prescribed to each patient based on their appointments.
-- Q4: List the names of patients who have appointments in 2023.
-- Q5: Get the total number of appointments each doctor has.
-- Q6: Find the average age of patients.
-- Q7: List the specialties of doctors who have more than 2 appointments.
-- Q8: Identify the patients who have more than one appointment.
-- Q9: Get the details of appointments where the reason is 'Routine Checkup'.
-- Q10: Calculate the total number of patients from each city.
-- Q11: List the doctors who have not prescribed any medication.
-- Q12: Find the appointments that do not have any prescriptions.
-- Q13: Identify the patients who are seeing a cardiologist.
-- Q14: Get the names and total number of appointments for each patient, sorted by total number of appointments in descending order.
-- Q15: List the patients who were born before 1980.



CREATE DATABASE IF NOT EXISTS August04Problem;
USE August04Problem;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    city VARCHAR(100)
);

INSERT INTO Patients (patient_id, first_name, last_name, date_of_birth, city)
VALUES
(1, 'Alice', 'Johnson', '1985-02-15', 'New York'),
(2, 'Bob', 'Smith', '1990-06-20', 'Los Angeles'),
(3, 'Charlie', 'Brown', '1975-09-10', 'Chicago'),
(4, 'Diana', 'Wilson', '2000-11-30', 'Houston'),
(5, 'Eve', 'Davis', '1982-03-25', 'Phoenix');

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    specialty VARCHAR(100)
);

INSERT INTO Doctors (doctor_id, first_name, last_name, specialty)
VALUES
(1, 'John', 'Doe', 'Cardiology'),
(2, 'Jane', 'Smith', 'Neurology'),
(3, 'Sam', 'Brown', 'Pediatrics'),
(4, 'Lisa', 'Wilson', 'Orthopedics'),
(5, 'Tom', 'Davis', 'Dermatology');

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    reason VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, reason)
VALUES
(1, 1, 1, '2023-01-15', 'Routine Checkup'),
(2, 2, 2, '2023-02-20', 'Headache'),
(3, 3, 3, '2023-03-05', 'Child Vaccination'),
(4, 4, 4, '2023-04-10', 'Knee Pain'),
(5, 5, 5, '2023-05-25', 'Skin Rash');

CREATE TABLE Prescriptions (
    prescription_id INT PRIMARY KEY,
    appointment_id INT,
    medication VARCHAR(100),
    dosage VARCHAR(100),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

INSERT INTO Prescriptions (prescription_id, appointment_id, medication, dosage)
VALUES
(1, 1, 'Lipitor', '10mg daily'),
(2, 2, 'Ibuprofen', '200mg as needed'),
(3, 3, 'Tylenol', '500mg as needed'),
(4, 4, 'Amoxicillin', '500mg 3x daily'),
(5, 5, 'Hydrocortisone', 'Apply twice daily');


-- Answers

-- Q1: List all patients along with their city and date of birth.
SELECT patient_id, first_name, last_name, date_of_birth, city
FROM Patients;

-- Q2: Find all appointments for a specific doctor by their specialty.
SELECT A.appointment_id, A.patient_id, D.doctor_id, A.appointment_date, A.reason,D.specialty AS specialty
FROM Appointments A
LEFT JOIN Doctors D ON D.doctor_id = A.doctor_id
WHERE D.specialty = 'Cardiology'; -- Can change WHERE D.specialty = 'Cardiology' on own way

-- Q3: Identify the medications prescribed to each patient based on their appointments.
SELECT PR.prescription_id,PR.appointment_id, PR.medication,P.patient_id,P.first_name,P.last_name
FROM Prescriptions PR
LEFT JOIN Appointments A ON PR.appointment_id = A.appointment_id
LEFT JOIN Patients P ON A.patient_id = P.patient_id;

-- Q4: List the names of patients who have appointments in 2023.
SELECT P.patient_id, P.first_name, P.last_name
FROM Patients P
LEFT JOIN Appointments A ON A.patient_id = P.patient_id
WHERE YEAR(A.appointment_date) = '2023';

-- Q5: Get the total number of appointments each doctor has.
SELECT D.doctor_id, COUNT(A.appointment_id) AS total_number
FROM Doctors D
LEFT JOIN Appointments A ON D.doctor_id = A.doctor_id
GROUP BY D.doctor_id
ORDER BY total_number DESC;

-- Q6: Find the average age of patients.
SELECT ROUND(AVG(YEAR(CURDATE()) - YEAR(P.Date_of_birth)),2) AS average_age
FROM Patients P;

-- Q7: List the specialties of doctors who have more than 2 appointments.
SELECT DISTINCT D.specialty
FROM Doctors D
LEFT JOIN Appointments A ON D.doctor_id = A.doctor_id
GROUP BY D.specialty
HAVING COUNT(A.appointment_id) > 2;

-- Q8: Identify the patients who have more than one appointment.
SELECT P.patient_id, P.first_name, P.last_name
FROM Patients P
LEFT JOIN Appointments A ON A.patient_id = P.patient_id
GROUP BY P.patient_id, P.first_name, P.last_name
HAVING COUNT(A.appointment_id) > 1;

-- Q9: Get the details of appointments where the reason is 'Routine Checkup'.
SELECT A.appointment_id, A.patient_id, A.doctor_id, A.appointment_date, A.reason
FROM Appointments A
WHERE A.reason = 'Routine Checkup';

-- Q10: Calculate the total number of patients from each city.
SELECT P.city,COUNT(P.patient_id) AS total_number
FROM Patients P
GROUP BY P.city;

-- Q11: List the doctors who have not prescribed any medication.
SELECT D.doctor_id, D.first_name, D.last_name, D.specialty
FROM Doctors D
LEFT JOIN Appointments A ON D.doctor_id = A.doctor_id
LEFT JOIN Prescriptions PR ON A.appointment_id = PR.appointment_id
GROUP BY D.doctor_id
HAVING COUNT(PR.medication) = 0;

-- Q12: Find the appointments that do not have any prescriptions.
SELECT  A.appointment_id, A.patient_id, A.doctor_id, A.appointment_date, A.reason
FROM Appointments A
LEFT JOIN Prescriptions PR ON A.appointment_id = PR.appointment_id
WHERE PR.appointment_id IS NULL;

-- Q13: Identify the patients who are seeing a cardiologist.
SELECT P.patient_id, P.first_name, P.last_name
FROM Patients P
LEFT JOIN Appointments A ON A.patient_id = P.patient_id
LEFT JOIN Doctors D ON D.doctor_id = A.doctor_id
WHERE D.specialty = 'Cardiology';

-- Q14: Get the names and total number of appointments for each patient, sorted by total number of appointments in descending order.
SELECT P.patient_id, P.first_name, P.last_name,COUNT(A.appointment_id) AS total_number_appointments
FROM Patients P
LEFT JOIN Appointments A ON A.patient_id = P.patient_id
GROUP BY P.patient_id, P.first_name, P.last_name
ORDER BY total_number_appointments DESC;

-- Q15: List the patients who were born before 1980.
SELECT P.patient_id, P.first_name, P.last_name
FROM Patients P
WHERE YEAR(P.Date_of_birth) < '1980';