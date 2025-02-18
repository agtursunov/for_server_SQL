USE Third_lesson;
GO

/*Selects the top 10% highest-paid employees.*/
SELECT TOP 10 PERCENT
*
FROM Employees
ORDER BY Salary DESC;
GO
/*Groups them by department and calculates the average salary per department.
Displays a new column SalaryCategory:
'High' if Salary > 80,000
'Medium' if Salary is between 50,000 and 80,000
'Low' otherwise.
Orders the result by AverageSalary descending.
Skips the first 2 records and fetches the next 5.*/
SELECT Department,
	AVG(Salary) AS AverageSalary,
	CASE
		WHEN AVG(Salary) > 80000 THEN 'High'
		WHEN AVG(Salary) BETWEEN 50000 AND 80000 THEN 'Medium'
		WHEN AVG(Salary) < 50000 THEN 'Low'
	END AS SalaryCategory
FROM Employees
GROUP BY Department
ORDER BY AverageSalary DESC
OFFSET 2 ROWS
FETCH NEXT 5 ROWS ONLY;
GO
