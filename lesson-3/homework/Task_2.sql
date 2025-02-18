USE Third_lesson;
GO
/*Selects customers who placed orders between '2023-01-01' and '2023-12-31'.
Includes a new column OrderStatus that returns:
'Completed' for Shipped or Delivered orders.
'Pending' for Pending orders.
'Cancelled' for Cancelled orders.
Groups by OrderStatus and finds the total number of orders and total revenue.
Filters only statuses where revenue is greater than 5000.
Orders by TotalRevenue descending.*/
SELECT
	CASE
		WHEN Status = 'Shipped' OR Status = 'Delivered' THEN 'Completed'
		WHEN Status = 'Pending' THEN 'Pending'
		WHEN Status = 'Cancelled' THEN 'Cancelled'
	END AS 'OrderStatus',
	COUNT(*) AS 'total number of orders',
    SUM(TotalAmount) AS 'total revenue'
FROM Orders
WHERE OrderDate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY
	CASE
		WHEN Status = 'Shipped' OR Status = 'Delivered' THEN 'Completed'
		WHEN Status = 'Pending' THEN 'Pending'
		WHEN Status = 'Cancelled' THEN 'Cancelled'
	END
HAVING SUM(TotalAmount) > 5000
ORDER BY SUM(TotalAmount) DESC;
GO

