-- Creating the database
CREATE DATABASE ClinicBookingSystem;
USE ClinicBookingSystem;

-- Patients Table
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    ContactNumber VARCHAR(15) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Doctors Table
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID) ON DELETE CASCADE
);

-- Treatments Table
CREATE TABLE Treatments (
    TreatmentID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT NOT NULL,
    TreatmentDescription TEXT NOT NULL,
    Cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID) ON DELETE CASCADE
);

-- Payments Table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT NOT NULL,
    PaymentAmount DECIMAL(10,2) NOT NULL,
    PaymentDate DATETIME NOT NULL,
    PaymentMethod ENUM('Cash', 'Credit Card', 'Insurance') NOT NULL,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID) ON DELETE CASCADE
);

-- Sample Data Insertion
-- Insert Patients
INSERT INTO Patients (Name, DateOfBirth, Gender, ContactNumber, Email) VALUES
('John Doe', '1990-05-15', 'Male', '0712345678', 'johndoe@email.com'),
('Jane Smith', '1985-07-22', 'Female', '0723456789', 'janesmith@email.com'),
('Ali Hassan', '1998-03-10', 'Male', '0734567890', 'alihassan@email.com');

-- Insert Doctors
INSERT INTO Doctors (Name, Specialty, ContactNumber, Email) VALUES
('Dr. Emily Carter', 'Cardiology', '0745678901', 'emilycarter@clinic.com'),
('Dr. Raj Patel', 'Dermatology', '0756789012', 'rajpatel@clinic.com'),
('Dr. Linda Wang', 'Orthopedics', '0767890123', 'lindawang@clinic.com');

-- Insert Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status) VALUES
(1, 1, '2025-05-14 09:30:00', 'Scheduled'),
(2, 2, '2025-05-15 10:00:00', 'Completed'),
(3, 3, '2025-05-16 11:00:00', 'Cancelled');

-- Insert Treatments
INSERT INTO Treatments (AppointmentID, TreatmentDescription, Cost) VALUES
(2, 'Skin biopsy and analysis', 250.00),
(3, 'Physical therapy session', 100.00);

-- Insert Payments
INSERT INTO Payments (AppointmentID, PaymentAmount, PaymentDate, PaymentMethod) VALUES
(2, 250.00, '2025-05-15 11:00:00', 'Credit Card'),
(3, 100.00, '2025-05-16 12:30:00', 'Cash');
