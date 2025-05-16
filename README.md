# 🏥 Hospital Management System Database  
### *Built with MySQL*

## 📌 *Overview*
This *Hospital Management System (HMS) Database* is designed to streamline hospital operations by managing *patients, doctors, appointments, billing, inventory, medical records, and **staff* efficiently. It ensures data integrity, optimized queries, and scalability for real-world hospital management.

## ⚙ *Features*
- *Patient Management* – Store patient details, medical history, and insurance information.
- *Doctor & Staff Management* – Maintain doctor specialties, schedules, and hospital staff details.
- *Appointments* – Track and update appointment statuses dynamically.
- *Billing System* – Handle payments, invoices, and insurance claims.
- *Inventory Management* – Monitor hospital supplies and stock levels.
- *Data Optimization* – Indexing for faster queries and partitioning for scalability.
## 🗄 *Database Schema*
| Table Name      | Purpose |
|----------------|---------|
| *Patients*   | Stores patient info, history, and assigned nurses |
| *Doctors*    | Manages doctor details and specialties |
| *Appointments* | Tracks patient-doctor appointments |
| *Billing*    | Handles transactions and payments |
| *Inventory*  | Manages hospital supplies |
| *Insurance*  | Links patients to insurance providers |
| *Staff*      | Stores hospital personnel details |

## 🔄 *Relationships*
- *Appointments → Patients & Doctors* (via Foreign Keys)
- *Patients → Assigned Nurses (Staff Table)*
- *Billing → Patients & Insurance Providers*
- *Inventory → Supplier Tracking*
  
ERD:![HospitalManagenent  MConverter eu](https://github.com/user-attachments/assets/1337b3bf-a0f4-4d0c-a66e-14bd7ab51a2e)
