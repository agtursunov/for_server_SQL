CREATE DATABASE Second_lesson;
GO

DROP TABLE IF EXISTS test_identity;
GO

CREATE TABLE test_identity(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	[name] NVARCHAR(50),
	info NVARCHAR(50)
);
GO

INSERT INTO test_identity([name], info)
VALUES
	('John', 'superman'),
	('Doe', 'second_avenger'),
	('Adam', 'the husband of Eva'),
	('Thor', 'from Asgard'),
	('Antuan Griezmann', 'in ATLETICO');
 GO

 SELECT * from test_identity;
 GO

 DELETE FROM test_identity WHERE [name] =  'Doe'; /* I CAN add a condition*/
 GO

 DELETE FROM test_identity; /*AFTER that indexes will begin with 6, if I insert new row*/
 GO

 INSERT INTO test_identity([name], info)
VALUES
	('ATLETICO', 'DE MADRID');
 GO

 TRUNCATE TABLE test_identity; /*I can't write a condition, and after that indexes begin with 1*/
 GO

 INSERT INTO test_identity([name], info)
VALUES
	('test', 'info');
 GO

 DROP TABLE test_identity; /*DELETE TABLE, NOT ONLY CONTENTS*/
 GO