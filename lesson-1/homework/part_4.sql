USE First_lesson;
GO

DROP TABLE IF EXISTS category;
GO

CREATE TABLE category(
	category_id INT PRIMARY KEY,
	category_name NVARCHAR(50)
);
GO

DROP TABLE IF EXISTS item;
GO

CREATE TABLE item(
	item_id INT PRIMARY KEY,
	item_name NVARCHAR(50),
	category_id INT,
	CONSTRAINT FK_item_category FOREIGN KEY (category_id) REFERENCES category(category_id)
);
GO

ALTER TABLE item
DROP CONSTRAINT FK_item_category;
GO

ALTER TABLE item
ADD CONSTRAINT FK_item_cotegory FOREIGN KEY(category_id) REFERENCES category(category_id); 
GO
