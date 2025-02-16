USE Second_lesson;
GO

DROP TABLE IF EXISTS worker;
GO

CREATE TABLE worker(
	id INT PRIMARY KEY,
	[name] NVARCHAR(100)
);
GO

BULK INSERT worker
FROM 'D:\course_from_maab\for_server_SQL\lesson-2\homework\workers_info.csv'
WITH (
	firstrow = 2,
	fieldterminator = ';',
	rowterminator='\n'
);
GO
SELECT * FROM worker