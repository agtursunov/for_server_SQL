IF OBJECT_ID('department') IS NULL
BEGIN
	CREATE TABLE department(
		ID INT NOT NULL,
		DepartmentName NVARCHAR(255) NOT NULL,
		Description NVARCHAR(MAX) NULL
	);
END
INSERT INTO department(ID, DepartmentName, Description)
VALUES
	(1, 'Marketing', 'Good'),
	(2, 'Employee', 'Job');
--DROP TABLE if Exists department
--CREATE TABLE blogs (
--	id INT,
--	title NVARCHAR,
--	blog_text NVARCHAR(MAX)
--);
SELECT * FROM department