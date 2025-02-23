USE Fifth_lesson;
GO

-- 1. Assign a Unique Rank to Each Employee Based on Salary
SELECT *,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees;
GO

-- 2. Find Employees Who Have the Same Salary Rank
SELECT Department, EmployeeID, [Name], Salary, Salary_rank
FROM (
    SELECT Department, EmployeeID, [Name], Salary,
           DENSE_RANK() OVER (ORDER BY Salary DESC) AS Salary_rank
    FROM Employees
) AS Ranked_Salary
WHERE Salary_rank IN (
SELECT SalaryDenseRank FROM(
	SELECT *,
		DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryDenseRank
	FROM Employees) AS RankTable
	GROUP BY SalaryDenseRank
	HAVING COUNT(*) > 1
);

-- 3. Identify the Top 2 Highest Salaries in Each Department
SELECT Department, Salary FROM (
	SELECT *,
		DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS Salary_rank
	FROM Employees)
AS Ranked_Salary
WHERE Salary_rank <= 2
GO

-- 4. Find the Lowest-Paid Employee in Each Department
SELECT [Name], Department, Salary FROM (
	SELECT *,
		DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary) AS Salary_rank
	FROM Employees)
AS Ranked_Salary
WHERE Salary_rank = 1
GO

-- 5. Calculate the Running Total of Salaries in Each Department
SELECT [Name],
	Department,
	Salary,
	SUM(Salary) OVER(PARTITION BY Department ORDER BY Salary) AS Running_total
FROM Employees;
GO

-- 6. Find the Total Salary of Each Department Without GROUP BY
SELECT Department,
	Salary,
	SUM(Salary) OVER(PARTITION BY Department) AS Total_salary
FROM Employees;
GO

-- 7. Calculate the Average Salary in Each Department Without GROUP BY
SELECT Department,
	Salary,
	AVG(Salary) OVER(PARTITION BY Department) AS Average_salary
FROM Employees;
GO

-- 8. Find the Difference Between an Employee’s Salary and Their Department’s Average
SELECT [Name],
	Department,
	Salary,
	ABS(Salary - AVG(Salary) OVER(PARTITION BY Department)) AS Difference_Salary
FROM Employees;
GO

-- 9. Calculate the Moving Average Salary Over 3 Employees (Including Current, Previous, and Next)
SELECT [Name],
	Department,
	Salary,
	AVG(Salary) OVER(ORDER BY Salary ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS Moving_Average_Salary_Over3Emp
FROM Employees;
GO

-- 10. Find the Sum of Salaries for the Last 3 Hired Employees
SELECT TOP(3) [Name],
	HireDate,
	Salary,
	SUM(Salary) OVER(ORDER BY HireDate DESC) AS Sum_Salaries_Last_3_Hired_Emp
FROM Employees;
GO

-- 11. Calculate the Running Average of Salaries Over All Previous Employees
SELECT [Name],
	HireDate,
	Salary,
	AVG(Salary) OVER(ORDER BY HireDate) AS Running_Average
FROM Employees;
GO

-- 12. Find the Maximum Salary Over a Sliding Window of 2 Employees Before and After
SELECT [Name],
	Salary,
	MAX(Salary) OVER(ORDER BY [Name] ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) AS Maximum_Salary_Over5Emp
FROM Employees;
GO

-- 13. Determine the Percentage Contribution of Each Employee’s Salary to Their Department’s Total Salary
SELECT [Name],
	Department,
	Salary,
	ABS(100 * Salary/(SUM(Salary) OVER(PARTITION BY Department))) AS Percentage_Contribution_EachEmp
FROM Employees;
GO
