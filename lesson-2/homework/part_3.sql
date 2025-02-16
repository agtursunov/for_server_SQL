USE Second_lesson;
GO

DROP TABLE IF EXISTS photos;
GO

CREATE TABLE photos(
	id INT PRIMARY KEY IDENTITY(1001, 1),
	data VARBINARY(MAX)
);
GO

INSERT INTO photos
SELECT BulkColumn from
	OPENROWSET(
	BULK 'D:\course_from_maab\for_server_SQL\lesson-2\homework\kant_kritika_razuma.jpg', SINGLE_BLOB
) AS img;

SELECT * FROM photos