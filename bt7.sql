CREATE DATABASE bt7;
USE bt7;

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    gpa DECIMAL(3, 2) CHECK (gpa >= 0 AND gpa <= 4)
);

INSERT INTO Students (name, email, date_of_birth, gender, gpa)
	VALUES
		('Nguyen Van A', 'nguyenvana@example.com', '2000-05-15', 'Male', 3.50),
		('Tran Thi B', 'tranthib@example.com', '1999-08-22', 'Female', 3.80),
		('Le Van C', 'levanc@example.com', '2001-01-10', 'Male', 2.70),
		('Pham Thi D', 'phamthid@example.com', '1998-12-05', 'Female', 3.00),
		('Hoang Van E', 'test@exaample.com', '2000-03-18', 'Male', 3.60),
		('Do Thi F', 'dothif@example.com', '2001-07-25', 'Female', 4.00),
		('Vo Van G', 'vovang@example.com', '2000-11-30', 'Male', 3.20),
		('Nguyen Thi H', 'nguyenthih@example.com', '2000-05-15', 'Female', 2.90),
		('Bui Van I', 'test@example.com', '2002-02-28', 'Male', 3.40),
        ('Bui Van I', 'buivani@examplaae.com', '2002-02-28', 'Male', 2.40),
        ('Bui Van I', 'buivani@ddexample.com', '2002-02-28', 'Male', 1.40),
		('Tran Thi J', 'tranthij@example.com', '2001-06-12', 'Female', 3.75);

SELECT *FROM Students
	WHERE gpa > 3.0 AND gender = 'Female';
    
SELECT *FROM Students
	WHERE date_of_birth > '2000-01-01'
	ORDER BY GPA DESC
	LIMIT 1;
    
SELECT *FROM Students
	WHERE date_of_birth = (SELECT date_of_birth FROM Students WHERE student_id = 1);

UPDATE Students
	SET gpa = gpa + 0.5
    WHERE gpa < 2.5;

UPDATE Students
	SET gender = 'Other'
    WHERE email LIKE '%test%';
    
DELETE FROM Students 
WHERE date_of_birth = (
    SELECT min_date
    FROM (
        SELECT MIN(date_of_birth) AS min_date
        FROM Students
    ) AS Temp
);

SELECT name, YEAR(CURDATE()) - YEAR(date_of_birth) AS age
FROM Students;

