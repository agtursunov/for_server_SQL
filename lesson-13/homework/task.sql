USE Thirteenth_lesson;
GO

DECLARE @date1 DATE = GETDATE();
DECLARE @first_day_of_month DATE;
DECLARE @last_day_of_month DATE;
DECLARE @number_of_days INT;
SELECT @first_day_of_month = DATEADD(DAY, 1, EOMONTH(EOMONTH(@date1), -1))
SELECT @last_day_of_month = EOMONTH(@date1)
SELECT @number_of_days = DATEDIFF(DAY, DATEADD(DAY, 1, EOMONTH(EOMONTH(@date1), -1)), EOMONTH(@date1)) + 1


DECLARE @month_days TABLE(
	[Day] INT,
	[WeekDay] INT,
	[WeekDaayNumber] INT
);

DECLARE @counter INT = 1;
DECLARE @weekDayNumber INT = 1
WHILE @counter <= @number_of_days
	
BEGIN
	INSERT INTO @month_days([Day], [WeekDay], [WeekDaayNumber])
	SELECT @counter,
	DATEPART(WEEKDAY, DATEADD(DAY, @counter - 1, @first_day_of_month)),
	@weekDayNumber;
	IF DATEPART(WEEKDAY, DATEADD(DAY, @counter - 1, @first_day_of_month)) > DATEPART(WEEKDAY, DATEADD(DAY, @counter, @first_day_of_month))
	BEGIN
		SET @weekDayNumber = @weekDayNumber + 1
	END;
	SET @counter = @counter + 1
END;

SELECT
	MAX(CASE WHEN WeekDay = 1 THEN [Day] END) AS 'Sunday',
	MAX(CASE WHEN WeekDay = 2 THEN [Day] END) AS 'Monday',
	MAX(CASE WHEN WeekDay = 3 THEN [Day] END) AS 'Tuesday',
	MAX(CASE WHEN WeekDay = 4 THEN [Day] END) AS 'Wednesday',
	MAX(CASE WHEN WeekDay = 5 THEN [Day] END) AS 'Thursday',
	MAX(CASE WHEN WeekDay = 6 THEN [Day] END) AS 'Friday',
	MAX(CASE WHEN WeekDay = 7 THEN [Day] END) AS 'Saturday'
FROM @month_days
GROUP BY WeekDaayNumber
ORDER BY WeekDaayNumber
GO

