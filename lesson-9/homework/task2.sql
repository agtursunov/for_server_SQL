USE Nineth_lesson;
GO

--Find Factorials up to N = 10

;WITH Factorial_table(n, fact_n) AS (
	SELECT 1, 1
	UNION ALL
	SELECT n + 1 AS n,
	(n + 1)* fact_n AS fact_n
	FROM Factorial_table
	WHERE n < 10
)
SELECT * FROM Factorial_table
OPTION (MAXRECURSION 9);