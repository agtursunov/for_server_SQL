USE Twelfth_lesson;
GO

/*Write a stored procedure that retrieves all stored procedure and
function names along with their schema names and parameters (if they exist),
including parameter data types and maximum lengths.
The procedure should accept a database name as an optional parameter.
If a database name is provided, it should return the information for that specific database;
otherwise, it should retrieve the information for all databases in the SQL Server instance.*/



ALTER PROCEDURE Sp_and_func_info @db_name_to_query NVARCHAR(100) = null AS
BEGIN
	
	DECLARE @query_task2 NVARCHAR(MAX);
	/* the main query of task 2 to  retrieves all stored procedure and
function names along with their schema names and parameters (if they exist),
including parameter data types and maximum lengths*/
	SET @query_task2 = N'
	SELECT
	s.[name] AS [schema name],
	Obj.[name] AS [stored procedure or function names],
	p.PARAMETER_NAME AS [parameter name],
	p.DATA_TYPE AS [parameter data type],
	p.CHARACTER_MAXIMUM_LENGTH AS [parameter maximum length]
	FROM '+ QUOTENAME(@db_name_to_query)+ N'.sys.objects AS Obj
	LEFT JOIN (
	SELECT
		PARAMETER_NAME,
		DATA_TYPE,
		CHARACTER_MAXIMUM_LENGTH,
		SPECIFIC_NAME
	FROM '+ QUOTENAME(@db_name_to_query)+ N'.INFORMATION_SCHEMA.PARAMETERS) AS p
		ON Obj.[name] = p.SPECIFIC_NAME
	LEFT JOIN (SELECT [name], [schema_id]  FROM '+ QUOTENAME(@db_name_to_query)+ N'.SYS.schemas) AS s
		ON Obj.[schema_id] = s.[schema_id]
	WHERE Obj.type = ''P'' OR Obj.type = ''FN''
	';
	IF @db_name_to_query IS NOT NULL --if @db_name_to_query is not null, then execute @query_task2
	BEGIN
	EXEC sp_executesql @query_task2;
	END
	ELSE
	BEGIN
		-- else execute @query_task2 for all databases in the SQL Server instance.
		DECLARE @number_of_databases INT;
		DECLARE @counter INT = 1;
		SELECT @number_of_databases = COUNT(1) FROM sys.databases;
		DECLARE @name_of_db NVARCHAR(50);
		WHILE @counter <= @number_of_databases
		BEGIN
			;WITH DataBases_CTE AS (
			SELECT
				ROW_NUMBER() OVER(ORDER BY [name]) AS Row_numbers,
				name
			FROM sys.databases WHERE name NOT IN ('master', 'tempdb', 'model', 'msdb')
			)
		SELECT @name_of_db = name FROM DataBases_CTE
		WHERE Row_numbers = @counter
		EXEC sp_executesql @query_task2, N'@db_name_to_query NVARCHAR(100)', @db_name_to_query = @name_of_db; -- sp_executesql for security of dynamic query
		SET @counter = @counter + 1
		END;
	END;
END;
EXEC Sp_and_func_info Twelfth_lesson;


