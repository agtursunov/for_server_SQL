USE Seventh_lesson;
GO

-- 1. Use an appropriate JOIN to list all customers, their order IDs, and order dates.

SELECT
	c.CustomerName,
	o.OrderID,
	o.OrderDate
FROM Customers AS c
LEFT OUTER JOIN Orders AS o
	ON c.CustomerID = o.CustomerID;
GO

-- 2. Return customers who have no orders

SELECT
	c.CustomerName,
	o.OrderID,
	o.OrderDate
FROM Customers AS c
LEFT OUTER JOIN Orders AS o
	ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;
GO

-- 3. Show each order with its product names and quantity.

SELECT 
	o.OrderID,
	o.Quantity,
	p.ProductName
FROM OrderDetails AS o
LEFT JOIN Products AS p
	ON o.ProductID = p.ProductID;
GO

-- 4. List customers who have placed more than one order.

SELECT
	c.CustomerName
FROM Customers AS c
LEFT OUTER JOIN Orders AS o
	ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
HAVING COUNT(o.OrderID) > 1;
GO

-- 5. Find the Most Expensive Product in Each Order

SELECT 
	o.OrderID,
	MAX(p.ProductName),
	MAX(Price) AS Most_Expensive_Product
FROM OrderDetails AS o
INNER JOIN Products AS p
	ON o.ProductID = p.ProductID
GROUP BY OrderID;
GO

-- 6. Find the Latest Order for Each Customer

SELECT
	c.CustomerName,
	MAX(o.OrderDate)
FROM Customers AS c
INNER JOIN Orders AS o
	ON c.CustomerID = o.CustomerID
GROUP BY CustomerName;
GO

-- 7. List customers who only purchased items from the 'Electronics' category.

SELECT c.CustomerName
FROM Customers AS c
RIGHT JOIN Orders AS o
	ON c.CustomerID = o.CustomerID
LEFT JOIN OrderDetails AS o_d
	ON o.OrderID = o_d.OrderID
LEFT JOIN Products AS p
	ON o_d.ProductID = p.ProductID
GROUP BY c.CustomerName
HAVING SUM(CASE WHEN p.Category = 'Electronics' THEN 1 ELSE 0 END) = COUNT(p.ProductID);
GO

-- 8. List customers who have purchased at least one product from the 'Stationery' category.

SELECT c.CustomerName
FROM Customers AS c
RIGHT JOIN Orders AS o
	ON c.CustomerID = o.CustomerID
LEFT JOIN OrderDetails AS o_d
	ON o.OrderID = o_d.OrderID
LEFT JOIN Products AS p
	ON o_d.ProductID = p.ProductID
GROUP BY c.CustomerName
HAVING SUM(CASE WHEN p.Category = 'Stationery' THEN 1 ELSE 0 END) >= 1;
GO

-- 9. Find Total Amount Spent by Each Customer. Show CustomerID, CustomerName, and TotalSpent.

SELECT c.CustomerID,
	CustomerName,
	ISNULL(SUM(o_d.Quantity * o_d.Price), 0) AS TotalSpent
FROM Customers AS c
LEFT JOIN Orders AS	o
	ON c.CustomerID = o.CustomerID
LEFT JOIN OrderDetails as o_d
	ON o.OrderID = o_d.OrderID
GROUP BY c.CustomerID, CustomerName;
GO