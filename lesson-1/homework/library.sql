CREATE DATABASE First_lesson_library
GO

USE First_lesson_library;
GO
DROP TABLE IF EXISTS loan;
GO
DROP TABLE IF EXISTS book;
GO
DROP TABLE IF EXISTS members;
GO

CREATE TABLE book(
	book_id INT IDENTITY(100, 1) PRIMARY KEY,
	title NVARCHAR(100),
	author NVARCHAR(100),
	published_year INT
);
GO

CREATE TABLE members(
	member_id INT IDENTITY(1, 1) PRIMARY KEY,
	name NVARCHAR(100),
	email NVARCHAR(100),
	phone_number NVARCHAR(100)
);
GO

CREATE TABLE loan(
	loan_id INT IDENTITY(1, 1) PRIMARY KEY,
	book_id INT FOREIGN KEY REFERENCES book(book_id),
	member_id INT FOREIGN KEY REFERENCES members(member_id),
	loan_date DATE,
	return_date DATE DEFAULT NULL
);
GO
INSERT INTO book
VALUES
	('1984', 'Oruel', 1948),
	('Harry Poter', 'the author', 2007),
	('War and Peace', 'Lev Tolstoy', 1867);

GO
INSERT INTO members
VALUES
	('Azizbek', 'aziz@mail.ru', '+7777797'),
	('Lazizbek', 'laziz@mail.ru', '+7555555');
GO
INSERT INTO loan(book_id, member_id, loan_date, return_date)
VALUES
	(101, 2, '2025-01-12', '2025-02-14'),
	(102, 2, '2025-01-13', '2025-02-15'),
	(101, 1, '2025-01-5', '2025-02-10');
GO 
INSERT INTO loan(book_id, member_id, loan_date)
VALUES
	(100, 2, '2025-01-12');
GO
SELECT * FROM book;
SELECT * FROM members;
SELECT * FROM loan;