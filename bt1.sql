create database bt1;
use bt1;

CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(255) NOT NULL,
    age INT CHECK (age >= 18) NOT NULL,
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')) NOT NULL,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

INSERT INTO Student ( student_name, age, gender, registration_date)
	VALUES
		('Nguyễn Văn A', 20, 'Male', '2025-01-15 08:30:00'),
		('Trần Thị B', 22, 'Female', '2025-01-14 09:00:00'),
		('Lê Minh C', 19, 'Male', '2025-01-13 10:15:00'),
        ('Phan Thị D', 21, 'Female', '2025-01-13 10:15:00'),
        ('Hoàng Văn E', 23, 'Other', '2025-01-13 10:15:00');
        