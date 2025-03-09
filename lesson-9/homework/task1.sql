USE Nineth_lesson;
GO

DROP TABLE IF EXISTS Employees;
GO

CREATE TABLE Employees
(
	EmployeeID  INTEGER PRIMARY KEY,
	ManagerID   INTEGER NULL,
	JobTitle    VARCHAR(100) NOT NULL
);
INSERT INTO Employees (EmployeeID, ManagerID, JobTitle) 
VALUES
	(1001, NULL, 'President'),
	(2002, 1001, 'Director'),
	(3003, 1001, 'Office Manager'),
	(4004, 2002, 'Engineer'),
	(5005, 2002, 'Engineer'),
	(6006, 2002, 'Engineer');
-- find the level of depth each employee from the President.
;WITH EmpCTE(EmpId, MngId, J_title, Depth) AS
(
	SELECT 
	EmployeeID,
	ManagerID,
	JobTitle,
	0
	FROM Employees
	WHERE ManagerID IS NULL
	UNION ALL
	SELECT 
	EmployeeID,
	ManagerID,
	JobTitle,
	Depth + 1 AS Depth
	FROM Employees
	INNER JOIN EmpCTE
		ON EmpCTE.EmpId =  Employees.ManagerID
)
SELECT * FROM EmpCTE