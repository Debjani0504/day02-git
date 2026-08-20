USE healthcare_db;
SELECT doctor_id, status,
COUNT(*) AS appointment_num
FROM appointments
WHERE status='Completed'
GROUP BY doctor_id, status
HAVING COUNT(*)>2;
-- Cities with>5 patients
SELECT city,
COUNT(*) AS total_number_of_patients
FROM patients
GROUP BY city
HAVING COUNT(*)>5; 
-- Doctors with average fee>2000
SELECT doctor_id, 
AVG(fee) AS average_fee
FROM appointments
GROUP BY doctor_id
HAVING AVG(fee)>2000; 
-- Status with total revenue>10000
SELECT status,
SUM(fee) AS total_revenue
FROM appointments
GROUP BY status
HAVING SUM(fee)>10000; 
-- Doctors with>= 5 completed appointments
SELECT doctor_id,
COUNT(*) As appointment_num
FROM appointments
WHERE status='completed'
GROUP BY doctor_id
HAVING count(*)>=5; 
-- Cities with>=3 patients
SELECT city,
COUNT(*) AS num_of_patients
FROM patients
GROUP BY city
HAVING COUNT(*) >=3 ;
-- Doctors with total fee>15000
SELECT doctor_id,
SUM(fee) As total_fee
FROM appointments
GROUP BY doctor_id
HAVING SUM(fee)>15000; 
-- Find departemnts with average salary above RS.6000-which clause holds the conditions?
DESCRIBE doctors;
SELECT* FROM doctors;
SELECT department_id, AVG(salary) AS average_salary
FROM doctors
GROUP BY department_id
HAVING AVG(salary)>6000; 