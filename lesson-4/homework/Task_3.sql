USE Fourth_lesson;
GO

DROP TABLE IF EXISTS EmpBirth;
GO

CREATE TABLE EmpBirth
(
    EmpId INT  IDENTITY(1,1) 
    ,EmpName VARCHAR(50) 
    ,BirthDate DATE 
);
 
INSERT INTO EmpBirth(EmpName, BirthDate)
VALUES
    ('Pawan', '1983-12-04'),
    ('Zuzu', '1986-11-28'),
    ('Parveen', '1977-05-07'),
    ('Mahesh', '1983-01-13'),
    ('Ramesh', '1983-05-09');
/*
 Another insert format
INSERT INTO EmpBirth(EmpName,BirthDate)
	SELECT 'Pawan' , '12/04/1983'
	UNION ALL
	SELECT 'Zuzu' , '11/28/1986'
	UNION ALL
	SELECT 'Parveen', '05/07/1977'
	UNION ALL
	SELECT 'Mahesh', '01/13/1983'
	UNION ALL
	SELECT'Ramesh', '05/09/1983';*/


-- Write a query which will find the Date of Birth of employees whose birthdays lies between May 7 and May 15.
SELECT * 
FROM EmpBirth
WHERE MONTH(BirthDate) = 05 AND DAY(BirthDate) BETWEEN 7 AND 15;
	