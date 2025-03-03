USE Eighth_lesson;
GO

SELECT 
    MIN(StepNumber) AS [Min Step Number],
    MAX(StepNumber) AS [Max Step Number],
    [Status],
    COUNT(*) AS [Consecutive Count]
FROM (
    SELECT 
        *,
		--ROW_NUMBER() OVER (PARTITION BY [Status] ORDER BY StepNumber) AS 'Necessary column',
        StepNumber - ROW_NUMBER() OVER (PARTITION BY [Status] ORDER BY StepNumber) AS ColumnForGrouping
    FROM Groupings
) AS t
GROUP BY ColumnForGrouping, [Status]
ORDER BY [Min Step Number];
GO
