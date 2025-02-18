USE Third_lesson;
GO

SELECT * FROM Employees;
GO
/*Selects the top 10% highest-paid employees.*/
SELECT TOP 10 PERCENT
*
FROM Employees
ORDER BY Salary DESC;
GO
/*Groups them by department and calculates the average salary per department.*/
SELECT Department, 
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department;
GO
/*Displays a new column SalaryCategory:
'High' if Salary > 80,000
'Medium' if Salary is between 50,000 and 80,000
'Low' otherwise.*/
SELECT *,
	CASE
		WHEN Salary > 80000 THEN 'High'
		WHEN Salary BETWEEN 50000 AND 80000 THEN 'Medium'
		WHEN Salary < 50000 THEN 'Low'
	END AS SalaryCategory
FROM Employees;
GO
/*Orders the result by Salary descending.
Skips the first 2 records and fetches the next 5.*/
SELECT *
FROM Employees
ORDER BY Salary DESC
OFFSET 2 ROWS
FETCH NEXT 5 ROWS ONLY;
GO