-- University international students office
-- creating tables to store info of teachers,
CREATE TABLE teacher(
    teacher_id INT PRIMARY KEY ,
    name VARCHAR(20) NOT NULL, 
    Faculty VARCHAR (20),
    phone_no VARCHAR(20) UNIQUE, 
    email VARCHAR(50),
    salary DECIMAL (12,3)
);
select * from teacher;  

--  inserting data in teacher table 
INSERT INTO teacher VALUES(52354, 'DR.SHYAM', 'Physics','984764213','shyam@gmail.com',60000);
INSERT INTO teacher VALUES(52333, 'Prof.Hari','Chemistry','989745637', 'hari@gmail.com',65000.50);
INSERT INTO teacher(teacher_id,name,Faculty,phone_no,salary) VALUES(52378,'Dr.Prof.Sita','English','983749304',80000.500);



-- creating table student
CREATE TABLE students(
    student_id INT AUTO_INCREMENT ,
    name VARCHAR(20) DEFAULT 'attendee', 
    date_of_birth DATE,
    grade INT,
    address VARCHAR(50),
    class_teacher INT,
    PRIMARY KEY(student_id), 
    FOREIGN KEY (class_teacher) REFERENCES teacher(teacher_id)
);
select * from students;
--  inserting data in student table 
INSERT INTO students VALUES(1, 'Armaan', '2003-09-16' ,10, 'Nepal Butwal', 52378);
INSERT INTO students( date_of_birth, grade, address,class_teacher ) VALUES('2003-09-16' ,10, 'Lumbini', 52333);
INSERT INTO students(name, date_of_birth, grade, address,class_teacher) VALUES ('Ayusha', '2004-02-26', 9,'pokhara',52354);


-- creating table emergency_contacts
CREATE TABLE emergency_contacts(
    contact_ID INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    contact_name VARCHAR(20),
    relationship VARCHAR(20),
    phone_no VARCHAR(20) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE 
);
select * from emergency_contacts;
-- inserting values in emergency_contact table 
INSERT INTO emergency_contacts(contact_id,student_id,contact_name,relationship,phone_no) VALUES (100,3,'Ayush Subedi','Brother','9877657657');
INSERT INTO emergency_contacts(student_id,contact_name,relationship,phone_no) VALUES (1,'Tek Raj Gyawali','Father', '986644778');
INSERT INTO emergency_contacts(student_id,contact_name,relationship,phone_no) VALUES (2,'Rita Sharma', 'Mother', '97646392');



-- creating table visa_status
CREATE TABLE visa_status(
    visa_id INT PRIMARY KEY,
    student_id INT,
    passport_no VARCHAR(30) NOT NULL UNIQUE,
    visa_status VARCHAR(20), 
    issued_date DATE,
    valid_until DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id) 
);
select * from visa_status;
#inserting values inside table visa_status
INSERT INTO visa_status(visa_id,student_id,passport_no,visa_status,issued_date,valid_until) VALUES (1001,3,'Pa12345','Student', '2024-05-25','2027-09-25');
INSERT INTO visa_status(visa_id,student_id,passport_no,visa_status,issued_date,valid_until) VALUES (1011,2,'Pa13579','Worker', '2022-09-29','2027-12-29');
INSERT INTO visa_status(visa_id,student_id,passport_no,visa_status,issued_date,valid_until) VALUES (1111,3,'Pa54321','Unknown', '2026-03-20','2026-11-30');

-- using update feature to update teachers salary , updating the address, and setting the value where it was empty
UPDATE teacher SET salary = salary + 999 WHERE teacher_id = 52354;
UPDATE teacher SET salary = salary * 2.25 WHERE Faculty = 'Physics';
UPDATE students SET grade = 11, address = 'Kathmandu, Nepal' WHERE name = 'Armaan';
UPDATE teacher SET email = 'sita@gmail.com' WHERE email is NULL;
#it calculates the everage salary if teachers 
SELECT AVG(salary) AS "Average_Salary" FROM teacher;

-- I HAVE USED A JOIN METHOD CALLED INNER JOIN 
-- joining the tables 
-- i have joined all 4 tables so it can be used as final dashboard like officer working sees student ,there advisor ,there passport in one place .
SELECT students.name, teacher.name,visa_status.passport_no,emergency_contacts.phone_no
from students
JOIN teacher ON students.class_teacher = teacher.teacher_id
JOIN emergency_contacts ON students.student_id = emergency_contacts.student_id
JOIN visa_status ON students.student_id = visa_status.student_id;


