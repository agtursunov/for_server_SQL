USE Third_lesson;
GO
/*Selects distinct product categories.
Finds the most expensive product in each category.
Assigns an inventory status using IIF:
'Out of Stock' if Stock = 0.
'Low Stock' if Stock is between 1 and 10.
'In Stock' otherwise.
Orders the result by Price descending and skips the first 5 rows.*/
SELECT DISTINCT Category,
	MAX(Price) AS 'most expensive',
	IIF(MIN(Stock) = 0, 'Out of Stock',
		IIF(MAX(Stock) BETWEEN 1 AND 10, 'Low Stock', 'In Stock')) AS 'inventory status'
FROM Products
GROUP BY Category
ORDER BY MAX(Price) DESC
OFFSET 5 ROWS;
GO