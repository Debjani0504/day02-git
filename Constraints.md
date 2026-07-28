# Healthcare Database Capstone
## Project Overview
A hospital database designed using relational database concepts.

## Tables
-Patient
-Doctor
-Appointment
-Treatment
-Bill

## Relationships
-Department---> Doctors (1:M)
-Patient------> Appointment(1;M)
-Doctor------> Appointment(1;M)
-Appointment---> Treatment(1;1)
-Treatment----> Bill (1;1)

## Normalization
The databse is dessigned is Third Normal Form (3NF) to reduce redundancy.

## Constraints
Primary keys, foreign keys, NOT NULL, UNIQUE,and CHECK Constraints are used to maintain data intregrity.
## Patients
-Patient_ID---> Primary Key
-First_Name---> NOT NULL
-LAst_Name---> NOT NULL
-DOB---> NOT NULL CHECK(date<=current date)
-Gender--->NOT NULL
-Phone---> UNIQUE, NOT NULL
-Address---> NOT NULL

## Department
-Department_ID---> Primary key
-Department_Name--->NOT NULL, UNIQUE

## Doctor
-Doctor_ID---> Primary key
-Doctor_Name---> NOT NULL
-Speciality---> NOT NULL
-Phone----> UNIQUE
-Email----> UNIQUE
-Department_ID----> Foreign key, NOT NULL

## Indexes
Indexes are planned on frequently searched columns such as phone numbers, email addresses, and appointment dates.