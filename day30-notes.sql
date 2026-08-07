USE healthcare_db;
-- Mark one appointment is completed.
SELECT * 
FROM appointments
WHERE appointment_id=5;

UPDATE appointments
SET status ='scheduled'
WHERE appointment_id = 5;
SELECT * 
FROM appointments
WHERE appointment_id=5;
UPDATE appointments
SET status ='completed'
WHERE appointment_id = 5;
DESCRIBE appointments;

SELECT * FROM doctors WHERE specialty = 'Cardiology';
ALTER TABLE doctors ADD COLUMN fee INT;
select* FROM doctors;
UPDATE doctors SET fee= 1000 WHERE doctor_id >= 1;
DESCRIBE doctors;
SELECT * FROM doctors;
SELECT * FROM doctors WHERE specialty = 'cardiology';
UPDATE doctors SET fee = fee* 1000 WHERE specialty = 'Cardio;ogy';
SET SQL_SAFE_UPDATES=0;
ALTER TABLE doctors ADD COLUMN fee_with_gst decimal;
UPDATE doctors SET fee_with_gst = fee* 1.10 WHERE specialty = 'Cardiology';
SELECT * FROM doctors WHERE specialty ='Cardiology';
-- Deactive a patient
SELECT * 
FROM patients
WHERE patient_id=3;
UPDATE patients SET is_active=0 WHERE patient_id=3;
SELECT * FROM patients WHERE patient_id=3;
SELECT * FROM patients WHERE city='kolkata';
update patients set city= 'culcatta' WHERE patient_id=21;
select * from patients where patient_id=21;
update patients set city='kolkata' WHERE city='culcatta';
select * from patients where patient_id=2;
-- Mark appointment 12 as 'cancelled'.
SELECT * FROM appointments;
DESCRIBE appointments;
Update appointments
SET status= 'cancelled'
WHERE appointment_id=12;
SELECT * FROM appointments WHERE appointment_id=12;
-- Deactivate every patient who has no city recorded.
SELECT *
FROM patients
WHERE city IS NULL;
SET SQL_SAFE_UPDATES=0;
UPDATE patients
SET is_active= 0
WHERE city IS NULL;
SELECT *
FROM patients
WHERE city IS NULL;
