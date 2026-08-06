USE healthcare_db;
SELECT * FROM patients;
SELECT DISTINCT city FROM patients 
WHERE is_active= 1
 AND (
 first_name LIKE 'a%' OR
 first_name LIKE 'e%' OR
 first_name LIKE 'i%' OR 
 first_name LIKE 'o%' OR
 first_name LIKE 'u%');
 
 SELECT * FROM appointments;
 SELECT * FROM appointments
 WHERE status='completed' 
 AND  appointment_date>= '2024-05-01' AND appointment_date< '2024-06-01'
 AND fee IN(2000,3000,4000,5000)
 ORDER BY appointment_date DESC; 
 
 SELECT * FROM patients;
 -- patients with a missing city or a missing date_of_birth.
 SELECT * FROM patients
 WHERE city IS NULL or date_of_birth IS NULL;
 
 -- Top 5 highest-fee appointments whose status is NOT IN ('cancelled', 'no-show')
 SELECT * FROM appointments
 WHERE status NOT IN ('cancelled', 'no-show') ORDER BY fee DESC LIMIT 5; 
 
 -- Doctors whose specialty contains 'logy', alphabetical name only. 
 SELECT *
 FROM doctors
 WHERE specialty LIKE '%logy%' ORDER by first_name ASC;
 
 SELECT * FROM appointments;
 
 -- Appointments with fee BETWEEN 1000 and 3000, showing fee and GST column. 
 SELECT appointment_id,
 patient_id,
 doctor_id,
 appointment_date,
 fee,
 fee* 0.18 AS GST
 FROM appointments
 WHERE fee BETWEEN 1000 AND 3000;
 SELECT * FROM doctors;
 -- Distinct specialties of doctors whose name starts with 'A'.
 SELECT DISTINCT specialty AS specialty,
 doctor_id,
 first_name as doctor_name,
 last_name as doctor_surname,
department_id,
hire_date,
salary
FROM doctors
WHERE first_name LIKE 'A%';
 
 -- Find patients whose name starts with A and whose city contains'ba' anywhere in it. 
 SELECT * 
 FROM patients
 WHERE first_name LIKE 'A%' AND city LIKE '%ba%';
 
 -- Show the billing records from january 2024, sorted by amount descending, show top 5.
 SELECT *
 FROM billing
 WHERE billing_date >= '2024-01-01' 
 ORDER BY amount DESC LIMIT 5;
 
 SELECT * FROM patients;
 -- patients from Mumbai, Delhi or Chennai who have a phone number and contact.
 SELECT patient_id,
 first_name AS Patient_Name,
 last_name AS Patient_surname,
 date_of_birth,
 gender,
 city, 
 phone AS contact_number
 FROM patients
 WHERE phone IS NOT NULL 
 AND city IN ('Mumbai', 'Delhi','Chennai');
 
 -- Patient's name, phone but display 'No phone on missing file' when the phone is missing, sort patients with missing phone first.
 SELECT first_name AS patient_name,
 COALESCE(phone,'NO Phone On Missing File') AS phone
 FROM patients
 ORDER BY phone IS NOT NULL, first_name;
 