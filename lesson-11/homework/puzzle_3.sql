USE Eleven_lesson;
GO

SELECT * FROM WorkLog
GO
/*Create a view vw_MonthlyWorkSummary that calculates:
EmployeeID, EmployeeName, Department, TotalHoursWorked (SUM of hours per employee).
Department, TotalHoursDepartment (SUM of all hours per department).
Department, AvgHoursDepartment (AVG hours worked per department).*/
CREATE VIEW vw_MonthlyWorkSummary AS
SELECT t1.EmployeeID, t1.EmployeeName, t1.Department, t1.TotalHoursWorked, 
       t2.TotalHoursDepartment, t2.AvgHoursDepartment
FROM (
    SELECT
        EmployeeID, 
        EmployeeName, 
        Department, 
        SUM(HoursWorked) AS TotalHoursWorked
    FROM WorkLog
    GROUP BY EmployeeID, EmployeeName, Department
) t1
INNER JOIN (
    SELECT 
        Department,
        SUM(HoursWorked) AS TotalHoursDepartment,
        AVG(HoursWorked) AS AvgHoursDepartment
    FROM WorkLog
    GROUP BY Department
) t2
ON t1.Department = t2.Department;
GO

SELECT * FROM vw_MonthlyWorkSummary