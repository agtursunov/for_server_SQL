USE Fourth_lesson;
GO

DROP TABLE IF EXISTS letters;
GO

CREATE TABLE letters
	(letter CHAR(1));

INSERT INTO letters
VALUES ('a'), ('a'), ('a'), 
  ('b'), ('c'), ('d'), ('e'), ('f');
GO

-- Order letters but 'b' must be first
SELECT *
FROM letters
ORDER BY 
	CASE 
		WHEN letter =  'b' THEN 0
		ELSE 1
	END,
	letter;
GO
-- Order letters but 'b' must be last
SELECT *
FROM letters
ORDER BY 
	CASE 
		WHEN letter =  'b' THEN 1
		ELSE 0
	END,
	letter;
GO
-- Order letters but 'b' must be 3rd (Optional)
SELECT *
FROM letters
ORDER BY 
    CASE 
        WHEN letter = 'b' THEN 3
        ELSE ROW_NUMBER() OVER (ORDER BY letter)
    END;
GO