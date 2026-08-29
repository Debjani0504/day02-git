USE healthcare_db; 
-- Allpatients with appointment count 
/* Write all patients with their appointment count, including patients with zero appointments; */ 
SELECT 
p.patient_id,
p.first_name, 
COUNT(a.appointment_id) AS appointment_Count -- it takes NULL values as 0 
FROM patients p 
LEFT JOIN appointments a 
ON p.patient_id= a.patient_id  
GROUP BY p.patient_id,
p.first_name; 
-- 2. Patients who never had an appointment 
-- q. Find all patients who have never booked an appointments. 
SELECT 
p.patient_id,
p.first_name,
p.last_name, 
a.appointment_id
FROM patients p 
LEFT JOIN appointments a  
ON p.patient_id =a.patient_id 
WHERE a.appointment_id IS NULL; 
-- 3. Doctors with no appointments 
-- Q> Find doctors who have never had an appointment. 
SELECT 
d.doctor_id,
d.first_name,
d.last_name, 
a.appointment_id  
FROM doctors d
LEFT JOIN appointments a 
ON d.doctor_id= a.doctor_id 
WHERE a.appointment_id IS NULL;
-- 4. All departments and their doctor count 
-- Q. Show every department and the number of doctors in each department,including departments with zero doctors. 
SELECT 
dep.department_id,
dep.department_name, 
COUNT(d.doctor_id) AS doctor_count 
FROM departments dep 
JOIN doctors d 
ON dep.department_id=d.department_id 
GROUP BY 
dep.department_id, 
dep.department_name; 
-- Left Join + Where 
-- q. Show the patients who have a Completed appointments. 
SELECT 
p.patient_id,
p.first_name,
a.appointment_id, 
a.status 
FROM patients p 
LEFT JOIN appointments a 
ON p.patient_id=a.patient_id 
WHERE status='Completed';
-- Compare the On VS WHERE 
SELECT 
p.patient_id, 
p.first_name,
a.appointment_id,
a.status 
FROM patients p 
LEFT JOIN appointments a 
On p.patient_id=a.patient_id AND a.status='Completed'; -- All patient remains but only completed appointments are attached. 
-- 7. RIGHT JOIN 
-- Q. Show all appointments and the corresponding patients information, even if an appointment doesn't have a matching point. 
SELECT 
a.appointment_id,
a.patient_id,
p.first_name,
p.last_name 
FROM patients p 
RIGHT JOIN appointments a 
ON p.patient_id= a.patient_id;

-- 8. Rewrite Right Join as Left Join 
SELECT 
a.appointment_id,
a.patient_id,
p.first_name,
p.last_name  
FROM appointments a 
LEFT JOIN patients p 
ON a.patient_id=p.patient_id;