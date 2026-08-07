CREATE DATABASE MOCK_SQL_TEST;
SELECT DATABASE();
USE MOCK_SQL_TEST;
CREATE TABLE patients(
patient_id INT PRIMARY KEY,
patient_name VARCHAR(100) NOT NULL,
age INT CHECK(age>0),
gender VARCHAR(10) NOT NULL,
city VARCHAR (50) NOT NULL,
phone VARCHAR (15) NOT NULL,
is_active BOOLEAN 
);

CREATE TABLE doctors(
doctor_id INT PRIMARY KEY,
doctor_name VARCHAR(100) NOT NULL,
specialty VARCHAR(200) NOT NULL,
phone VARCHAR(15) NOT NULL,
fee decimal(8,2)
);

CREATE TABLE appointments(
appointment_id INT PRIMARY KEY,
patient_id INT,
doctor_id INT,
status ENUM('scheduled', 'completed', 'cancelled'),

FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
FOREIGN KEY(doctor_id) REFERENCES doctors(doctor_id)
);
SHOW TABLES;
ALTER TABLE appointmentments RENAME TO appointments;

-- Inserting the raw data for practicing the DDL and DML
INSERT INTO patients VALUES
(1,'Amit',25,'Male','Delhi','9876543210',TRUE),
(2,'Riya',30,'Female','Mumbai','9876543211',TRUE),
(3,'Arjun',28,'Male','Kolkata','9876543212',FALSE);

INSERT INTO doctors VALUES
(101,'Dr. Sharma','Cardiologist','9991111111',800.00),
(102,'Dr. Gupta','Dermatologist','9992222222',600.00);
INSERT INTO appointments VALUES
(1001,1,101,'scheduled'),
(1002,2,102,'completed'),
(1003,3,101,'cancelled');

SELECT * FROM Patients;
SELECT * FROM appointments;
-- DELETE the appointment where status is cancelled.
DELETE FROM appointments
WHERE status='Cancelled';
SELECT * FROM appointments;
/* trying to delete the patient from patients table
foreign key restrain by the appointmemnt table
referential integrity*/
DELETE FROM patients 
WHERE patient_id=1;
TRUNCATE TABLE appointments;
SELECT * FROM appointments;
ALTER TABLE appointments
MODIFY appointment_id INT AUTO_INCREMENT;
INSERT INTO appointments( patient_id, doctor_id, status) VALUES( 2,102, 'completed');
SELECT * FROM appointments;

DROP TABLE appointments;
SELECT * FROM appointments;
SHOW TABLES;