USE Third_lesson;
GO

SELECT * FROM Employees;
GO

SELECT TOP 10 PERCENT
*
FROM Employees
ORDER BY Salary DESC;
GO

SELECT Department, 
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department;

SELECT *, 
	'High' AS SalaryCategory
FROM Employees
Where Salary > 80000
	UNION ALL
SELECT *,
	'Medium' AS SalaryCategory
FROM Employees
WHERE 50000 <= Salary AND Salary <= 80000
	UNION ALL
SELECT *,
	'Low' AS SalaryCategory
FROM Employees
WHERE Salary < 50000
