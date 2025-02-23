USE Fifth_lesson;
GO
-- Assign a Unique Rank to Each Employee Based on Salary
SELECT *,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees;
GO