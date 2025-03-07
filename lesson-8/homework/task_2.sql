USE Eighth_lesson;
GO

--SELECT * FROM EMPLOYEES_N;
--GO

--SELECT STRING_AGG(Year_in_strings, ',') AS Years
--FROM (SELECT DISTINCT CAST(YEAR(HIRE_DATE) AS NVARCHAR) AS Year_in_strings FROM EMPLOYEES_N) AS EMPLOYEES_N;

--1972,1974,1975,1976,1977,1979,1980,1982,1983,1984,1985,1990,1997
SELECT *
	FROM (SELECT 
		--HireYear,
		--NextYear,
		--IntervalYear,
		CASE 
			WHEN IntervalYear < 2 OR HireYear < 1975 THEN NULL
			WHEN IntervalYear >= 2 AND NextYear IS NOT NULL THEN CONCAT(CAST(HireYear + 1 AS NVARCHAR), ' - ', CAST(NextYear - 1 AS NVARCHAR))
			WHEN NextYear IS NULL THEN CONCAT(CAST(HireYear + 1 AS NVARCHAR), ' - ', YEAR(GETDATE()))
		END AS Years
	FROM (SELECT 
		CAST(YEAR(HIRE_DATE) AS INT) AS HireYear,
		LEAD(CAST(YEAR(HIRE_DATE) AS INT)) OVER(ORDER BY HIRE_DATE) AS NextYear,
		LEAD(CAST(YEAR(HIRE_DATE) AS INT)) OVER(ORDER BY HIRE_DATE) - CAST(YEAR(HIRE_DATE) AS INT) AS IntervalYear
	FROM EMPLOYEES_N) AS t) AS t2

--WHERE (CASE 
--		WHEN IntervalYear < 2 OR HireYear < 1975 THEN NULL
--		WHEN IntervalYear >= 2 AND NextYear IS NOT NULL THEN CONCAT(CAST(HireYear + 1 AS NVARCHAR), ' - ', CAST(NextYear - 1 AS NVARCHAR))
--		WHEN NextYear IS NULL THEN CONCAT(CAST(HireYear + 1 AS NVARCHAR), ' - ', YEAR(GETDATE()))
--	END)
WHERE Years IS NOT NULL
--ORDER BY HireYear


--SELECT *
--FROM Years
--WHERE YearColumn NOT IN ('1972', '1974', '1975', '1976', '1977', '1979', '1982', '1983', '1984',
--'1985', '1990','1997')
--CAST(YEAR(HIRE_DATE) AS VARCHAR)
--SELECT STRING_AGG('ONE','ONE','ONE','ONE','ONE','ONE','ONE','ONE', ',')

--SELECT DISTINCT YEAR(HIRE_DATE)
--FROM EMPLOYEES_N;
--GO
