USE healthcare_db;
SELECT * FROM Patients;
UPDATE patients SET city=NULL WHERE patient_id=5;
SELECT patient_id, first_name, last_name, city FROM patients WHERE patient_id=5;
SELECT * FROM patients WHERE city iS NULL;
SELECT * FROM patients WHERE city IS NOT NULL;
SELECT patient_id, first_name, city, phone, COALESCE( city, phone, 'unknown')  FROM patients;
SELECT patient_id, first_name, city, IFNULL(city, 'Unknown') AS display_city FROM patients;
SELECT * FROM appointments;
UPDATE appointments SET fee=NULL WHERE appointment_id in (1,2);
SELECT appointment_id, fee, status FROM appointments WHERE appointment_id= 2; 
SELECT appointment_id, fee, status FROM appointments WHERE appointment_id IN (1, 2);
SELECT appointment_id, fee FROM appointments WHERE fee>1000 or fee IS NULL;
SELECT * FROM patients;
ALTER TABLE patients ADD COLUMN home_phne VARCHAR (15), ADD COLUMN mobile_phn VARCHAR(15), ADD COLUMN emergency_phn VARCHAR (15);

SELECT * FROM patients;
UPDATE patients SET home_phne = NULL, mobile_phn = '9876543210', emergency_phn = '9123456789' WHERE patient_id = 1;

UPDATE patients SET home_phne = '03324567890', mobile_phn = '9988776655', emergency_phn = '9111111111' WHERE patient_id = 2;

UPDATE patients SET home_phne = NULL, mobile_phn = NULL, emergency_phn = '9000000000' WHERE patient_id = 3;

UPDATE patients SET home_phne = NULL, mobile_phn = NULL, emergency_phn = NULL WHERE patient_id = 4;
SELECT home_phne, mobile_phn, emergency_phn FROM patients;
SELECT patient_id, COALESCE(home_phne, mobile_phn, emergency_phn, 'NO phone') AS contact_number FROM patients;
SELECT patient_id, home_phne, mobile_phn, emergency_phn, COALESCE (home_phne, mobile_phn, emergency_phn, 'No phone') AS best_contact FROM patients;
