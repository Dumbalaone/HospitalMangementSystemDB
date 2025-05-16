CREATE DATABASE HospitalDB;
use HospitalDB;

-- Patients Table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT,
    contact VARCHAR(15),
    medical_history TEXT
);

-- Doctors Table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(50),
    availability VARCHAR(50)
);

-- Appointments Table
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Billing Table
CREATE TABLE Billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    total_amount DECIMAL(10,2),
    paid_status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Medical Records Table
CREATE TABLE MedicalRecords (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    diagnosis TEXT,
    prescriptions TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Inventory Table
CREATE TABLE Inventory (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    quantity INT,
    supplier VARCHAR(100)
    );
    -- Insurance table
CREATE TABLE Insurance (
    insurance_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    provider_name VARCHAR(100),
    policy_number VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);


INSERT INTO Insurance (patient_id, provider_name, policy_number)
VALUES (1, 'AAR Insurance', '123456');
INSERT INTO Insurance (patient_id, provider_name, policy_number) VALUES
(2, 'Jubilee Health', 'JUB123456'),
(3, 'Britam Insurance', 'BRI987654'),
(4, 'NHIF Kenya', 'NHIF567890'),
(5, 'APA Insurance', 'APA345678');




INSERT INTO Patients (name, age, contact, medical_history) 
VALUES ('John Doe', 35, '‪+254712345678‬', 'Diabetes, Hypertension');
INSERT INTO Patients (name, age, contact, medical_history) VALUES
('Alice Kimani', 28, '‪+254712345111‬', 'Asthma'),
('Brian Otieno', 40, '‪+254723456222‬', 'High Blood Pressure'),
('Cynthia Mwangi', 33, '‪+254734567333‬', 'Migraine, Anxiety'),
('David Njoroge', 45, '‪+254745678444‬', 'Heart Disease');


INSERT INTO Doctors (name, specialty, availability) 
VALUES ('Dr. Aisha', 'Cardiology', 'Monday-Friday, 9AM-4PM');
INSERT INTO Doctors (name, specialty, availability) VALUES
('Dr. Kamau', 'Neurology', 'Monday-Friday, 10AM-5PM'),
('Dr. Wanjiru', 'Pediatrics', 'Tuesday-Saturday, 8AM-3PM'),
('Dr. Owino', 'Orthopedic Surgery', 'Monday-Friday, 9AM-4PM'),
('Dr. Patel', 'Dermatology', 'Wednesday-Sunday, 10AM-6PM');


INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) 
 VALUES (1, 1, '2025-05-20 10:30:00' ,'scheduled'); 
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2025-05-21 10:30:00', 'Scheduled'),
(2, 3, '2025-05-22 14:00:00', 'Scheduled'),
(3, 5, '2025-05-23 09:30:00', 'Scheduled'),
(4, 2, '2025-05-24 11:00:00', 'Scheduled');

  
INSERT INTO Inventory (name, quantity, supplier) 
VALUES ('Surgical Masks', 500, 'MedSupply Ltd'); 
INSERT INTO Inventory (name, quantity, supplier) VALUES
('Gloves', 300, 'SafeMed Suppliers'),
('Antiseptic Liquid', 150, 'HealthPro Distributors'),
('Syringes', 500, 'MediStock Ltd'),
('Thermometers', 200, 'Precision Medical'),
('Wheelchairs', 50, 'CarePlus Equipment');

--updated schema for users table

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'Doctor', 'Patient', 'Receptionist')
);

-- updated schema for staff
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    role ENUM('Nurse', 'Administrator', 'Lab Technician', 'Receptionist') NOT NULL,
    contact VARCHAR(15) UNIQUE NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hired_date DATE
);
 
 -- assigning nurses to patients
ALTER TABLE Patients ADD COLUMN nurse_id INT;
ALTER TABLE Patients ADD FOREIGN KEY (nurse_id) REFERENCES Staff(staff_id);
 
 
--inserting to staff table
INSERT INTO Staff (name, role, contact, department, salary)
VALUES 
('Alice Njoroge', 'Nurse', '‪+254712345111‬', 'Emergency', 65000.00),
('Brian Otieno', 'Administrator', '‪+254723456222‬', 'Management', 90000.00),
('Cynthia Mwangi', 'Lab Technician', '‪+254734567333‬', 'Diagnosis', 75000.00);

-- Role based user authentication (limited coz of evaluation purposes)  
-- Grant basic privileges to receptionists for managing appointments
-- GRANT SELECT, INSERT, UPDATE ON HospitalDB.Appointments TO 'receptionist'@'localhost';

-- Grant doctors permission to update medical records
-- GRANT SELECT, INSERT, UPDATE ON HospitalDB.MedicalRecords TO 'doctor'@'localhost';

-- Allow admins full control over all tables
-- GRANT ALL PRIVILEGES ON HospitalDB.* TO 'admin'@'localhost';