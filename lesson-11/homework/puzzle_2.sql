USE Eleven_lesson;
GO

DECLARE @MissingOrders TABLE (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

INSERT INTO @MissingOrders
SELECT 
	Orders_DB1.OrderID,
    Orders_DB1.CustomerName,
    Orders_DB1.Product,
    Orders_DB1.Quantity
FROM Orders_DB1
LEFT OUTER JOIN Orders_DB2 -- Insert all orders that exist in Orders_DB1 but not in Orders_DB2 into @MissingOrders.
	ON Orders_DB1.OrderID = Orders_DB2.OrderID
WHERE Orders_DB2.OrderID IS NULL

SELECT * FROM @MissingOrders