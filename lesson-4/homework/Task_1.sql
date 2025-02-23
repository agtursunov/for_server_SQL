USE Fourth_lesson;
GO

DROP TABLE IF EXISTS TestMultipleZero
GO

CREATE TABLE TestMultipleZero
(
    [A_grade] [int] NULL,
    [B_grade] [int] NULL,
    [C_grade] [int] NULL,
    [D_grade] [int] NULL
);
GO

INSERT INTO [dbo].[TestMultipleZero](A_grade,B_grade,C_grade,D_grade)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);

--If all the columns having zero value then don't show that row.
SELECT *
FROM TestMultipleZero
WHERE NOT ([A_grade] = 0 AND [B_grade] = 0 AND [C_grade] = 0 AND [D_grade] = 0)
GO
