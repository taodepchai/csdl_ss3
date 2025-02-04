create database bt3;
use bt3;

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(255) NOT NULL,
    age INT CHECK (age >= 0),
    email VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO Students (student_name, email, age) 
	VALUES 
		('Nguyen Van A', 'nguyenvana@example.com', 22), 
		('Le Thi B', 'lethib@example.com', 20), 
		('Tran Van C', 'tranvanc@example.com', 23), 
		('Pham Thi D', 'phamthid@example.com', 21);
        
DELETE FROM Students
    WHERE student_id = 2;