USE SoftUni

GO

CREATE FUNCTION ufn_IsWordComprised(@setOfLetters nvarchar(255), @word nvarchar(255))
 RETURNS bit
 AS
 BEGIN 
     DECLARE @length INT = LEN(@word)
	 DECLARE @index INT = 1

	 WHILE(@index <= @length)
		BEGIN
			DECLARE @char CHAR(1) = SUBSTRING(@word, @index, 1)

			IF(CHARINDEX(@char, @setOfLetters) <= 0)
				BEGIN
					RETURN 0
				END

			SET @index +=1
		END

	RETURN 1
 END

 GO

 select dbo.ufn_IsWordComprised ('sofia', 'siso')
