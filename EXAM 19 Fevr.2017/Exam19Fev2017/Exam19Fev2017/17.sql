USE Bakery

go

CREATE FUNCTION udf_GetRating(@Name VARCHAR(200))
RETURNS VARCHAR (10)
BEGIN

	DECLARE @Rate DECIMAL(10,8)=  (SELECT AVG(f.Rate) FROM Feedbacks AS f 
	JOIN Products AS p ON f.ProductId = P.Id
	WHERE p.Name = @Name) 

	DECLARE @AvgRate VARCHAR(20)
		IF(@Rate>0 AND @Rate<5)
			BEGIN
				SET @AvgRate = 'Bad'
			END
		else IF(@Rate BETWEEN 5 AND 8)
			BEGIN
				SET @AvgRate = 'Average'
			END
		else IF(@Rate>8)
			BEGIN
				SET @AvgRate = 'Good'
			END
		ELSE
			BEGIN
				SET @AvgRate = 'No rating'
			END


	RETURN @AvgRate
END

go

SELECT 
--TOP 5 
Id, Name, dbo.udf_GetRating(Name)
  FROM Products
 ORDER BY Id
