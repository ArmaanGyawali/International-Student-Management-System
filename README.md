# International Student Management System

## 📌 Project Overview
A relational database system designed for a University International Student Office. This project manages teacher-student assignments, emergency contacts, and visa compliance records.

## 🛠️ Tech Stack
- **Database:** MySQL
- **Tool:** PopSQL / Local MySQL Server

## 📂 Database Structure
The system consists of 4 main tables:
1. **Teacher:** Stores faculty advisor details.
2. **Students:** Central hub for student records.
3. **Emergency_Contacts:** Linked to students via `student_id` with `ON DELETE CASCADE`.
4. **Visa_Status:** Manages passport info and visa validity.

## 🚀 Key Features
- **Data Integrity:** Uses Primary and Foreign keys to ensure relationships.
- **Automation:** Implements `ON DELETE CASCADE` for clean data management.
- **Administrative Dashboard:** A complex `INNER JOIN` query that provides a unified view of all student and advisor information.

## 📝 How to Run
1. Copy the SQL code from the main script file.
2. Run the script in a MySQL environment (like PopSQL or MySQL Workbench).
3. The `DROP TABLE IF EXISTS` commands at the top allow the script to be run multiple times without errors.
