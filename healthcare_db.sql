CREATE DATABASE IF NOT EXISTS healthcare_db;
USE healthcare_db;


CREATE TABLE departments (
    department_id   INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    floor_number    INT,
    phone_extension VARCHAR(10)
);

INSERT INTO departments (department_name, floor_number, phone_extension) VALUES
('Cardiology',       3, '3001'),
('Neurology',        4, '4001'),
('Orthopaedics',     2, '2001'),
('Dermatology',      1, '1001'),
('General Medicine', 1, '1002'),
('Paediatrics',      2, '2002');

CREATE TABLE doctors (
    doctor_id     INT PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(50) NOT NULL,
    last_name     VARCHAR(50) NOT NULL,
    specialty      VARCHAR(100),
    department_id INT,
    hire_date     DATE,
    salary        DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO doctors (first_name, last_name, specialty, department_id, hire_date, salary) VALUES
('Amit',    'Sharma',    'Interventional Cardiology', 1, '2018-03-15', 185000.00),
('Priya',   'Nair',      'Electrophysiology',         1, '2020-07-01', 165000.00),
('Rajesh',  'Gupta',     'Neurosurgery',              2, '2017-01-10', 195000.00),
('Sunita',  'Iyer',      'Stroke Medicine',           2, '2021-06-20', 155000.00),
('Vikram',  'Patel',     'Joint Replacement',         3, '2016-11-05', 175000.00),
('Meera',   'Reddy',     'Sports Medicine',           3, '2022-01-15', 145000.00),
('Arjun',   'Das',       'Clinical Dermatology',      4, '2019-09-01', 140000.00),
('Kavitha', 'Menon',     'Cosmetic Dermatology',      4, '2023-02-10', 130000.00),
('Ravi',    'Kumar',     'Internal Medicine',         5, '2015-05-20', 160000.00),
('Ananya',  'Banerjee',  'Family Medicine',           5, '2021-11-01', 135000.00),
('Deepak',  'Joshi',     'Neonatology',               6, '2019-04-15', 170000.00),
('Nisha',   'Agarwal',   'Paediatric Oncology',       6, '2022-08-01', 155000.00);

CREATE TABLE patients (
    patient_id   INT PRIMARY KEY AUTO_INCREMENT,
    first_name   VARCHAR(50) NOT NULL,
    last_name    VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender       ENUM('M','F','Other'),
    phone        VARCHAR(15),
    city         VARCHAR(50),
    registered_date DATE,
    is_active       TINYINT(1) DEFAULT 1
);

INSERT INTO patients (first_name, last_name, date_of_birth, gender, phone, city, registered_date) VALUES
('Aarav',    'Mehta',      '1990-05-12', 'M', '9876543210', 'Mumbai',    '2023-01-05'),
('Diya',     'Sen',        '1985-11-23', 'F', '9876543211', 'Kolkata',   '2023-01-10'),
('Rohan',    'Kapoor',     '1978-03-07', 'M', '9876543212', 'Delhi',     '2023-02-14'),
('Sneha',    'Pillai',     '1995-08-30', 'F', '9876543213', 'Chennai',   '2023-02-20'),
('Karan',    'Singh',      '2000-01-15', 'M', '9876543214', 'Bangalore', '2023-03-01'),
('Pooja',    'Deshmukh',   '1982-12-01', 'F', '9876543215', 'Pune',      '2023-03-15'),
('Aditya',   'Verma',      '1992-06-18', 'M', '9876543216', 'Hyderabad', '2023-04-01'),
('Neha',     'Choudhury',  '1988-09-25', 'F', '9876543217', 'Kolkata',   '2023-04-10'),
('Siddharth','Rao',        '1975-02-14', 'M', '9876543218', 'Mumbai',    '2023-05-01'),
('Anjali',   'Mishra',     '1998-04-08', 'F', '9876543219', 'Chennai',   '2023-05-15'),
('Vivek',    'Pandey',     '1983-07-22', 'M', '9876543220', 'Delhi',     '2023-06-01'),
('Ritu',     'Saxena',     '1996-10-03', 'F', '9876543221', 'Bangalore', '2023-06-15'),
('Manish',   'Tiwari',     '1970-01-30', 'M', '9876543222', 'Pune',      '2023-07-01'),
('Swati',    'Jain',       '2002-03-17', 'F', '9876543223', 'Hyderabad', '2023-07-10'),
('Gaurav',   'Bhatt',      '1991-08-09', 'M', NULL,          'Mumbai',    '2023-08-01'),
('Preeti',   'Kulkarni',   '1987-05-26', 'F', '9876543225', NULL,        '2023-08-15');


CREATE TABLE appointments (
    appointment_id   INT PRIMARY KEY AUTO_INCREMENT,
    patient_id       INT NOT NULL,
    doctor_id        INT NOT NULL,
    appointment_date DATETIME,
    fee              DECIMAL(10,2),
    status           ENUM('scheduled','completed','cancelled') DEFAULT 'scheduled',
    notes            TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

INSERT INTO appointments (patient_id, doctor_id, appointment_date, fee, status, notes) VALUES
(1,  1,  '2024-01-10 09:00:00', 3500.00, 'completed',  'Routine cardiac checkup'),
(2,  3,  '2024-01-12 10:30:00', 2800.00, 'completed',  'Headache evaluation'),
(3,  5,  '2024-01-15 14:00:00', NULL,          'cancelled',  'Knee pain — patient cancelled'),
(4,  7,  '2024-01-18 11:00:00', 1200.00, 'completed',  'Skin rash examination'),
(5,  9,  '2024-02-01 09:30:00', 1500.00, 'completed',  'Annual physical'),
(1,  2,  '2024-02-05 10:00:00', 4200.00, 'completed',  'Follow-up ECG review'),
(6,  5,  '2024-02-10 15:00:00', 5500.00, 'completed',  'Hip pain consultation'),
(7,  9,  '2024-02-14 09:00:00', NULL,          'cancelled',  'Fever — rescheduled'),
(8,  3,  '2024-02-20 11:30:00', 3200.00, 'completed',  'Migraine follow-up'),
(9,  1,  '2024-03-01 10:00:00', 6800.00, 'completed',  'Chest pain assessment'),
(10, 11, '2024-03-05 09:00:00', 2000.00, 'completed',  'Newborn checkup'),
(3,  5,  '2024-03-10 14:00:00', 4800.00, 'completed',  'Knee pain — rescheduled visit'),
(11, 9,  '2024-03-15 10:00:00', 1800.00, 'completed',  'Blood pressure review'),
(12, 7,  '2024-03-20 11:00:00', NULL,          'cancelled',  'Acne consultation — no show'),
(2,  4,  '2024-04-01 09:30:00', 7500.00, 'completed',  'Stroke risk screening'),
(13, 1,  '2024-04-05 10:00:00', 3000.00, 'completed',  'Hypertension follow-up'),
(14, 8,  '2024-04-10 14:30:00', 1600.00, 'completed',  'Eczema treatment review'),
(5,  10, '2024-04-15 09:00:00', 1500.00, 'scheduled', 'General wellness check'),
(15, 6,  '2024-05-01 10:00:00', 4500.00, 'completed',  'Shoulder injury assessment'),
(16, 12, '2024-05-10 11:00:00', 2200.00, 'completed',  'Child vaccination');

CREATE TABLE billing (
    billing_id   INT PRIMARY KEY AUTO_INCREMENT,
    patient_id   INT NOT NULL,
    doctor_id    INT NOT NULL,
    billing_date DATE,
    amount       DECIMAL(10,2) NOT NULL,
    payment_status ENUM('paid','pending','overdue') DEFAULT 'pending',
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

INSERT INTO billing (patient_id, doctor_id, billing_date, amount, payment_status) VALUES
(1,  1,  '2024-01-10', 3500.00,  'paid'),
(2,  3,  '2024-01-12', 2800.00,  'paid'),
(4,  7,  '2024-01-18', 1200.00,  'paid'),
(5,  9,  '2024-02-01', 1500.00,  'paid'),
(1,  2,  '2024-02-05', 4200.00,  'paid'),
(6,  5,  '2024-02-10', 5500.00,  'pending'),
(8,  3,  '2024-02-20', 3200.00,  'paid'),
(9,  1,  '2024-03-01', 6800.00,  'paid'),
(10, 11, '2024-03-05', 2000.00,  'paid'),
(3,  5,  '2024-03-10', 4800.00,  'pending'),
(11, 9,  '2024-03-15', 1800.00,  'paid'),
(2,  4,  '2024-04-01', 7500.00,  'paid'),
(13, 1,  '2024-04-05', 3000.00,  'overdue'),
(14, 8,  '2024-04-10', 1600.00,  'paid'),
(15, 6,  '2024-05-01', 4500.00,  'pending'),
(16, 12, '2024-05-10', 2200.00,  'paid');
