use healthcare_db;
DESCRIBE patients;
SHOW CREATE TABLE appointments;

 DESCRIBE appointments;
 ALTER TABLE appointments
 DROP FOREIGN KEY appointments_ibfk_1;
 DESCRIBE appointments;

SHOW CREATE TABLE billing;
ALTER TABLE billing
DROP FOREIGN KEY billing_ibfk_1;
ALTER TABLE patients
MODIFY COLUMN patient_id INT UNSIGNED NOT NULL;
DESCRIBE patients;
DESCRIBE appointments;
START TRANSACTION;
ALTER TABLE appointments
ADD CONSTRAINT appointments_bfk_1
FOREIGN KEY (patient_id)
REFERENCES patients(patient_id);
SHOW CREATE TABLE patients;
SHOW CREATE TABLE appointments;
ALTER TABLE appointments
MODIFY COLUMN patient_id INT UNSIGNED NOT NULL;
SHOW CREATE TABLE appointments;
SHOW CREATE TABLE billing;
ALTER TABLE billing
DROP FOREIGN KEY billing_ibfk_2;
SHOW CREATE TABLE billing;
SHOW CREATE TABLE appointments;
ALTER TABLE appointments
DROP FOREIGN KEY appointments_ibfk_2;
ALTER TABLE doctors 
MODIFY COLUMN doctor_id INT UNSIGNED NOT NULL;
SHOW CREATE TABLE appointments;
ALTER TABLE appointments
ADD CONSTRAINT appoinments_bfk_1
FOREIGN KEY (patient_id)
REFERENCES patients(patient_id);
ALTER TABLE appointments
MODIFY COLUMN doctor_id INT UNSIGNED NOT NULL;
ALTER TABLE appointments
ADD CONSTRAINT appointment_bfk_2
FOREIGN KEY (doctor_id)
REFERENCES doctors(doctor_id);
START TRANSACTION;
ALTER TABLE billing
MODIFY COLUMN patient_id INT UNSIGNED;
ALTER TABLE billing 
MODIFY COLUMN doctor_id INT UNSIGNED;
commit;
START TRANSACTION;
ALTER TABLE billing 
ADD CONSTRAINT billing_bfk_1
FOREIGN KEY (patient_id)
REFERENCES patients(patient_id);
ALTER TABLE billing
ADD CONSTRAINT billing_bfk_2
FOREIGN KEY (doctor_id)
REFERENCES doctors(doctor_id);
DESCRIBE appointments;
ALTER TABLE appointments
MODIFY COLUMN appointment_id INT UNSIGNED NOT NULL;
DESCRIBE appointments;
CREATE TABLE numeric_test(
decimal_value DECIMAL(10,2),
float_value FLOAT
);
INSERT INTO numeric_test (decimal_value, float_value)
VALUES (0.1,0.1), (0.2,0.2);
SELECT * FROM numeric_test;
SELECT CAST(0.1 AS DECIMAL(10,2) +
CAST(0.2 AS DECIMAL(10,2)) AS decimal_result;
CAST(0.1 AS FLOAT) + CAST(0.2 AS FLOAT) AS float_result;
SELECT decimal_value, float_value
FROM numeric_test;
SELECT 
SUM(decimal_value) AS decimal_sum,
SUM(float_value) AS float_sum
FROM numeric_test;
SELECT decimal_value,
float_value,
decimal_value=float_value AS same_value
FROM numeric_test;