USE healthcare_db;
DESCRIBE patients;
DESCRIBE doctors;
DESCRIBE appointments;
SELECT * FROM patients;
-- Inserting 10 patients(one multi-row Insert) 
INSERT INTO patients 
(first_name, 
last_name,
date_of_birth,
gender,
phone, 
city,
registered_date,
is_active)
VALUES 
('Rahul', 'Sharma', '1995-03-12', 'M', '9876543210', 'Kolkata', '2026-08-06', TRUE),
('Priya', 'Roy', '1998-07-25', 'F', '9876543211', 'Howrah', '2026-08-06', TRUE),
('Amit', 'Das', '1992-11-18', 'M', '9876543212', 'Durgapur', '2026-08-06', TRUE),
('Sneha', 'Paul', '2000-01-05', 'F', '9876543213', 'Siliguri', '2026-08-06', TRUE),
('Rohan', 'Sen', '1997-06-30', 'M', '9876543214', 'Kolkata', '2026-08-06', TRUE),
('Ananya', 'Ghosh', '1999-09-15', 'F', '9876543215', 'Asansol', '2026-08-06', TRUE),
('Sourav', 'Dey', '1993-02-28', 'M', '9876543216', 'Bardhaman', '2026-08-06', TRUE),
('Pooja', 'Mitra', '1996-12-10', 'F', '9876543217', 'Kalyani', '2026-08-06', TRUE),
('Arjun', 'Bose', '1994-04-08', 'M', '9876543218', 'Hooghly', '2026-08-06', TRUE),
('Neha', 'Chatterjee', '2001-08-20', 'F', '9876543219', 'Kolkata', '2026-08-06', TRUE);

SELECT * FROM patients;

SELECT * FROM doctors;
INSERT INTO
 doctors( first_name, last_name, specialty, department_id,hire_date, salary)
 VALUE 
 ('Sanjay', 'Mukherjee', 'Cardiology', 1, '2024-01-15', 120000),
('Ritika', 'Sen', 'Neurology', 2, '2023-06-20', 135000),
('Aman', 'Kapoor', 'Orthopedics', 3, '2022-09-10', 110000);
SELECT * FROM doctors;
DESCRIBE appointments;
INSERT INTO 
appointments
(patient_id, doctor_id, appointment_date,fee,status,notes)
VALUES
(1, 1, '2026-08-10 10:00:00', 800, 'Scheduled', 'General consultation'),
(2, 2, '2026-08-11 11:30:00', 1200, 'Completed', 'Migraine follow-up'),
(3, 3, '2026-08-12 09:00:00', 1000, 'Scheduled', 'Knee pain'),
(4, 1, '2026-08-13 14:30:00', 900, 'Cancelled', 'Patient cancelled'),
(5, 2, '2026-08-14 16:00:00', 1500, 'Completed', 'Routine check-up');
SELECT * FROM appointments;
INSERT INTO appointments
(patient_id, doctor_id, appointment_date, fee, notes)
Values (1,999, '2026-08--20 10:00:00', 1000, 'Testing for foreign key');
SELECT * FROM patients;
-- Insert one new patient named as Nikita Sureka  from Kolkata
INSERT INTO 
patients
(first_name, last_name)
VALUE 
('Nikita', 'Sureka');
SELECT * FROM patients;
INSERT INTO appointments
(patient_id, doctor_id, appointment_date, fee)
VALUE (2,1, '2026-08-15 03:00:00',2000);
SELECT * FROM appointments;

