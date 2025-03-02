USE Sixth_lesson;
GO

-- 1. Write a query to get a list of employees along with their department names.

SELECT e.EmployeeID,
	e.[Name],
	e.Salary,
	d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
	ON e.DepartmentID = d.DepartmentID

-- 2. Write a query to list all employees, including those who are not assigned to any department.

SELECT e.EmployeeID,
	e.[Name],
	e.Salary,
	d.DepartmentName
FROM Employees AS e
LEFT OUTER JOIN Departments AS d
	ON e.DepartmentID = d.DepartmentID

-- 3. Write a query to list all departments, including those without employees.

SELECT e.EmployeeID,
	e.[Name],
	e.Salary,
	d.DepartmentName
FROM Employees AS e
RIGHT OUTER JOIN Departments AS d
	ON e.DepartmentID = d.DepartmentID

-- 4. Write a query to retrieve all employees and all departments, even if there’s no match between them.

SELECT e.EmployeeID,
	e.[Name],
	e.Salary,
	d.DepartmentName
FROM Employees AS e
FULL OUTER JOIN Departments AS d
	ON e.DepartmentID = d.DepartmentID

-- 5. Write a query to find the total salary expense for each department.

SELECT d.DepartmentName,
	SUM(Salary)
FROM Employees AS e
INNER JOIN Departments AS d
	ON e.DepartmentID = d.DepartmentID
GROUP BY DepartmentName

-- 6. Write a query to generate all possible combinations of departments and projects.

SELECT
	p.ProjectName,
	d.DepartmentName
FROM Departments AS d
CROSS JOIN Projects AS p
/* 7. Write a query to get a list of employees with their
department names and assigned project names. Include employees even if they don’t have a project.*/
SELECT
	e.EmployeeID,
    e.Name,
    d.DepartmentName,
    p.ProjectName
FROM Employees AS e
LEFT OUTER JOIN Departments AS d
	ON e.DepartmentID = d.DepartmentID
LEFT OUTER JOIN Projects AS p
	ON e.EmployeeID = p.EmployeeID;

