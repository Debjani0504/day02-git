USE healthcare_db;
DESCRIBE patients;
DESCRIBE appointments;
ALTER TABLE patients 
ADD COLUMN email VARCHAR (100);
DESCRIBE patients;
SELECT * FROM patients;
DESCRIBE patients;
ALTER TABLE patients
MODIFY COLUMN phone VARCHAR(20);
DESCRIBE patients;
-- Add created_at to appointments. 
ALTER TABLE appointments
ADD COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
SELECT * FROM appointments;
-- Constraint Rejections.
SELECT * 
FROM patients
WHERE phone IS NULL;
ALTER TABLE patients
MODIFY COLUMN phone VARCHAR (20)  NOT NULL;
SELECT * 
FROM appointments;
DESCRIBE appointments;
ALTER TABLE appointments
MODIFY COLUMN notes VARCHAR(200) NOT NULL;
DESCRIBE appointments;
SELECT * FROM appointments;
SELECT * FROM appointments WHERE notes IS NULL;
SET SQL_SAFE_UPDATES=0;
UPDATE appointments SET notes= 'not defined' WHERE notes IS NULL;
ALTER TABLE appointments
MODIFY COLUMN notes VARCHAR (200) NOT NULL;
DESCRIBE appointments;
SELECT * FROM appointments WHERE appointment_date IS NULL;
DESCRIBE appointments;
UPDATE appointments SET appointment_date='2026-08-08 10:00:00' WHERE appointment_date IS NULL;
SELECT * FROM appointments WHERE appointment_date IS NULL;
ALTER TABLE appointments
MODIFY COLUMN appointment_date datetime NOT NULL;
DESCRIBE appointments;
