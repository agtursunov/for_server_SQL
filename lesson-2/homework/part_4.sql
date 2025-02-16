USE Second_lesson;
GO

DROP TABLE IF EXISTS student;
go

CREATE TABLE student(
	student_id INT PRIMARY KEY IDENTITY,
	student_name NVARCHAR(100),
	classes SMALLINT,
	tuition_per_class DECIMAL(10, 2),
	total_tuition as (classes * tuition_per_class)
);
GO

INSERT INTO student(student_name, classes, tuition_per_class)
VALUES
	('John', 5, 750.25),
	('Doe', 3, 6000),
	('Adam', 28, 1550.274);
GO

SELECT * FROM student;
GO