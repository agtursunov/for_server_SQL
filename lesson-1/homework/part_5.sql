USE First_lesson;
GO

DROP TABLE IF EXISTS account;
GO

CREATE TABLE account(
	account_id INT PRIMARY KEY,
	balance DECIMAL(10, 2),
	account_type NVARCHAR(8),
	CONSTRAINT C_balance CHECK (balance >= 0),
	CONSTRAINT C_account_type CHECK(account_type = 'Saving'or account_type = 'Checking')
);

ALTER TABLE account
DROP CONSTRAINT C_balance;
GO

ALTER TABLE account
ADD CONSTRAINT C_balance CHECK (balance >= 0);
Go

ALTER TABLE account
DROP CONSTRAINT C_account_type;
GO

ALTER TABLE account
ADD CONSTRAINT C_account_type CHECK(account_type = 'Saving'or account_type = 'Checking');
Go