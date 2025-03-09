USE Tenth_lesson;
GO

DROP TABLE IF EXISTS Shipments;
GO

CREATE TABLE Shipments (
    N INT PRIMARY KEY,
    Num INT
);
/*A factory has records of Large Tractor shipments spanning 40 days (see table below).
In some of the 40 days, the factory shipped zero tractors and the zeros we not recorded.*/
INSERT INTO Shipments (N, Num) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1),
(9, 2), (10, 2), (11, 2), (12, 2), (13, 2), (14, 4), (15, 4), 
(16, 4), (17, 4), (18, 4), (19, 4), (20, 4), (21, 4), (22, 4), 
(23, 4), (24, 4), (25, 4), (26, 5), (27, 5), (28, 5), (29, 5), 
(30, 5), (31, 5), (32, 6), (33, 7);

--median number of tractors shipped per day based on the last 40 days
;WITH ShipmentsCTE AS(
	SELECT RowNumber, Num FROM (
SELECT ROW_NUMBER() OVER (ORDER BY (SELECT Num)) AS RowNumber,
Num
FROM(
SELECT 0 AS Num FROM STRING_SPLIT(REPLICATE(',a', (SELECT MAX(Num) FROM Shipments) - 1), ',')
UNION ALL
SELECT Num FROM Shipments) AS Full_table
) t
)

SELECT AVG(Num) AS Median_shipment_per_day FROM ShipmentsCTE
WHERE RowNumber = 20 OR RowNumber = 21 -- There is 40 numbers, so I use 20th and 21st element