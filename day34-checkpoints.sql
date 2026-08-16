use healthcare_db;
SELECT * FROM doctors;
SHOW TABLES;
SELECT * FROM departments;
START TRANSACTION;
DESCRIBE doctors;
SELECT MAX(doctor_id) AS
highest_doctor_id
FROM doctors;
INSERT INTO doctors(
doctor_id, first_name, last_name, specialty, department_id, hire_date, salary, fee)
VALUES(37, 'Arjun','Mehta','Neurology','1','2026-08-15',85000,1500);
SELECT * 
FROM doctors
WHERE doctor_id=37;
SELECT doctor_id FROM doctors
WHERE specialty='Neurology';
SELECT * FROM appointments
WHERE doctor_id=5;
START TRANSACTION;
SELECT 
a.appointment_id,
a.doctor_id,
a.fee,
a.fee * 1.12 AS new_fee
FROM appointments a
JOIN doctors d 
ON a.doctor_id=d.doctor_id
WHERE d.specialty='Neurology';
SELECT patient_id, first_name,last_name 
FROM patients
LIMIT 10;
DESCRIBE appointments;
SELECT * FROM appointments;
INSERT INTO appointments(patient_id,doctor_id,appointment_date,fee,status,notes)
VALUES(1, 37, '2026-08-20 10:00:00', 1500, 'scheduled', 'Neurology consultation'),
(2, 37, '2026-08-20 11:00:00', 1500, 'scheduled', 'Neurology consultation'),
(3, 37, '2026-08-20 12:00:00', 1500, 'scheduled', 'Neurology consultation');
SELECT * FROM doctors;
START TRANSACTION;
UPDATE appointments a 
JOIN doctors d 
ON a.doctor_id=d.doctor_id
SET a.fee=a.fee*1.12
WHERE d.specialty='Joint Replacement';
COMMIT;
SELECT * FROM patients;
SELECT * FROM appointments;
SELECT patient_id,first_name,last_name,is_active
FROM patients
WHERE patient_id NOT IN (SELECT patient_id FROM appointments); 
START TRANSACTION;
SET SQL_SAFE_UPDATES=0;
UPDATE patients
SET is_active=0
WHERE patient_id NOT IN (SELECT patient_id FROM appointments); 
SELECT patient_id,first_name,last_name,is_active
FROM patients
WHERE patient_id NOT IN (SELECT patient_id FROM appointments); 
SELECT * FROM appointments;
START TRANSACTION;
UPDATE appointments
SET notes='Patient requested morning appointment'
WHERE appointment_id=1;
UPDATE appointments
SET notes='Follow-up consultation requried'
WHERE appointment_id=2;
SELECT *
FROM appointments
WHERE appointment_id IN(1,2);
SELECT * 
FROM appointments
WHERE status='NO Show';
SET SQL_SAFE_UPDATES=0;
DELETE FROM appointments
WHERE STATUS = 'no-show';
SELECT * 
FROM patients;
SELECT * 
FROM appointments
WHERE patient_id=1;
DELETE FROM patients
WHERE patient_id=1;
SELECT appointment_id, fee
FROM appointments;
START TRANSACTION;
DESCRIBE departments;
UPDATE appointments
SET fee=999;
SELECT appointment_id, fee
FROM appointments;
ROLLBACK;
SELECT appointment_id, fee
FROM appointments;
START TRANSACTION;
INSERT INTO departments(
department_name,floor_number,phone_extension)
VALUES('Pyschiatry',5,5001);
SELECT * FROM departments;
COMMIT;
DESCRIBE billing;
SELECT * FROM billing;
START TRANSACTION;
UPDATE billing
SET payment_status='Overdue'
WHERE payment_status='pending' 
AND billing_date < '2024-03-01';
SELECT * FROM billing
WHERE payment_status='overdue' 
AND billing_date < '2024-03-01';
COMMIT;
DESCRIBE appointments;
SELECT appointment_date, status
FROM appointments
WHERE status='cancelled'
;
DELETE FROM appointments
WHERE status='cancelled'
AND appointment_date< '2024-02-01';
SELECT appointment_date, status
FROM appointments
WHERE status='cancelled';
ROLLBACK;
DESCRIBE patients;
SELECT patient_id, first_name, email
FROM patients;
START TRANSACTION;
UPDATE patients
SET email='arav@gmail.com'
WHERE patient_id=1;
SELECT patient_id, first_name, email
FROM patients;
ALTER TABLE patients
DROP COLUMN email;
DESCRIBE patients;
ROLLBACK;
