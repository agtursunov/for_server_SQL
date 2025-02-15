USE First_lesson;
GO

DROP TABLE IF EXISTS invoice;
GO

CREATE TABLE invoice(
	invoice_id INT IDENTITY(1, 1),
	amount DECIMAL(10, 2)
);
GO

INSERT INTO invoice(amount)
VALUES
	(120.50),
	(456.00),
	(935.75),
	(10956),
	(49865.48);
GO

SET IDENTITY_INSERT invoice ON;

INSERT INTO invoice(invoice_id, amount)
VALUES
	(100, 99999.99);
GO
SET IDENTITY_INSERT invoice OFF;