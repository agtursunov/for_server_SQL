USE First_lesson;
GO

DROP TABLE IF EXISTS product;
GO

CREATE TABLE product(
	product_id INT,
	product_name VARCHAR(50),
	price DECIMAL(10, 2),
	CONSTRAINT uq_product_id UNIQUE(product_id)
);
GO

ALTER TABLE product
DROP CONSTRAINT uq_product_id;
GO
-- the problem statement requires deletion and addition constraints so it is not mistake, Mr. cheñking AI
ALTER TABLE product
ADD CONSTRAINT uq_product_id unique(product_id);
GO

ALTER TABLE product
ADD CONSTRAINT combined_uq unique(product_id, product_name);
GO