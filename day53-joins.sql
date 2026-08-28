USE healthcare_db; 
-- JOIN 1-- Appointments + Patient Names 
-- List every appointment with the patient_name.
SELECT 
a.appointment_id, 
CONCAT(p.first_name, ' ', p.last_name) AS patient_name, 
a.appointment_date, 
a.fee,
a.status 
FROM appointments a 
INNER JOIN patients p 
ON a.patient_id= p.patient_id; 
-- JOIN 2-- Appointments + Doctor Names 
-- List every appointment with the doctor's name and specialty 
SELECT 
a.appointment_id, 
CONCAT(d.first_name, ' ', d.last_name) AS doctor_name, 
d.specialty, 
a. appointment_date, 
a.fee, 
a.status
FROM appointments a 
INNER JOIN doctors d 
ON a.doctor_id=d.doctor_id;
-- JOIN 3-- Appointments + Patients + Doctors 
-- Show the appointment ID, patient names, doctor name and fee 
SELECT 
a.appointment_id, 
CONCAT(p.first_name, ' ', p.last_name) AS patient_name, 
CONCAT(d.first_name, ' ', d.last_name) AS doctor_name, 
a.fee, 
a.status 
FROM appointments a 
JOIN patients p 
ON a.patient_id=p.patient_id 
JOIN doctors d
ON a.doctor_id=d.doctor_id;
-- JOIN 4-- Doctor + Departments 
-- doctors with department names 
SELECT d.doctor_id, 
CONCAT(d.first_name, ' ', d.last_name) AS doctor_name, 
d.specialty, 
dep.department_id,
dep.department_name 
FROM doctors d 
JOIN departments dep 
ON d.department_id=dep.department_id; 
-- JOIN 5-- Completed Appointments + Patient Name 
-- Show only completed appointemnts with the patient's name
SELECT 
a.appointment_id, 
p.patient_id, 
CONCAT(p.first_name, ' ', p.last_name) AS patient_name, 
a.appointment_date, 
a.fee, 
a.status 
FROM appointments a 
JOIN patients p 
ON a.patient_id= p.patient_id 
WHERE a.status='Completed' ;
-- JOIN 6 -- Completed Appointments + Doctors 
-- Show completed appointments with the doctor's name and specialty 
SELECT 
a.appointment_id, 
CONCAT(d.first_name, ' ', d.last_name) AS doctor_name, 
d.specialty, 
a.appointment_date,
a.fee,
a.status 
FROM appointments a 
JOIN doctors d 
ON a.doctor_id= d.doctor_id 
WHERE status= 'Completed' ; 
-- JOIN 7-- Patient + Doctor+ Fee For Scheduled Appointments 
 -- Show patients name, doctor name and fee for scheduled appointments 
 SELECT  
 CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
 CONCAT(d.first_name, ' ', d.last_name) AS doctor_name, 
 a.fee, 
 a.appointment_date, 
 a.status
 FROM appointments a 
 JOIN patients p 
 ON a.patient_id=p.patient_id 
 JOIN doctors d 
 ON a.doctor_id= d.doctor_id 
 WHERE a.status='Scheduled' ;
 -- JOIN 8-- Doctor + Departemnt + Salary Filter 
 -- Show doctors, their specialty, departemnt and salary, but only doctors more than  RS. 50,000.
 SELECT CONCAT(d.first_name, ' ', d.last_name) AS doctor_name, 
 d.specialty,
 dep.department_name, 
 d.salary 
 FROM doctors d 
 JOIN departments dep 
 ON d.department_id = dep.department_id 
 WHERE d.salary >50000; 
 /* Practice Question 1 : 
 List every appointemnt with doctor's name and specialty */ 
 SELECT a.appointment_id, 
 CONCAT(d.first_name, ' ', d.last_name) AS doctor_name, 
 a.appointment_date, 
 a.fee, 
 a.status, 
 d. specialty 
 FROM appointments a 
 JOIN doctors d  
 On a.doctor_id = d.doctor_id;
 /* Practice 2 
 Show patient name, doctor name, and fee for each appointment. (three tables) */
 SELECT 
 CONCAT(p.first_name, ' ', p.last_name) AS patient_name, 
 CONCAT(d.first_name, ' ', d.last_name) AS doctor_name, 
 a.fee 
 FROM appointments a 
 JOIN patients p 
 ON a.patient_id= p.patient_id
 JOIN doctors d 
 ON a.doctor_id=d.doctor_id;