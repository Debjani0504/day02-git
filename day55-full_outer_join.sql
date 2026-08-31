USE healthcare_db; 
-- 1. LEFT JOIN 
SELECT DISTINCT MIN(p.patient_id) AS patient_id,
CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
a.appointment_id 
FROM patients p 
LEFT JOIN appointments a 
ON p.patient_id=a.patient_id 
GROUP BY p.first_name, p.last_name, a.appointment_id;
-- 2. RIGHT JOIN 
SELECT DISTINCT
p.patient_id, 
CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
a.appointment_id
FROM appointments a 
RIGHT JOIN patients p 
ON a.patient_id=p.patient_id; 
-- 3.Full OUTER JOIN emulation 
SELECT DISTINCT 
p.patient_id, 
CONCAT(p.first_name, ' ', p.last_name) AS patient_name, 
a.appointment_id 
FROM patients p 
LEFT JOIN appointments a 
ON p.patient_id=a.patient_id 
UNION 
SELECT DISTINCT 
p.patient_id,
CONCAT(p.first_name,' ', p.last_name) AS patient_name, 
 a.appointment_id  
 FROM patients p 
 RIGHT JOIN appointments a 
 On p.patient_id=a.patient_id;
-- 4.Create time-slots 
CREATE TABLE time_slots (
slot_id INT PRIMARY KEY  AUTO_INCREMENT,
slot VARCHAR(20)
) ;

-- 5.Insert slots 
INSERT INTO time_slots(slot) 
VALUES
('9:0AM'),
('10:00AM'),
('11:00AM'),
('12:00PM');
SELECT * FROM time_slots;  
-- CROSS JOIN 
SELECT 
d.doctor_id, 
CONCAT(d.first_name, ' ', d.last_name) AS doctor_name, 
s.slot 
FROM doctors d 
CROSS JOIN time_slots s; 
-- 7. Count Combinations. 
SELECT COUNT(*) AS total_combinations
FROM doctors d 
CROSS JOIN time_slots s;
-- 8.Deliberate accidential CROSS JOIN 
SELECT d.doctor_id,
d.first_name, 
s.slot 
FROM doctors d, 
time_slots s;