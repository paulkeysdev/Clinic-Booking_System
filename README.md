
# Clinic Booking System - Database Management System (DBMS) Overview

## **Introduction**
This project implements a **relational database** using **MySQL** to manage clinic appointments efficiently. The DBMS ensures **data integrity, security, and efficiency**, allowing patients to book appointments with doctors, receive treatments, make payments, and track their medical history. The database is designed to support **structured queries** for retrieving, updating, and managing clinical records.

---

## **Database Schema**
### **Entities & Their Roles**
1. **Patients**:
   - Stores patient details such as name, date of birth, gender, contact information, and email.
   - Ensures each patient is uniquely identified with a **Primary Key (PatientID)**.
   - Enforces constraints like **UNIQUE** for contact details to prevent duplication.

2. **Doctors**:
   - Maintains doctor records including name, specialty, contact information, and email.
   - Each doctor is uniquely identified using **DoctorID (Primary Key)**.
   - Provides a structured way to link appointments to specific doctors.

3. **Appointments**:
   - Acts as a bridge between patients and doctors, managing scheduled consultations.
   - Tracks appointment date, time, and **status** (Scheduled, Completed, Cancelled).
   - Includes **foreign keys** linking **PatientID** and **DoctorID** to ensure relational integrity.

4. **Treatments**:
   - Records treatment descriptions, associated costs, and medical services provided after an appointment.
   - Maintains a **one-to-one relationship** with appointments, ensuring treatments are properly assigned.

5. **Payments**:
   - Captures billing details, including payment method, amount paid, and transaction timestamp.
   - Links payments to corresponding appointments for accurate financial tracking.

---

## **Database Operations**
### **How the DBMS Handles Queries & Transactions**
1. **Data Insertion**:
   - When a patient registers, their details are stored in the **Patients** table with proper constraints.
   - When a doctor is onboarded, they are added to the **Doctors** table.
   - When an appointment is booked, an entry is made in the **Appointments** table referencing both patient and doctor.

2. **Data Retrieval**:
   - Queries such as:
     ```sql
     SELECT * FROM Appointments WHERE Status = 'Scheduled';
     ```
     help retrieve upcoming appointments.
   - Doctors can fetch their appointment schedules by searching for their **DoctorID**.

3. **Data Modification**:
   - Appointments can be updated using:
     ```sql
     UPDATE Appointments SET Status = 'Cancelled' WHERE AppointmentID = X;
     ```
   - This ensures canceled appointments are correctly tracked.

4. **Data Deletion**:
   - Foreign key constraints ensure **cascade deletions**. For example, deleting a patient automatically removes their associated appointments.

## **Conclusion**
This **Clinic Booking System** is designed to provide an efficient and scalable solution for managing healthcare appointments. The **DBMS automates booking, tracking treatments, processing payments**, and maintains a structured **relationship-driven database** to support clinic operations.

