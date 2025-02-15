USE First_lesson;
GO

DROP TABLE IF EXISTS orders;
GO

CREATE TABLE orders(
	order_id INT,
	customer_name NVARCHAR(50),
	order_date DATE,
	CONSTRAINT PK_orders PRIMARY KEY(order_id)
);
GO

ALTER TABLE orders
DROP CONSTRAINT PK_orders;
GO

ALTER TABLE orders
ADD CONSTRAINT PK_orders PRIMARY KEY(order_id);
GO