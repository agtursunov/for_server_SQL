USE First_lesson;
GO

DROP TABLE IF EXISTS customer;
GO

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    name NVARCHAR(50),
    city NVARCHAR(50) DEFAULT 'Unknown'
);
GO

ALTER TABLE customer
DROP CONSTRAINT [DF__customer__city__793DFFAF];
GO

ALTER TABLE customer
ADD CONSTRAINT DF_customer_city DEFAULT 'Unknown' FOR city
GO
