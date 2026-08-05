USE healthcare_db;
SELECT first_name AS patient_name 
FROM patients;
SELECT patient_id AS ID,
first_name AS patient_name,
last_name AS Patient_surname,
city AS patient_from
FROM patients;
SELECT 
appointment_id,
fee,
fee * 1.18 AS Fee_with_GST
FROM appointments;
-- starting the table alias
SELECT 
p.patient_id,
p.first_name,
p.gender
FROM patients AS P;
-- SELECT all completed appointments
SELECT 
a.appointment_id,
a.patient_id,
a.appointment_date
FROM appointments AS a;
-- Table Alias with WHERE
SELECT 
p.patient_id,
p.first_name,
p.gender,
p.city
FROM patients AS P
WHERE p.city='kolkata';
-- Show all completed appointments
SELECT 
a.appointment_id,
a.patient_id,
a.status
FROM appointments AS a
WHERE status='completed';
/* purpose:
SHOW female patients
living in kolkata.
*/
SELECT 
p.patient_id,
p. first_name AS patient_name,
p. last_name AS patient_surname,
p. city
FROM patients AS p
WHERE gender='F' 
AND city= 'Kolkata';
-- Write a clean query
SELECT 
patient_id,
first_name AS patient_name,
last_name AS patient_surname
FROM patients
WHERE gender='m'
ORDER BY first_name;

/* practices of JOINS
Show the patient's name and appointment date. */
SELECT 
p. first_name AS patient_name,
a. appointment_date
FROM patients AS p
JOIN appointments AS a
ON p.patient_id=a.appointment_id;

-- Show the patient'name, doctor ID and appointment status.
SELECT 
p. first_name AS patient_name,
a. doctor_id AS doctor_ID,
a. status
FROM patients AS p
JOIN appointments AS a
ON p.patient_id=a.patient_id;

-- Show all completed appointments with the patient's name.
SELECT
p. first_name AS patient_name,
a. appointment_id,
a. status
FROM patients AS p
JOIN appointments AS a
ON p.patient_id=a.patient_id
WHERE a.status='completed';
-- Show patients from kolkata who have appointments.
SELECT 
p. first_name AS patient_name,
p. city,
a. appointment_date
FROM patients AS p
JOIN appointments AS a
ON p.patient_id=a.patient_id
WHERE p.city='kolkata';

-- 1.show doctor name and patient name.
SELECT 
d. first_name AS doctor_name,
p. first_name AS patient_name
FROM patients AS p
JOIN appointments AS a
JOIN doctors AS d
ON p.patient_id=a.patient_id=d.doctor_id;

-- 2.show doctor name and patient name.
SELECT
    d.first_name AS Doctor_Name,
    p.first_name AS Patient_Name
FROM doctors AS d
JOIN appointments AS a
ON d.doctor_id = a.doctor_id
JOIN patients AS p
ON a.patient_id = p.patient_id;

-- Select patient name and bill amount.
SELECT 
p.first_name as patient_name,
b. amount as total_amount
FROM patients AS p
JOIN billing AS b
ON p.patient_id= b.patient_id;






