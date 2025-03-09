USE Nineth_lesson;
GO
-- Find Fibonacci numbers up to N = 10.

;WITH Fibonacci_numbers(n, Fibonacci_Number, prev_fib_number) AS (
	SELECT 1, 1, 0
	UNION ALL
	SELECT n + 1 AS n, Fibonacci_Number + prev_fib_number AS Fibonacci_Number, Fibonacci_Number AS prev_fib_number
	FROM Fibonacci_numbers
	WHERE n < 10
)
SELECT n, Fibonacci_Number FROM Fibonacci_numbers
OPTION (MAXRECURSION 9);