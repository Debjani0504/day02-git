USE healthcare_db; 
-- DAY52-Capstone 
-- 1. What is the total revenue from completed appointments?
SELECT 
status,
 SUM(fee) AS total_revenue
 FROM appointments 
 WHERE status='Completed'
 GROUP BY Status; 
 /* Insights: This shows the total revenue generated from completed appointments is more than 70,000.*/
 
 -- 2. What is the average appointment fee? 
 SELECT 
 AVG(fee) AS average_fee 
 FROM appointments; 
 /* This shows the average appointment fee is less than 3000. But it changes per appointment.*/ 
 
 -- 3. Which month generated the most revenue? 
 SELECT 
 MONTH(appointment_date) AS month,
 SUM(fee) AS total_revenue 
 FROM appointments 
 WHERE status= 'Completed' 
 GROUP BY Month(appointment_date) 
 ORDER BY total_revenue DESC 
 LIMIT 1; 
 /* Insight: IN AUGUST month totl revenue generated above 20,000 which the most highest earned revenue. */
 
 -- 5. Which doctors had an average fee above RS.2000? 
 SELECT d.doctor_id, 
 CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
 AVG(a.fee) AS average_fee 
 FROM doctors d 
 JOIN appointments a 
 ON d.doctor_id= a.doctor_id 
 GROUP BY d.doctor_id, d.first_name, d.last_name
 HAVING AVG(a.fee) >2000 
 ORDER BY average_fee DESC;
 -- Insight This shows the highest average fee is 8000 of doctor Sunita Iyer. and also there are eight doctors whoes average fee is above 8000. 
 -- Which doctor have at least 5 appointments? 
 SELECT d.doctor_id,
 CONCAT(d.first_name, ' ', d.last_name) doctor_name,
 COUNT(a.appointment_id) As appointment_count
 FROM appointments a 
 JOIN doctors d 
 ON a.doctor_id = d.doctor_id
 GROUP BY doctor_id 
 HAVING COUNT(a.appointment_id)>=5;
 -- Insights: there are three doctors who have more than 5 appointments.  
 -- How many appointments were completed vs. cancelled for each doctor? 
 SELECT d.doctor_id, 
 CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
 SUM(CASE 
 WHEN a.status='Completed' THEN 1 ELSE 0 
 END) AS COMPLETED, 
 SUM(CASE 
 WHEN a.status='Cancelled' THEN 1 ELSE 0 
 END) AS CANCELLED 
 FROM appointments a 
 JOIN doctors d 
 ON a.doctor_id=d.doctor_id 
 GROUP BY d.doctor_id
 ORDER BY d.doctor_id ASC;
 -- This compare the completed and cancelled appointments for each doctors. 
 DESCRIBE patients;
 -- Who are the oldest active patients? 
 SELECT MIN(patient_id) AS patient_id, -- picks the lowest ID(oldest record)
 CONCAT(first_name, ' ', last_name) AS patient_name, 
 TIMESTAMPDIFF(year, date_of_birth,CURDATE()) AS age
 FROM patients
 WHERE is_active=1 
 GROUP BY patient_name, age
 ORDER BY age DESC;  
 /* Insight: this suggesting the oldest patients registered in the data base.*/ 
 -- Which appointment status is most common? 
 SELECT 
 status, 
 COUNT(*)  AS total_appointments 
 FROM appointments 
 GROUP BY status 
 ORDER BY total_appointments DESC;
/* Insight: Completed is the most common appointment status, with 27 appointments, 
which suggesting that majority of scheduled appointments successfully completed. */ 
 -- What percentage of appointments were completed? 
 SELECT 
 ROUND( 
 SUM( CASE WHEN status='Completed' 
 THEN 1 ELSE 0 END) * 100/ COUNT(*), 2) AS Completed_appointments
 FROM appointments;
-- Insight: 49 percentage was completed that means a medium completation rate among scheduled appointments.  
-- What are the top months by revenue? 
SELECT 
DATE_FORMAT(appointment_date, '%y-%m') As date_format, 
SUM(fee) AS total_revenue 
FROM appointments 
WHERE status= 'Completed'
GROUP BY date_format 
ORDER BY total_revenue DESC; 
-- another way of solve this question is given below
SELECT
    MONTHNAME(appointment_date) AS month,
    SUM(fee) AS total_revenue
FROM appointments
WHERE status = 'Completed'
GROUP BY MONTH(appointment_date), MONTHNAME(appointment_date)
ORDER BY total_revenue DESC; 
-- August month in 2026 generate the highest revenue which is above the 22000. 
