USE Second_lesson;
GO

DROP TABLE IF EXISTS data_types_demo;
GO

CREATE TABLE data_types_demo(
	id INT PRIMARY KEY IDENTITY(1000, 1),
	[name] NVARCHAR(50),
	selected_date DATE,
	number_of_attemps SMALLINT,
	amount DECIMAL(10, 2),
	running_date_time DATETIME
);
GO

INSERT INTO data_types_demo([name], selected_date, number_of_attemps, amount, running_date_time)
VALUES
	('John', '2020-01-16', 5, 465.88, GETDATE()),
	('Adam', '2024-11-13', 2, 84685.05, GETDATE());
Go

SELECT * FROM data_types_demo;
GO