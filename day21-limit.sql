USE healthcare_db;
SHOW TABLES;
SELECT * FROM appointments;
SELECT appointment_id, appointment_date, fee, Status FROM appointments ORDER BY fee DESC LIMIT 3;
SELECT appointment_id, appointment_date, fee Status FROM appointments ORDER BY fee DESC LIMIT 1;
SELECT appointment_id, appointment_date, fee status FROM appointments WHERE status= 'completed' ORDER BY fee ASC LIMIT 3;

SELECT * FROM patients;
SELECT patient_id, first_name AS Patient_name, last_name AS Patient_Surname, gender, registered_date, is_active FROM patients WHERE is_active=1 ORDER BY registered_date DESC LIMIT 5;
SELECT patient_id, first_name AS Patient_name, last_name AS Patient_Surname, gender, registered_date, is_active FROM patients WHERE is_active=1 ORDER BY patient_id ASC LIMIT 5 OFFSET 0;
SELECT patient_id, first_name AS Patient_name, last_name AS Patient_Surname, gender, registered_date, is_active FROM patients WHERE is_active=1 ORDER BY patient_id ASC LIMIT 5 OFFSET 5;
SELECT * FROM appointments;
SELECT appointment_id, appointment_date, fee, status FROM appointments WHERE status='Completed' ORDER BY appointment_date DESC LIMIT 3;
SELECT * FROM patients;
SELECT patient_id, first_name AS Patient_name, last_name AS Patient_surname, gender, city, registered_date, is_active FROM patients WHERE is_active= 1 ORDER BY last_name LIMIT 5 OFFSET 10;
