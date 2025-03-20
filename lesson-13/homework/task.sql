USE Thirteenth_lesson;
GO
/*You will create an SQL Server query that generates a tabular representation of a given month,
displaying the days of each week in separate columns,
with Sunday as the first column and Saturday as the last column.*/
SET DATEFIRST 7;
-- Get current date and the first and last day of the month
DECLARE @date1 DATE = GETDATE();
DECLARE @first_day_of_month DATE = DATEADD(DAY, 1, EOMONTH(@date1, -1));
DECLARE @last_day_of_month DATE = EOMONTH(@date1);
DECLARE @number_of_days INT = DAY(@last_day_of_month);
-- Create a table to store day, weekday, and week number
DECLARE @month_days TABLE(
    [Day] INT,
    [WeekDay] INT,
    [WeekDayNumber] INT
);

DECLARE @counter INT = 1;
DECLARE @weekDayNumber INT = 1;

WHILE @counter <= @number_of_days
BEGIN
-- Insert day, weekday, and week number into the table
    INSERT INTO @month_days([Day], [WeekDay], [WeekDayNumber])
    SELECT @counter AS [Day],
           DATEPART(WEEKDAY, DATEADD(DAY, @counter - 1, @first_day_of_month)) AS [WeekDay],
           @weekDayNumber;
    -- Check if a new week starts
    IF DATEPART(WEEKDAY, DATEADD(DAY, @counter - 1, @first_day_of_month)) > DATEPART(WEEKDAY, DATEADD(DAY, @counter, @first_day_of_month))
    BEGIN
        SET @weekDayNumber = @weekDayNumber + 1;
    END;
    
    SET @counter = @counter + 1;
END;
-- Show the days of the week (Sunday to Saturday) for each week
SELECT
    MAX(CASE WHEN WeekDay = 1 THEN [Day] END) AS 'Sunday',
    MAX(CASE WHEN WeekDay = 2 THEN [Day] END) AS 'Monday',
    MAX(CASE WHEN WeekDay = 3 THEN [Day] END) AS 'Tuesday',
    MAX(CASE WHEN WeekDay = 4 THEN [Day] END) AS 'Wednesday',
    MAX(CASE WHEN WeekDay = 5 THEN [Day] END) AS 'Thursday',
    MAX(CASE WHEN WeekDay = 6 THEN [Day] END) AS 'Friday',
    MAX(CASE WHEN WeekDay = 7 THEN [Day] END) AS 'Saturday'
FROM @month_days
GROUP BY WeekDayNumber
ORDER BY WeekDayNumber;
GO
