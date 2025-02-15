USE First_lesson;
GO

DROP TABLE IF EXISTS books;
GO

CREATE TABLE books(
	book_id INT IDENTITY PRIMARY KEY,
	title NVARCHAR(100) NOT NULL,
	price DECIMAL(10, 2) CHECK(price > 0),
	genre NVARCHAR(100) DEFAULT 'Unknown'
);
GO

INSERT INTO books
VALUES
	('1984', 19999.89, 'political fantastic'),
	('Harry Poter', 219899.79, 'teenagers fantastic'),
	('War and Peace', 85899, 'historic'),
	('Atomic habits', 25699.99, 'personal developing');
GO
INSERT INTO books(title, price)
VALUES
	('Romeo and Juliet', 105.05);
GO