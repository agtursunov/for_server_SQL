USE Eleven_lesson;
GO
-- Puzzle 1: The Shifting Employees
DROP TABLE IF EXISTS #EmployeeTransfers;
GO
CREATE TABLE #EmployeeTransfers  (
    EmployeeID INT PRIMARY KEY,
    [Name] VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
)

INSERT INTO #EmployeeTransfers(EmployeeID, [Name], Department, Salary)
SELECT
	EmployeeID,
	[Name],
	/*Swap departments for each employee in a circular manner:
HR → IT → Sales → HR*/
	CASE
		WHEN Department = 'HR' THEN 'IT'
		WHEN Department = 'IT' THEN 'Sales'
		WHEN Department = 'Sales' THEN 'HR'
	END AS Department,
	Salary
FROM Employees
GO

SELECT * FROM #EmployeeTransfers
GO




