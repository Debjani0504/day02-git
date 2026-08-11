USE healthcare_db;
SELECT database();
SHOW TABLES;
CREATE table string_praactice (
patient_name VARCHAR(50),
state_code CHAR(2),
clinical_note TEXT
);
RENAME TABLE string_praactice to string_practice;
DESCRIBE string_practice;
INSERT INTO string_practice
(patient_name, state_code, clinical_note)
VALUE( 'Priya','WB','Patient reported mild headache.'), ('Moni','IN', 'patient came for a routine chek-up');
SELECT * FROM string_practice;
INSERT INTO string_practice
(patient_name, state_code, clinical_note)
VALUE('ThisIsAVeryLongPatientNameThatExceedsFiftyCharacters',
    'WB',
    'Testing the VARCHAR length limit.'
);
INSERT INTO string_practice
(patient_name, state_code, clinical_note)
VALUE( 'Anu', 'WBX', 'Testing the CHAR learning');
INSERT INTO string_practice
(patient_name, state_code, clinical_note)
VALUES
(
    'Priya',
    'KA',
    'Patient reported persistent abdominal discomfort for several days and was advised to undergo further examination and follow-up consultation with the physician.'
);
SHOW CREATE TABLE string_practice;
SELECT * FROM string_practice;
SELECT * FROM string_practice WHERE patient_name= 'moni';
SHOW FULL COLUMNS FROM string_practice;