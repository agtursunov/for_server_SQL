USE Twelfth_lesson;
GO
/*Write an SQL query to retrieve the database name, schema name, table name, column name,
and column data type for all tables across all databases in a SQL Server instance.
Ensure that system databases (master, tempdb, model, msdb) are excluded from the results.*/

-- Below I wrote procedure to retrive main info from databases
ALTER PROCEDURE Column_info @database_name NVARCHAR(50)
AS
BEGIN
	DECLARE @first_task_query NVARCHAR(MAX);
	SET @first_task_query = 'SELECT 
							TABLE_CATALOG AS ''database name'',
							TABLE_SCHEMA AS ''schema name'',
							TABLE_NAME AS ''table name'',
							COLUMN_NAME AS ''column name'',
							DATA_TYPE AS ''column data type''
							FROM ';
	SET @first_task_query = CONCAT(@first_task_query, @database_name,'.INFORMATION_SCHEMA.COLUMNS');
	EXEC(@first_task_query);
END;
GO
-- I have declared variables to use them in while loop
DECLARE @counter INT = 1;
DECLARE @db_name NVARCHAR(50);
DECLARE @row_numbers INT;
SELECT @row_numbers = COUNT(1)
FROM sys.databases WHERE name NOT IN ('master', 'tempdb', 'model', 'msdb');
-- EXECUTE PROCEDURE Column_info with appropriate column names as dynamic query
WHILE @counter <= @row_numbers
BEGIN
	;WITH DataBases_CTE AS (
		SELECT
			ROW_NUMBER() OVER(ORDER BY [name]) AS Row_numbers,
			name
		FROM sys.databases WHERE name NOT IN ('master', 'tempdb', 'model', 'msdb')
	)
	SELECT @db_name = name FROM DataBases_CTE
	WHERE Row_numbers = @counter
	EXECUTE Column_info @db_name;
	SET @counter = @counter + 1
END;
GO